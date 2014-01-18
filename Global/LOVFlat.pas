unit LOVFlat;
{******************************************}
{                                          }
{    Copyright(C) work@home                }
{                                          }
{           All rights reserved            }
{ 30.06.07  utk mengatasi form menghilang  dibuat directive onchange + onEnter


{                                          }
{                                          }
{******************************************}
  {DEFINE ONCHANGE}
  {$DEFINE ONENTER}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,
  Dialogs, Grids, BaseGrid, AdvGrid, DBAdvGrd, DB, ADODB, StdCtrls, AdvEdit,
  ExtCtrls;

type
  TfrmLovFlat = class(TForm)
    DBAdvStringGrid1: TDBAdvStringGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    txtSearch: TAdvEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    procedure txtSearchChange(Sender: TObject);
    procedure DBAdvStringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtSearrchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBAdvStringGrid1GetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure DBAdvStringGrid1GetDisplText(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }

    MasterPurpose,vFilter,TableName : String;
    setHargaJual : boolean;
    procedure RequeryPart;
    procedure ArrangeColSize;
    function setCol:integer;
    procedure NewService;
    procedure NewPart;
    procedure InitForm;
  public
    { Public declarations }
    function Execute(aPurpose,ASearch,aTableName,AFilter:string;isHargaJual:boolean=True):integer;

  end;

var
  frmLovFlat: TfrmLovFlat;

implementation

uses SQLServerConnections, Subroutines, UConst, un_ryu, ServiceAdd,
  ServicePkgAdd, ItemAdd;

const
  colCode = 0;
  colName = 1;
  colStok = 2;
  colPrice = 3;
  colKendaraan = 4;
  colId = 5;
{$R *.dfm}

{ TfrmLovFlat }

function TfrmLovFlat.Execute(aPurpose,ASearch,aTableName,AFilter: string;isHargaJual:boolean):integer;
begin
  {$IFDEF ONENTER}
     txtSearch.ReturnIsTab := False;
  {$ENDIF}
  {$IFDEF ONCHANGE}
     txtSearch.ReturnIsTab := True;
  {$ENDIF}
  setHargaJual := isHargaJual;
  Result := 0;
  MasterPurpose   := aPurpose;


  Self.Caption := 'List Of '+ aTableName;
  TableName       := aTableName;
  txtSearch.Text  := ASearch;
  RadioGroup1.Items.Clear;
  RadioGroup1.Items.Add('Nama');
   RadioGroup1.Items.Add('Kode');
   RadioGroup1.Columns := 2;
  if TableName = 'ITEM' then begin
       RadioGroup1.Items.Add('Kendaraan');
          RadioGroup1.Columns := 3;
  end;


  RadioGroup1.ItemIndex := 0;
  RadioGroup1Click(Self);
  vFilter := AFilter;
  InitForm;
 // RequeryPart;
  //Self.ActiveControl := txtSearch;
  {txtSearch.SetFocus;
  txtSearch.SelStart := length(ASearch);}

 // Self.ShowModal;
 //ShowModal;
 ShowModal;

  if ModalResult = mrOk then           //setCol
    Result:= DBAdvStringGrid1.Ints[colId,DBAdvStringGrid1.Row];
  ADOQuery1.Close;
  txtSearch.Clear;
  vFilter := '';
end;

procedure TfrmLovFlat.RequeryPart;
var SQL,vPricePurchase, vPrice,searchKendaraan,searchItem : string;
begin
  //vPrice := ' ISNULL((SELECT Max(Price) FROM item_price WHERE disable_date IS NULL '+
   //     '  and item_id = i.item_id),I.Price) ';
   vPrice := ' ISNULL((SELECT Price FROM item_price WHERE disable_date IS NULL '+
        '  and item_id = i.item_id and price_id = (select max(price_id) FROM item_price WHERE disable_date IS NULL '+
        '  and item_id = i.item_id )),I.Price) ';

//  vPricePurchase := ' ISNULL((SELECT Max(Price) FROM item_price_purchase WHERE disable_date IS NULL '+
  //            '  and item_id = i.item_id),I.Price_purchase) ';
  vPricePurchase := ' ISNULL((SELECT Max(Price) FROM item_price_purchase WHERE disable_date IS NULL '+
              '  and item_id = i.item_id and price_purchase_id = (select max(price_purchase_id) FROM item_price_purchase WHERE disable_date IS NULL '+
        '  and item_id = i.item_id )),I.Price_purchase) ';
  if txtSearch.Text = '' then exit;
  searchKendaraan := '';
  searchItem := txtSearch.Text;
  if Pos(';',UpperCase(txtSearch.Text))>0 then begin
    searchKendaraan := TrimAll(EkstrakString(txtSearch.Text,';',2));
    searchItem := TrimAll(EkstrakString(txtSearch.Text,';',1));
  end;
//  ShowMessage(MasterPurpose);
  if TableName = 'ITEM' then
    SQL := 'SELECT I.Item_Code as ''Kode Part'', I.item_name as ''Nama Part'''+
          ' , ((SELECT ISNULL(SUM(balance),0) FROM item_balance WHERE item_id = i.item_id '+
             ' AND balance <> 0) -(SELECT ISNULL(SUM(quantity),0) FROM dummy_item_detail '+
                '  WHERE item_id = i.item_id))  AS Stok,'+IfThen(setHargaJual,vPrice,vPricePurchase )+//' I.Price ',' I.Price_Purchase ') +
                'as Harga,m.motor_name as ''Kendaraan'',I.item_id,null AS '' '''+
              ' FROM Items I LEFT OUTER JOIN motor m on I.car_id = m.motor_id '+
{              IfThen(MasterPurpose='NAME',' WHERE i.item_name LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))+
              IfThen(MasterPurpose='CODE',' WHERE i.item_code LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))+
              IfThen(MasterPurpose='KENDARAAN',' WHERE UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase(txtSearch.Text+'%')))
              }
              //ditambah filter kendaraan di name dan kode
              IfThen(MasterPurpose='NAME',' WHERE i.item_name LIKE '+FormatSQLWildCard(searchItem+'%'))+ IfThen(searchKendaraan<>'', ' AND UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase('%'+searchKendaraan+'%')),'')+
              IfThen(MasterPurpose='CODE',' WHERE i.item_code LIKE '+FormatSQLWildCard(searchItem+'%'))+ IfThen(searchKendaraan<>'', ' AND UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase('%'+searchKendaraan+'%')),'')+
              IfThen(MasterPurpose='KENDARAAN',' WHERE UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase(txtSearch.Text+'%')))
  else if TableName = 'SERVICE' then
    SQL := 'SELECT s.service_Code as ''Kode Jasa'', s.service_name as ''Nama Jasa'', s.Price as Harga, null as '' '', null as '' '', s.service_id, null as '' '' '+
              ' FROM Services S '+
              IfThen(MasterPurpose='NAME',' WHERE s.service_name LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))+
              IfThen(MasterPurpose='CODE',' WHERE s.service_code LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))
  else if (TableName = 'SUPPLIER' )then                                  {address as Alamat,}
    SQL := 'SELECT person_code as ''Kode'', person_name as Nama,  address  as ''Alamat'',  null as '' '', null as '' '',p.person_id, NULL AS '' '' '+
          ' FROM Persons p '+
          IfThen(MasterPurpose='CODE',' WHERE person_code LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))+
          IfThen(MasterPurpose='NAME',' WHERE person_name LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))

  else if (TableName = 'CUSTOMER') then                                  {address as Alamat,}
    SQL := 'SELECT distinct person_code as ''Kode'', person_name as Nama,  address  as ''Alamat'',  null as '' '', null as '' '',p.person_id, NULL AS '' '' '+
          ' FROM Persons p left join Persons_Car pc on p.person_id = pc.person_id '+
          IfThen(MasterPurpose='CODE',' WHERE (person_code LIKE '+FormatSQLWildCard(txtSearch.Text+'%')+' or nopol like '+FormatSQLWildCard(txtSearch.Text+'%')+' )' )+
          IfThen(MasterPurpose='NAME',' WHERE (person_name LIKE '+FormatSQLWildCard(txtSearch.Text+'%')+' or nopol like '+FormatSQLWildCard(txtSearch.Text+'%')+' )' )
           //chan 30.11.11
         // IfThen(MasterPurpose='CODE',' WHERE person_code LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))+
          //IfThen(MasterPurpose='NAME',' WHERE person_name LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))

  else if TableName = 'MOTOR' then                                  {address as Alamat,}
    SQL := 'SELECT motor_name as ''Jenis Kendaraan'',NULL AS '' '', null as '' '',  null as '' '', null as '' '',motor_id, NULL AS '' '' '+
          ' FROM Motor '+
       //   IfThen(MasterPurpose='CODE',' WHERE person_code LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))+
          IfThen(MasterPurpose='NAME',' WHERE motor_name LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))
  else if TableName = 'ACCOUNT' then   //NULL as '' '',
    SQL := 'SELECT acc_code as Kode, acc_name as ''Nama Biaya'', null as '' '',  null as '' '',acc_id, NULL AS '' '' '+
          ' FROM Account '+
          IfThen(MasterPurpose='CODE',' WHERE acc_code LIKE '+FormatSQLWildCard(txtSearch.Text+'%'))+
           IfThen(MasterPurpose='NAME',' WHERE acc_name LIKE '+FormatSQLWildCard(txtSearch.Text+'%'));

  try
    Screen.Cursor := crSQLWait;
    //ADOQuery1.DisableControls;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := SQL + vFilter;
    ADOQuery1.Connection := MyConnection.ADOConnection;
    ADOQuery1.Open;

  finally
   // ADOQuery1.EnableControls;
    DBAdvStringGrid1.Update;
    Screen.Cursor := crDefault;
    ArrangeColSize;
  end;


end;

procedure TfrmLovFlat.txtSearchChange(Sender: TObject);
begin
  {$IFDEF ONCHANGE}
  if txtSearch.Text <> '' then
    RequeryPart();
   {$ENDIF}
end;

procedure TfrmLovFlat.DBAdvStringGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then begin
    ModalResult := mrOk;
  end;

  if Key = vk_Escape then
    ModalResult := mrCancel;

  if Key = VK_F7 then begin
    if TableName = 'ITEM' then
      NewPart
    else
      NewService;
  end;
end;

procedure TfrmLovFlat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Escape then
    ModalResult := mrCancel;
end;

procedure TfrmLovFlat.txtSearrchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {$IFDEF ONENTER}
  IF key = vk_return then
    if txtSearch.Text <> '' then
      RequeryPart();
  {$ENDIF}
  if Key = vk_Escape then
    ModalResult := mrCancel;
  if Key = VK_F7 then
    if TableName = 'ITEM' then
      NewPart
    else
      NewService;  
end;

procedure TfrmLovFlat.DBAdvStringGrid1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else begin
    if  TableName = 'ITEM' then begin
      if   ACol in [colStok,colPrice] then
        HAlign := taRightJustify;
    end;
    if  TableName = 'SERVICE' then begin
      if   ACol in [colStok] then
        HAlign := taRightJustify;
    end;
  end;
end;

procedure TfrmLovFlat.ArrangeColSize;
begin
  with DBAdvStringGrid1 do begin
    AutoSizeColumns(True,2);
    if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
//    ColWidths[setCol] := 0;
    if TableName = 'ITEM' then begin
      ColWidths[colId] := 0;
    end
    else if TableName = 'SERVICE' then begin
      ColWidths[colStok] := 0;
      ColWidths[colId] := 0;
      ColWidths[colKendaraan] := 0;
    end
    else if TableName = 'CUSTOMER' then begin
      //ColWidths[colStok] := 0; buat alamat
      ColWidths[colId] := 0;
      ColWidths[colPrice] := 0;
      ColWidths[colKendaraan] := 0;
    end
    else if TableName = 'ACCOUNT' then begin
      ColWidths[colStok] := 0;
      ColWidths[colId] := 0;
      ColWidths[colKendaraan] := 0;
    end
    else if TableName = 'MOTOR' then begin
      ColWidths[colId] := 0;
      ColWidths[colStok] := 0;
      ColWidths[colPrice] := 0;
      ColWidths[colKendaraan] := 0;
    end
    else begin
      ColWidths[colId] := 0;
      ColWidths[colPrice] := 0;
      ColWidths[colStok] := 0;
      ColWidths[colKendaraan] := 0;
    end
  end;
end;

function TfrmLovFlat.setCol: integer;
begin
  if TableName = 'ITEM' then
    Result := 4
  else if TableName = 'SERVICE' then
    Result := 3
  else if TableName = 'CUSTOMER' then
    Result := 2
  else if TableName = 'ACCOUNT' then
    Result := 2
  else if TableName = 'MOTOR' then
    Result := 2
  else
    Result := 4;
end;

procedure TfrmLovFlat.DBAdvStringGrid1GetDisplText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
  if TableName = 'ITEM' then
    if (aCol in [2,3]) and (ARow > 0) then
      Value := FloatToStrFmt(StrToFloatDef(Value,0));

  if TableName = 'SERVICE' then
    if (aCol in [2]) and (ARow > 0) then
      Value := FloatToStrFmt(StrToFloatDef(Value,0));
end;

procedure TfrmLovFlat.NewService;
begin

  txtSearch.Text := frmServicePkgAdd.NewExecute(SERVICE_TYPE_OTHERS,MasterPurpose);
  RequeryPart;

end;

procedure TfrmLovFlat.InitForm;
begin
  if (TableName = 'SERVICE') or (TableName = 'ITEM') then begin
    Panel1.Height := 50;
    Label2.Caption := '[F7] = Tambah '+IfThen(TableName='SERVICE','Service','Part')+' baru';
  end
  else
    Panel1.Height := 25;
end;

procedure TfrmLovFlat.FormShow(Sender: TObject);
begin
  txtSearch.SetFocus;
  txtSearch.SelStart := length(txtSearch.Text);
end;

procedure TfrmLovFlat.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
     0 : MasterPurpose := 'NAME';
     1 : MasterPurpose := 'CODE';
     2 : MasterPurpose := 'KENDARAAN';
  end;
end;

procedure TfrmLovFlat.NewPart;
begin

  txtSearch.Text := frmItemAdd.NewExecute(ITEM_TYPE_PART,'');
  RequeryPart;

end;

end.
