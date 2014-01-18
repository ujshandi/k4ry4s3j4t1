unit MekanikPendapatan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmMekanikPendapatan = class(TForm)
    MainPanel: TPanel;
    pnlFilter: TPanel;
    d: TBevel;
    l: TLabel;
    Bevel1: TBevel;
    btnReset: TButton;
    cmbOpr1: TComboBox;
    dtpDari1: TDateTimePicker;
    dtpSampai1: TDateTimePicker;
    StaticText1: TStaticText;
    btnOk: TButton;
    StaticText2: TStaticText;
    cmbMekanik: TComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    asgRekap: TAdvStringGrid;
    btnPrint: TButton;
    btnFilter: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDetail: TButton;
    StaticText3: TStaticText;
    rbItem: TRadioButton;
    rbTrans: TRadioButton;
    Bevel2: TBevel;
    procedure btnFilterClick(Sender: TObject);
    procedure asgRekapExpandNode(Sender: TObject; ARow, ARowreal: Integer);
    procedure btnOkClick(Sender: TObject);
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnPrintClick(Sender: TObject);
    procedure cmbOpr1Select(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }

    procedure InitFIlter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadGrid;
    procedure ReloadKumulatif;//global
    procedure ReloadGlobal;//global--ngaganti kumulatif piutang di split = reg/ksg/comp
    function getTransType:string;
  public
    procedure Execute;
  end;

var
  frmMekanikPendapatan: TfrmMekanikPendapatan;

implementation

uses Subroutines, MainMenu, UConst, un_ryu, UMaster, UTransaction,
  SQLServerConnections, AutoBengkel, PendapatanMekanikItemPrint2,
  PendapatanMekanikPrint;
const
  {Master}
  colNo = 0;
  colCode = 1;
  colName = 2;
  colID = 6;

  {DETAIL}
  coldDate = 1;
  coldTrans = 2;
  coldTotal = 3;
  coldTransId = 7;

  {SUBDETAIL}
  colsCode = 1;
  colsName =2;
  colsQty =3;
  colsPrice = 4;
  colsAmount = 5;

  {global}
  colgJenis = 1;
  colgBruto = 2;
  colgDiskon = 3;
  colgPiutang = 4;
  colgPiutang2 = 5;
  colgPiutang3 = 6;
  colgNetto = 7;
  colgRetur = 8;

  colgTransId = 9;
  colgId = 10;
{$R *.dfm}

{ TfrmMekanikPendapatan }

procedure TfrmMekanikPendapatan.ArrangeColSize;
begin
  asgRekap.AutoSizeColumns(True,2);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then  EXIT;

  if rbItem.Checked then begin
    asgRekap.ColWidths[colgId] := 0;
    asgRekap.ColWidths[colgTransId] := 0;
  end
  else begin
    asgRekap.ColWidths[colId] := 0;
    asgRekap.ColWidths[coldTransId] := 0;
  end;
end;

procedure TfrmMekanikPendapatan.Execute;
begin
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  pnlFilter.Height := 90;
  SetFilterSize(pnlFilter,btnFilter,90);
  InitForm;
  Run(Self);
end;

procedure TfrmMekanikPendapatan.InitFIlter;
begin
  TPersons_Arr.GetList(G_CUSTOMER_LIST,FormatSQLString(PS_TYPE_MECHANIC),False,0,True);
  NameValueListToValueList(G_CUSTOMER_LIST,cmbMekanik.Items);
  cmbMekanik.ItemIndex := cmbMekanik.Items.Count-1;
  cmbOpr1.ItemIndex := 3;
  cmbOpr1Select(Self);
  rbItem.Checked := True;
  dtpDari1.DateTime := ServerNow-7;
  dtpSampai1.DateTime:= ServerNow;

end;

procedure TfrmMekanikPendapatan.InitForm;
begin
  InitFIlter;
  InitGrid;
end;

procedure TfrmMekanikPendapatan.InitGrid;
begin
  asgRekap.ExpandAll;
  asgRekap.Clear;


  if rbTrans.Checked then  begin
    ResetGrid(asgRekap,2,9,1,1);
    with asgRekap do begin
      Cells[colNo,0]  := 'No.';
      Cells[colCode,0]:= 'ID.Mekanik';
      Cells[colName,0]:= 'Nama Mekanik';
      Cells[colId,0 ] := 'iD';
    end;
  end;

  if rbItem.Checked then begin  //global
    ResetGrid(asgRekap,2,12,1,1);
    asgRekap.MergeCells(colCode,0,8,1);
  end;
  ArrangeColSize;
end;

procedure TfrmMekanikPendapatan.ReloadGrid;
var vMekanik : TPersons_Arr;
  i,j,k,vRow,vRow2,vRow3 : integer;
  vShipment : TShipment_Arr;
  vDetail : TItemDetail_Arr;
  vService : TServiceDetail_Arr;
  vTotalPart, vTotalService : Double;
  procedure SetHeader(ARow:integer);
  begin
    SetCellColor(asgRekap,clSkyBlue,coldDate,ARow,colsAmount);
    with asgRekap do begin
      Cells[coldDate,Arow] := 'Tanggal';
      Cells[coldTrans,Arow] := 'No.Trans';
      Cells[coldTotal,Arow] := 'Total';
    end;
  end;

  procedure SetFilter;
  begin
    GlobalPeriode.Reset;
    //SetPeriodeObject(GlobalPeriode,cmbOpr1.ItemIndex,dtpDari1,dtpSampai1);
    GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date,False);
    vMekanik.Filter.PersonType := PS_TYPE_MECHANIC;
    vMekanik.Filter.PersonId   := StrToInt(G_CUSTOMER_LIST.Names[cmbMekanik.itemIndex]);
  end;

  procedure SetSubdetailHeader(ARow:integer;isPart:boolean);
  begin
    SetCellColor(asgRekap,clSilver,coldDate,ARow,colsAmount);
    with asgRekap do begin
      Cells[colsCode,Arow] := 'Kode '+ IfThen(isPart,'Part','Service');
      Cells[colsName,Arow] := 'Nama '+ IfThen(isPart,'Part','Service');
      Cells[colsQty,Arow]  := 'Qty';
      Cells[colsPrice,Arow]:= 'Harga';
      Cells[colsAmount,Arow]:= 'Subtotal';
    end;
  end;

begin
  vShipment := TShipment_Arr.Create;
  try
    Screen.Cursor := crSQLWait;
    vMekanik := TPersons_Arr.Create;

    vDetail  := TItemDetail_Arr.Create;
    vService := TServiceDetail_Arr.Create;
    InitGrid;
    SetFilter;
    frmMainMenu.Gauge.Show;

    vMekanik.FindFlat(True,'s.mekanik_id');
    for i:= 0 to vMekanik.Count-1 do begin
     frmMainMenu.Gauge.Progress := round((i+1)/(vMekanik.Count)*100);
      with asgRekap do begin
        vRow := RowCount-1;
        Ints[colNo,vRow]    := i+1;
        Cells[colCode,vRow] := vMekanik[i].PersonCode;
        Cells[colName,vRow] := vMekanik[i].PersonName;
        Ints[colId,vRow]    := vMekanik[i].PersonId;
        AddRow;

        vShipment.Clear;
        vShipment.Filter.Shipment.PersonsMekanik_Id.PersonId := vMekanik[i].PersonId;
        vShipment.Filter.Shipment.ShipType := SHIP_TYPE_SERVICE;
        vShipment.Filter.Shipment.IsPost := True;
        vShipment.FindOnDb('',True);
        for j:= 0 to vShipment.Count-1 do begin
          vRow2 := RowCount-1;
          SetHeader(vRow2);
          AddRow;
          vRow2 := RowCount-1;
          Cells[coldDate,vRow2] := NewFormatDate(vShipment[j].ShipDate);
          Cells[coldTrans,vRow2]:= vShipment[j].ShipNum;
          Floats[coldTotal,vRow2]:= vShipment[j].Total;
          Ints[coldTransId,vRow2]:= vShipment[j].ShipId;

           {blok service}
          AddRow;
          vRow3 := RowCount-1;
          SetSubdetailHeader(vRow3,False);
          AddRow;
          vService.Clear;
          vService.FindOnDb(vShipment[j].ShipId);
          for k:= 0 to vService.Count-1 do begin
             vRow3 := RowCount-1;
             Cells[colsCode,vRow3] := vService[k].Services.ServiceCode;
             Cells[colsName,vRow3] := vService[k].Services.ServiceName;
             Floats[colsQty,vRow3] := vService[k].Quantity;
             Floats[colsPrice,vRow3]:= vService[k].Price;
             Floats[colsAmount,vRow3]:= vService[k].Amount;
              Ints[coldTransId,vRow3]:= vService[k].Shipment.ShipId;
             AddRow;
          end;
          vRow3 := RowCount-1;
          SetCellColor(asgRekap,clSilver,colsPrice,vRow3,colsAmount);
          Cells[colsPrice,vRow3] := 'Total Service';
          vTotalService := ColumnSum(colsAmount,vRow2+1,vRow3-1);//ColumnSum(colsAmount,vRow2+4+vDetail.Count,vRow3-1);
          Floats[colsAmount,vRow3] := vTotalService;
          Ints[coldTransId,vRow3] := 1;//untuk nandain alignment
          AddRow;
          
          vRow3 := RowCount-1;
          MergeCells(colsCode,vRow3,5,1);
          RowHeights[vRow3] := 5;
          //Ints[coldTransId,vRow3] := -2;//jang nandaan row pembatas antara part dan service
          //AddRow;
          
          {Blok item_detail}
          AddRow;
          vRow3 := RowCount-1;
          SetSubdetailHeader(vRow3,True);
          AddRow;
          vDetail.Clear;
          vDetail.FindOnDB(vShipment[j].ShipId);
          for k:= 0 to vDetail.Count-1 do begin
             vRow3 := RowCount-1;
             Cells[colsCode,vRow3] := vDetail[k].ItemBalance.Items.ItemCode;
             Cells[colsName,vRow3] := vDetail[k].ItemBalance.Items.ItemName;
             Floats[colsQty,vRow3] := vDetail[k].Quantity;
             Floats[colsPrice,vRow3]:= vDetail[k].Price;
             Floats[colsAmount,vRow3]:= vDetail[k].Amount;
             Ints[coldTransId,vRow3]:= vDetail[k].Shipment.ShipId;
             AddRow;
          end;
          //end;
          vRow3 := RowCount-1;
          MergeCells(colsCode,vRow3,3,1);
          SetCellColor(asgRekap,clSilver,colsPrice,vRow3,colsAmount);
          Cells[colsPrice,vRow3] := 'Total Part';
          vTotalPart := ColumnSum(colsAmount,vRow2+4+vDetail.Count,vRow3-1);//ColumnSum(colsAmount,vRow2+1,vRow3-1);
          Floats[colsAmount,vRow3] := vTotalPart;
          Ints[coldTransId,vRow3] := 1;//untuk nandain alignment
          AddRow;



          vRow3 := RowCount-1;
          SetCellColor(asgRekap,clSkyBlue,colsCode,vRow3,colsAmount);
          MergeCells(colsCode,vRow3,3,1);
          Cells[colsPrice,vRow3] := 'Total Part & Service';
          Floats[colsAmount,vRow3] := vTotalPart + vTotalService;
          Ints[coldTransId,vRow3] := 1;//untuk nandain alignment
          AddRow;
          vRow3 := RowCount-1;
          MergeCells(colsCode,vRow3,5,1);
          RowHeights[vRow3] := 5;
          AddRow;
        end;
        //AddRow;
        vRow2 := RowCount-1;
        AddNode(vRow,vRow2-vRow-1);
        //AddRow;
      end;
    end;
    frmMainMenu.Gauge.Hide;
    DeleteRowTerakhir(asgRekap,2,1);
  finally
    ArrangeColSize;
    vMekanik.Free;
    vShipment.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMekanikPendapatan.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,90);
end;

procedure TfrmMekanikPendapatan.asgRekapExpandNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  ArrangeColSize;
end;

procedure TfrmMekanikPendapatan.btnOkClick(Sender: TObject);
begin
   //ReloadGrid;
 if rbItem.Checked then
   ReloadGlobal
//   ReloadKumulatif
 else if rbTrans.Checked then
   ReloadGrid;
end;

procedure TfrmMekanikPendapatan.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if rbTrans.Checked then begin
    if ARow = 0 then
           HAlign := taCenter
    else if (asgRekap.Ints[colID,ARow] = 0)and (asgRekap.Ints[coldTransId,ARow] = 0) then
       HAlign := taCenter
     else if (asgRekap.Ints[coldTransID,ARow] > 0) then begin
       if ACol in [coldTotal,colSPrice,colsAmount,colsQty] then
         HAlign := taRightJustify;
     end;
  end
  else if rbItem.Checked then begin //tipe global
    if ARow = 0 then
      HAlign := taCenter
    else if  (asgRekap.Ints[colgID,ARow] = 0)and (asgRekap.Ints[colgTransId,ARow] = 0) then
       HAlign := taCenter
    else if  (asgRekap.Ints[colgTransID,ARow] > 0) then begin
       if ACol in [colgBruto,colgDiskon,colgNetto,colgPiutang,colgPiutang2,colgPiutang3] then
         HAlign := taRightJustify;
    end;
  end;
end;

procedure TfrmMekanikPendapatan.btnPrintClick(Sender: TObject);
begin
  if rbItem.Checked then begin  //global
    Application.CreateForm(TqrpPendapatanMekanikItem2,qrpPendapatanMekanikItem2);
    qrpPendapatanMekanikItem2.Executes(asgRekap,'');
    qrpPendapatanMekanikItem2.Free;
  end
  else begin
    Application.CreateForm(TqrpPendapatanMekanik,qrpPendapatanMekanik);
    qrpPendapatanMekanik.Executes(asgRekap);
    qrpPendapatanMekanik.Free;
  end
end;

procedure TfrmMekanikPendapatan.cmbOpr1Select(Sender: TObject);
begin
  dtpSampai1.Enabled := (cmbOpr1.ItemIndex=3);
end;

procedure TfrmMekanikPendapatan.ReloadKumulatif;
var vMekanik : TPersons_Arr;
  i,vRow:integer;
  vShipment : TShipment_Arr;
  vBruto, vDiskon, vPiutang, vNetto : Double;
  vBrutoGrand, vDiskonGrand, vPiutangGrand, vNettoGrand : Double;

  procedure SetHeader(ARow:integer);
  begin
    SetCellColor(asgRekap,clSkyBlue,coldDate,ARow,colsAmount);
    with asgRekap do begin
      Cells[coldDate,Arow] := 'Tanggal';
      Cells[coldTrans,Arow] := 'No.Trans';
      Cells[coldTotal,Arow] := 'Total';
    end;
  end;

  procedure SetHeaderGlobal(pRow:integer);
  begin
    SetCellColor(asgRekap,clSkyBlue,coldDate,pRow,colgNetto);
    with asgRekap do begin
      Cells[colgJenis,pRow] := 'Jenis';
      Cells[colgBruto,prow] := 'Subtotal';
      Cells[colgDiskon,prow] := 'Diskon';
      Cells[colgPiutang,prow] := 'Piutang';
      Cells[colgNetto,prow] := 'Netto';
    end;
  end;

  procedure SetFilter;
  begin
    GlobalPeriode.Reset;
    //SetPeriodeObject(GlobalPeriode,cmbOpr1.ItemIndex,dtpDari1,dtpSampai1);
    GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date,false);
    vMekanik.Filter.PersonType := PS_TYPE_MECHANIC;
    vMekanik.Filter.PersonId   := StrToInt(G_CUSTOMER_LIST.Names[cmbMekanik.itemIndex]);
  end;

  procedure setVaalue(pRow,AMekanikId:integer;AType:string);
  begin
    with asgRekap do  begin
      case AType[1] of
        SERVICE_TYPE_OTHERS : Cells[colgJenis,vRow ]:= 'Lain';
        SERVICE_TYPE_SINGLE : Cells[colgJenis,vRow ]:= 'Jasa';
        ITEM_TYPE_OIL  : Cells[colgJenis,vRow ]:= 'Oli';
        ITEM_TYPE_PART : Cells[colgJenis,vRow ]:= 'Part';
      end;
      //ti rekap vBruto  := TShipment.getValueItemType('d.price*d.quantity',GlobalPeriode,MasterPurpose,AType,0,getTransType,vPostCriteria);
      vBruto := TShipment.getValueItemType('d.price*d.quantity',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId);
      vDiskon :=TShipment.getValueItemType('d.discount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId);
      //vPiutang:= 0;
      //vNetto := TShipment.getValueItemType('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId);
      vPiutang:= TShipment.getValueItemType2('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId,boTrue,True); //boFalse,True);
      //ti rekap vNetto  := TShipment.getValueItemType2('d.amount',GlobalPeriode,MasterPurpose,AType,0,vPostCriteria,False,False); //boTrue,False);
      vNetto  := TShipment.getValueItemType2('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId,boTrue,False); //boTrue,False);
      Floats[colgBruto,vRow]:= vBruto;
      Floats[colgDiskon,vRow]:= vDiskon;
      Floats[colgPiutang,vRow]:= vPiutang;
      Floats[colgNetto,vRow] := vNetto;
      Ints[coldTransId,vRow]  := 1;//buat nandaan alignment
      vBrutoGrand := vBrutoGrand + vBruto;
      vDiskonGrand := vDiskonGrand + vDiskon;
      vPiutangGrand := vPiutangGrand + vPiutang;
      vNettoGrand := vNettoGrand + vNetto;
    end;
  end;

  procedure SetFooter(pRow:integer);
  var tmpRow : integer;
  begin
    SetCellColor(asgRekap,clSkyBlue,coldDate,pRow,colgNetto);
    with asgRekap do begin
      Cells[colgJenis,pRow] := 'Subtotal';
      Floats[colgBruto,prow]   := asgRekap.ColumnSum(colgBruto,pRow-4,pRow-1);
      Floats[colgDiskon,prow]  := asgRekap.ColumnSum(colgDiskon,pRow-4,pRow-1);
      Floats[colgPiutang,prow] := asgRekap.ColumnSum(colgPiutang,pRow-4,pRow-1);
      Floats[colgNetto,prow]   := asgRekap.ColumnSum(colgNetto,pRow-4,pRow-1);
      Ints[coldTransId,pRow]   := 1;
    end;

    asgRekap.AddRow;
    tmpRow := asgRekap.RowCount-1;
    asgRekap.MergeCells(colgJenis,tmpRow,5,1);
    asgRekap.RowHeights[tmpRow] := 10;
  end;

  procedure SetSubdetailHeader(ARow:integer;isPart:boolean);
  begin
    SetCellColor(asgRekap,clSilver,coldDate,ARow,colsAmount);
    with asgRekap do begin
      Cells[colsCode,Arow] := 'Kode '+ IfThen(isPart,'Part','Service');
      Cells[colsName,Arow] := 'Nama '+ IfThen(isPart,'Part','Service');
      Cells[colsQty,Arow]  := 'Qty';
      Cells[colsPrice,Arow]:= 'Harga';
      Cells[colsAmount,Arow]:= 'Subtotal';
    end;
  end;

begin
  vShipment := TShipment_Arr.Create;
  try
    Screen.Cursor := crSQLWait;
    vMekanik := TPersons_Arr.Create;

    InitGrid;
    SetFilter;
    frmMainMenu.Gauge.Show;
    vBrutoGrand:= 0; vDiskonGrand:= 0; vPiutangGrand:= 0; vNettoGrand:= 0;
    vMekanik.FindFlat(True,'s.mekanik_id');
    for i:= 0 to vMekanik.Count-1 do begin
     frmMainMenu.Gauge.Progress := round((i+1)/(vMekanik.Count)*100);
     vBruto := 0; vDiskon:= 0; vPiutang:= 0; vNetto:= 0;
      with asgRekap do begin
        vRow := RowCount-1;
        Ints[colNo,vRow]    := i+1;
        MergeCells(colCode,vRow,5,1);
        Cells[colCode,vRow] := 'Mekanik '+'<p><b>'+vMekanik[i].PersonName+'</b></p>';
        Ints[colId,vRow]    := vMekanik[i].PersonId;

    //tambah header
        AddRow;
        vRow := RowCount-1;
        SetHeaderGlobal(vRow);
    //jasa
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,SERVICE_TYPE_SINGLE);
    //other
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,SERVICE_TYPE_OTHERS);
    //oli
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,ITEM_TYPE_OIL);
    //part
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,ITEM_TYPE_PART);
    //footer subtotal
        AddRow;
        vRow := RowCount-1;
        SetFooter(vRow);


        MergeCells(colNo,vRow-6,1,7);
        AddRow;
      end;
    end;

  ////set grand footer
    with asgRekap do begin
      //AddRow;
      vRow := RowCount-1;
      Cells[colgJenis,vRow] := 'Grand Total';
      Floats[colgBruto,vRow]   := vBrutoGrand;
      Floats[colgDiskon,vRow]  := vDiskonGrand;
      Floats[colgPiutang,vRow] := vPiutangGrand;
      Floats[colgNetto,vRow]   := vNettoGrand;
      Ints[coldTransId,vRow]    := 1;// jang nandaan alignment
      AddRow;
    end;
    frmMainMenu.Gauge.Hide;
    DeleteRowTerakhir(asgRekap,2,1);
  finally
    ArrangeColSize;
    Screen.Cursor := crDefault;
    vMekanik.Free;
    vShipment.Free;
  end;

end;

procedure TfrmMekanikPendapatan.btnResetClick(Sender: TObject);
begin
  InitFIlter;
end;

function TfrmMekanikPendapatan.getTransType: string;
begin
  Result := '';
end;

procedure TfrmMekanikPendapatan.ReloadGlobal;
var vMekanik : TPersons_Arr;
  i,vRow:integer;
  vShipment : TShipment_Arr;
  vBruto, vDiskon, vPiutang,vPiutang2,vPiutang3, vNetto,vRetur : Double;
  vBrutoGrand, vDiskonGrand, vPiutangGrand,vPiutangGrand2,vPiutangGrand3, vNettoGrand,vReturGrand : Double;

  procedure SetHeaderGlobal(pRow:integer);
  begin
    SetCellColor(asgRekap,clSkyBlue,coldDate,pRow,colgNetto);
    with asgRekap do begin
      Cells[colgJenis,pRow] := 'Jenis';
      Cells[colgBruto,prow] := 'Subtotal';
      Cells[colgDiskon,prow] := 'Diskon';
      Cells[colgPiutang,prow] := 'Piutang Reg.';
      Cells[colgPiutang2,prow] := 'Piutang KSG';
      Cells[colgPiutang3,prow] := 'Piutang Comp.';
      Cells[colgNetto,prow] := 'Netto';
      Cells[colgRetur,prow] := 'Retur';
    end;
  end;

  procedure SetFilter;
  begin
    GlobalPeriode.Reset;
    //SetPeriodeObject(GlobalPeriode,cmbOpr1.ItemIndex,dtpDari1,dtpSampai1);
    GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date,false);
    vMekanik.Filter.PersonType := PS_TYPE_MECHANIC;
    vMekanik.Filter.PersonId   := StrToInt(G_CUSTOMER_LIST.Names[cmbMekanik.itemIndex]);
  end;

  procedure setVaalue(pRow,AMekanikId:integer;AType:string);
  begin
    with asgRekap do  begin
      case AType[1] of
        SERVICE_TYPE_OTHERS : Cells[colgJenis,vRow ]:= 'Lain';
        SERVICE_TYPE_SINGLE : Cells[colgJenis,vRow ]:= 'Jasa';
        ITEM_TYPE_OIL  : Cells[colgJenis,vRow ]:= 'Oli';
        ITEM_TYPE_PART : Cells[colgJenis,vRow ]:= 'Part';
      end;
      //ti rekap vBruto  := TShipment.getValueItemType('d.price*d.quantity',GlobalPeriode,MasterPurpose,AType,0,getTransType,vPostCriteria);
      vBruto := TShipment.getValueItemType('d.price*d.quantity',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId,'',boNone);//,'',boTrue);
      vDiskon :=TShipment.getValueItemType('d.discount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId);

      //vPiutang:= 0;
      //vNetto := TShipment.getValueItemType('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId);
      //vPiutang:= TShipment.getValueItemType2('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId,boTrue,True); //boFalse,True);
      vPiutang := 0; vPiutang2 := 0; vPiutang3 := 0;

      vPiutang := TShipment.getValueItemType3('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,SHIP_SERVICE_TYPE_REG,AMekanikId,boFalse,True,False); //boNone,True); //boFalse,True);
      vPiutang2 := TShipment.getValueItemTypE3('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,SHIP_SERVICE_TYPE_KSG,AMekanikId,boNone,True,False); //boNone,True); //boFalse,True);
      vPiutang3 := TShipment.getValueItemType3('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,SHIP_SERVICE_TYPE_COMP,AMekanikId,boFalse,True,False); //boNone,True); //boFalse,True);

      //ti rekap vNetto  := TShipment.getValueItemType2('d.amount',GlobalPeriode,MasterPurpose,AType,0,vPostCriteria,False,False); //boTrue,False);
      vNetto  := TShipment.getValueItemType2('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,AType,AMekanikId,boTrue,False); //boTrue,False);
      vRetur  := 0;
      Floats[colgBruto,vRow]:= vBruto;
      Floats[colgDiskon,vRow]:= vDiskon;
      Floats[colgPiutang,vRow]:= vPiutang;
      Floats[colgPiutang2,vRow]:= vPiutang2;
      Floats[colgPiutang3,vRow]:= vPiutang3;
      Floats[colgRetur,vRow] := vRetur;
      Floats[colgNetto,vRow] := vNetto;
      Ints[colgTransId,vRow]  := 1;//buat nandaan alignment
      vBrutoGrand := vBrutoGrand + vBruto;
      vDiskonGrand := vDiskonGrand + vDiskon;
      vPiutangGrand := vPiutangGrand + vPiutang;
      vPiutangGrand2 := vPiutangGrand2 + vPiutang2;
      vPiutangGrand3 := vPiutangGrand3 + vPiutang3;
      vNettoGrand := vNettoGrand + vNetto;
      vReturGrand := vReturGrand + vRetur;
    end;
  end;

  procedure SetFooter(pRow:integer);
  var tmpRow : integer;
  begin
    SetCellColor(asgRekap,clSkyBlue,coldDate,pRow,colgNetto);
    with asgRekap do begin
      Cells[colgJenis,pRow] := 'Subtotal';
      Floats[colgBruto,prow]   := asgRekap.ColumnSum(colgBruto,pRow-4,pRow-1);
      Floats[colgDiskon,prow]  := asgRekap.ColumnSum(colgDiskon,pRow-4,pRow-1);
      Floats[colgPiutang,prow] := asgRekap.ColumnSum(colgPiutang,pRow-4,pRow-1);
      Floats[colgPiutang2,prow] := asgRekap.ColumnSum(colgPiutang2,pRow-4,pRow-1);
      Floats[colgPiutang3,prow] := asgRekap.ColumnSum(colgPiutang3,pRow-4,pRow-1);
      Floats[colgNetto,prow]   := asgRekap.ColumnSum(colgNetto,pRow-4,pRow-1);
      Floats[colgRetur,prow]   := asgRekap.ColumnSum(colgRetur,pRow-4,pRow-1);
      Ints[colgTransId,pRow]   := 1;
    end;

    asgRekap.AddRow;
    tmpRow := asgRekap.RowCount-1;
    asgRekap.MergeCells(colgJenis,tmpRow,5,1);
    asgRekap.RowHeights[tmpRow] := 10;
  end;

  procedure SetSubdetailHeader(ARow:integer;isPart:boolean);
  begin
    SetCellColor(asgRekap,clSilver,coldDate,ARow,colsAmount);
    with asgRekap do begin
      Cells[colsCode,Arow] := 'Kode '+ IfThen(isPart,'Part','Service');
      Cells[colsName,Arow] := 'Nama '+ IfThen(isPart,'Part','Service');
      Cells[colsQty,Arow]  := 'Qty';
      Cells[colsPrice,Arow]:= 'Harga';
      Cells[colsAmount,Arow]:= 'Subtotal';
    end;
  end;

begin
  vShipment := TShipment_Arr.Create;
  try
    Screen.Cursor := crSQLWait;
    vMekanik := TPersons_Arr.Create;

    InitGrid;
    SetFilter;
    frmMainMenu.Gauge.Show;
    vBrutoGrand:= 0; vDiskonGrand:= 0; vPiutangGrand:= 0;vPiutangGrand2:= 0;vPiutangGrand3:= 0; vNettoGrand:= 0;
    vMekanik.FindFlat(True,'s.mekanik_id');
    for i:= 0 to vMekanik.Count-1 do begin
     frmMainMenu.Gauge.Progress := round((i+1)/(vMekanik.Count)*100);
     vBruto := 0; vDiskon:= 0; vPiutang:= 0; vNetto:= 0;
      with asgRekap do begin
        vRow := RowCount-1;
        Ints[colNo,vRow]    := i+1;
        MergeCells(colCode,vRow,7,1);
        Cells[colCode,vRow] := 'Mekanik '+'<p><b>'+vMekanik[i].PersonName+'</b></p>';
        Ints[colgId,vRow]    := vMekanik[i].PersonId;

    //tambah header
        AddRow;
        vRow := RowCount-1;
        SetHeaderGlobal(vRow);
    //jasa
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,SERVICE_TYPE_SINGLE);
    //other
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,SERVICE_TYPE_OTHERS);
    //oli
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,ITEM_TYPE_OIL);
    //part
        AddRow;
        vRow := RowCount-1;
        setVaalue(vRow,vMekanik[i].PersonId,ITEM_TYPE_PART);
    //footer subtotal
        AddRow;
        vRow := RowCount-1;
        SetFooter(vRow);


        MergeCells(colNo,vRow-6,1,7);
        AddRow;
      end;
    end;

  ////set grand footer
    with asgRekap do begin
      //AddRow;
      vRow := RowCount-1;
      Cells[colgJenis,vRow] := 'Grand Total';
      Floats[colgBruto,vRow]   := vBrutoGrand;
      Floats[colgDiskon,vRow]  := vDiskonGrand;
      Floats[colgPiutang,vRow] := vPiutangGrand;
      Floats[colgPiutang2,vRow] := vPiutangGrand2;
      Floats[colgPiutang3,vRow] := vPiutangGrand3;
      Floats[colgNetto,vRow]   := vNettoGrand;
      Floats[colgRetur,vRow]   := vReturGrand;
      Ints[colgTransId,vRow]    := 1;// jang nandaan alignment
      AddRow;
    end;
    frmMainMenu.Gauge.Hide;
    DeleteRowTerakhir(asgRekap,2,1);
  finally
    ArrangeColSize;
    Screen.Cursor := crDefault;
    vMekanik.Free;
    vShipment.Free;
  end;


end;

end.

