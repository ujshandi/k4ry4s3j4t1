unit ServicePkgAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,UMaster,Math,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls,strUtils, Grids, BaseGrid, AdvGrid;

type
  TfrmServicePkgAdd = class(TForm)
    btnSave: TButton;
    btnBatal: TButton;
    txtPrice: TAdvEdit;
    txtNama: TAdvEdit;
    Label1: TLabel;
    txtKode: TAdvEdit;
    Bevel2: TBevel;
    StaticText1: TStaticText;
    asgItem: TAdvStringGrid;
    rbSingle: TRadioButton;
    rbPackage: TRadioButton;
    Label9: TLabel;
    Bevel1: TBevel;
    asgService: TAdvStringGrid;
    Label2: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure cmbItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbSingleClick(Sender: TObject);
    procedure asgItemGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgItemGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure asgItemCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgItemComboObjectChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String; AObject: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure asgItemCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgItemClick(Sender: TObject);
    procedure asgServiceCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgServiceGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgServiceGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure asgServiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbPackageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgServiceCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgServiceEnter(Sender: TObject);
    procedure asgItemEnter(Sender: TObject);
    procedure asgItemExit(Sender: TObject);
    procedure asgServiceExit(Sender: TObject);
  private
    { Private declarations }
    EditMode : boolean;
    MasterSeq : integer;
    MasterPurpose : string;
  //  vItem_Arr : TItems_Arr;
    vItem : TItems;
    vService : TServices;
    procedure ArrangecolSize;
    procedure InitForm;
    procedure InitGrid;
    function isSaved:boolean;
    function isValid:boolean;
    procedure LoadData;
    procedure LoadItem(AServiceID:integer);
    procedure getItem(AItemId,ARow:integer;isItem:boolean=True);
    procedure setPrice;
    procedure setGridSelection(AGrid:TAdvStringGrid);
  public
    { Public declarations }
    function Execute(APurpose:string;AServiceSeq:integer):boolean;
    function NewExecute(APurpose,AResultType:string):string;
  end;

var
  frmServicePkgAdd: TfrmServicePkgAdd;

const colNo = 0;
      colCode = 1;
      colName = 2;
      colQty = 3;
      colPrice = 4;
      colNotes = 5;
      colID = 6;
      colPkgId = 7;
      colServParent = 8;

implementation

uses Subroutines, UConst, SQLServerConnections, MainMenu,
  AutoBengkel, un_ryu, ItemKelola, LOVFlat, Types;

{$R *.dfm}

{ TfrmServiceAdd }

procedure TfrmServicePkgAdd.InitForm;
var vPurpose : string;
begin
  rbSingle.Enabled := not EditMode;
  rbPackage.Enabled := not EditMode;
  rbSingle.Checked := True;
  rbSingleClick(Self);
  vPurpose := IfThen(MasterPurpose=SERVICE_TYPE_SINGLE,'Service','Lain-Lain');
  txtKode.Clear;
  txtNama.Clear;
  txtPrice.Clear;
  btnSave.Caption:= IfThen(EditMode, '&Update', '&Save');
  Self.Caption := IfThen(EditMode,'  Edit Data ','  Input Data ')+vPurpose;
  txtKode.Text := TServices.GetNewNumber(MasterPurpose);
  Self.ActiveControl := txtNama;
  InitGrid;
end;

function TfrmServicePkgAdd.isSaved: boolean;
var Service : TServices;
  i:integer;
begin
  Service := TServices.Create;
  Service.ServiceCode:= txtKode.Text;
  Service.ServiceName:= txtNama.Text;
  Service.ServiceType:= MasterPurpose;
  Service.Price   := txtPrice.FloatValue;
  Service.ServiceId := MasterSeq;
  Service.UserInsert  := GlobalSystemUser.UserId;
  Service.UserEdit    := GlobalSystemUser.UserId;
  if Service.ServiceType = SERVICE_TYPE_PACKAGE then begin
    //masukan service
    for i:= 1 to asgService.RowCount-1 do
      if not IsClear(asgService,i,colID) then
        with asgService do begin
          Service.Package_Arr.Add(Ints[colPkgId,i],Ints[colId,i],0,Floats[colPrice,i],Floats[colQty,i],
                  Ints[colServparent,i],Cells[colNotes,i]);
        end;
    //masukan item
    for i:= 1 to asgItem.RowCount-1 do
      if not IsClear(asgItem,i,colID) then
        with asgItem do begin
          Service.Package_Arr.Add(Ints[colPkgId,i],0,Ints[colId,i],Floats[colPrice,i],Floats[colQty,i],
                  Ints[colServparent,i],Cells[colNotes,i]);
        end;

   end;
  if not EditMode then
    Result:= Service.InsertOnDB
  else Result:= Service.UpdateOnDB;
end;

function TfrmServicePkgAdd.isValid: boolean;
begin
  Result:= False;
  if TServices.isExistCode(txtKode.Text,IfThen(EditMode,MasterSeq,0)) then begin
    Inform('Kode sudah ada.');
    txtKode.SetFocus;
  end
  else if txtKode.Text = '' then begin
    Inform('Kode belum diisi.');
    txtKode.SetFocus;
  end else
  if txtNama.Text = '' then begin
    Inform('Nama belum diisi.');
    txtNama.SetFocus;
  end else
    Result:= True;

end;

procedure TfrmServicePkgAdd.LoadData;
var Service : TServices;
begin
  Service := TServices.Create;
  if not Service.SelectInDB(MasterSeq) then begin
    Alert(MSG_NO_DATA_FOUND);
    Service.Free;
    exit;
  end;
  rbSingle.Checked    := Service.ServiceType = SERVICE_TYPE_SINGLE;
  rbSingleClick(Self);
  txtNama.Text        := Service.ServiceName;
  txtPrice.FloatValue := Service.Price;
  txtKode.Text        := Service.ServiceCode;

  rbPackage.Checked    := Service.ServiceType = SERVICE_TYPE_PACKAGE;

  if Service.ServiceType = SERVICE_TYPE_PACKAGE then
    LoadItem(Service.ServiceId);
  Service.Free;
end;

procedure TfrmServicePkgAdd.btnSaveClick(Sender: TObject);
begin
  if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then begin
      if not EditMode then begin
        if Confirmed(MSG_ADD_DATA) then begin
          InitForm;
          frmItemKelola.ReloadService(0,TServices.getMaxID,True);
        end
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
    end;
end;

function TfrmServicePkgAdd.Execute(APurpose:string;AServiceSeq: integer): boolean;
begin
//  vItem_Arr := TItems_Arr.Create;
  //vItem_Arr.FindFlat;
  setGridSelection(nil);
  vItem := TItems.Create;
  vService := TServices.Create;
  MasterPurpose := APurpose;
  MasterSeq := AServiceSeq;
  EditMode  := (MasterSeq <> 0);
  InitForm;
  if EditMode then
    LoadData;
  Run(Self);
  Result := ModalResult=mrOk;
  vItem.Free;
  vService.Free;
//  vItem_Arr.Free;
end;

procedure TfrmServicePkgAdd.cmbItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    btnSave.SetFocus;
end;

procedure TfrmServicePkgAdd.rbSingleClick(Sender: TObject);
begin
   asgItem.Enabled := rbPackage.Checked;
   asgService.Enabled := rbPackage.Checked;
   txtPrice.Enabled  := rbSingle.Checked;


   if rbSingle.Checked then begin
     InitGrid;
     txtPrice.Clear;
     MasterPurpose := SERVICE_TYPE_SINGLE;
   end
   else
     MasterPurpose := SERVICE_TYPE_PACKAGE;
end;

procedure TfrmServicePkgAdd.InitGrid;
begin
  ResetGrid(asgItem,2,10,1,1);
  with asgItem do begin
    Cells[colNo,0]    := 'No.';
    Cells[colCode,0]  := 'Kode Part';
    Cells[colName,0]  := 'Deskripsi';
    Cells[colQty,0]   := 'Jumlah';
    Cells[colPrice,0] := 'Harga';
    Cells[colNotes,0] := 'Harga Nota';
    Cells[colId,0]    := 'ItemId';
    Cells[colPkgId,0] := 'PkgID';
    Cells[colServParent,0] := 'Parent';
  end;

  ResetGrid(asgService,2,10,1,1);
  with asgService do begin
    Cells[colNo,0]    := 'No.';
    Cells[colCode,0]  := 'Kode Service';
    Cells[colName,0]  := 'Deskripsi';
    Cells[colQty,0]   := 'Jumlah';
    Cells[colPrice,0] := 'Harga';
    Cells[colNotes,0] := 'Harga Nota';
    Cells[colId,0]    := 'ServId';
    Cells[colPkgId,0] := 'PkgID';
    Cells[colServParent,0] := 'Parent';
  end;
  ArrangecolSize;
end;

procedure TfrmServicePkgAdd.ArrangecolSize;
begin
  asgItem.AutoSizeColumns(True,2);
  asgItem.AutoNumberCol(colNo);
  asgService.AutoSizeColumns(True,2);
  asgService.AutoNumberCol(colNo);
  setPrice;
  if GlobalSystemUser.AccessLevel>LEVEL_OWNER then exit;
  asgItem.ColWidths[colId] := 0;
  asgItem.ColWidths[colPkgId] := 0;
  asgItem.ColWidths[colServParent] := 0;
  asgService.ColWidths[colId] := 0;
  asgService.ColWidths[colPkgId] := 0;
  asgService.ColWidths[colServParent] := 0;
end;

procedure TfrmServicePkgAdd.asgItemGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPrice] then
    HAlign := taRightJustify;
end;

procedure TfrmServicePkgAdd.asgItemGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colQty,colPrice : AEditor := edPositiveNumeric;
  end;
end;

procedure TfrmServicePkgAdd.asgItemCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := ACol in [colCode,colName,colQty,colPrice,colNotes];
end;

procedure TfrmServicePkgAdd.LoadItem(AServiceID: integer);
var i,vRow : integer;
   vPkg : TServicePackage_Arr;
begin
  vPkg := TServicePackage_Arr.Create;
  InitGrid;
  vPkg.FindOnDb(AServiceID);
  for i:= 0 to vPkg.Count-1 do begin
    if vPkg[i].Services.ServiceId > 0 then begin
      with asgService do begin
        vRow := RowCount-1;
        Cells[colCode,vRow] := vPkg[i].Services.ServiceCode;
        Cells[colName,vRow] := vPkg[i].Services.ServiceName;
        Floats[colQty,vRow] := vPkg[i].Quantity;
        Floats[colPrice,vRow] := vPkg[i].Price;
        Ints[colId,vRow] := vPkg[i].Services.ServiceId;
        Ints[colServParent,vRow]:= vPkg[i].ServiceParent;
        Ints[colPkgId,vRow] := vPkg[i].PkgId;
        Cells[colNotes,vRow] := vPkg[i].Notes;
        AddRow;
      end;
    end
    else if vPkg[i].Items.ItemId > 0 then begin
      with asgItem do begin
        vRow := RowCount-1;
        Cells[colCode,vRow] := vPkg[i].Items.ItemCode;
        Cells[colName,vRow] := vPkg[i].Items.ItemName;
        Floats[colQty,vRow] := vPkg[i].Quantity;
        Floats[colPrice,vRow] := vPkg[i].Price;
        Ints[colId,vRow] := vPkg[i].Items.ItemId;
        Ints[colServParent,vRow]:= vPkg[i].ServiceParent;
        Ints[colPkgId,vRow] := vPkg[i].PkgId;
        Cells[colNotes,vRow] := vPkg[i].Notes;
        AddRow;
      end;
    end;  
   end;//end for
  DeleteRowTerakhir(asgItem,2,1);
  DeleteRowTerakhir(asgService,2,1);
  ArrangecolSize;
  vPkg.Free;
end;

procedure TfrmServicePkgAdd.asgItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
begin
   case Key of
     VK_F8 : ShortCutF8(asgItem,Key,colCode);
     VK_DELETE :  begin
       if (Shift = [ssCtrl]) then
      DeleteRowGrid(asgItem,asgItem.Row,colCode);
     end;
      ord('A')..ord('Z'), ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
         case asgItem.Col of
           colCode,colName : begin
            vId := frmLovFlat.Execute(IfThen(asgItem.Col=colName,'NAME','CODE'),asgItem.Cells[asgItem.Col,asgItem.Row],'ITEM','');
             if vId > 0 then
               getItem(vId,asgItem.Row);
           end;
         end;
      end;
   end;
end;

procedure TfrmServicePkgAdd.asgItemComboObjectChange(Sender: TObject; ACol,
  ARow, AItemIndex: Integer; ASelection: String; AObject: TObject);
begin
 // If ACol = colCode then
   // asgItem.Combobox.DroppedDown := True;
{  case ACol of
    colCode : asgItem.Cells[colName,ARow] := vItem_Arr[AItemIndex].ItemName;
    colName : asgItem.Cells[colCode,ARow] := vItem_Arr[AItemIndex].ItemCode;
  end;
  asgItem.Ints[colItemId,ARow] := vItem_Arr[AItemIndex].ItemId;
  asgItem.Floats[colQty,ARow]  := 1;}
end;

procedure TfrmServicePkgAdd.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmServicePkgAdd.asgItemCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
begin
 setPrice;
{  case  Col of
    colCode : begin
      //frmLovFlat.RequeryPart('',Value);
    end;
    colName : begin
      frmLovFlat.RequeryPart(Value,'');
    end;
  end;}
end;

procedure TfrmServicePkgAdd.asgItemClick(Sender: TObject);
begin
  if frmLovFlat.Showing then
    frmLovFlat.Close;
end;

procedure TfrmServicePkgAdd.getItem(AItemId,ARow: integer;isItem:boolean);
begin
  vItem.Reset;
  vService.Reset;
  if isItem then begin
    if vItem.SelectInDB(AItemId) then begin
       with asgItem do begin
         Cells[colCode,ARow] := vItem.ItemCode;
         Cells[colName,ARow] := vItem.ItemName;
         Floats[colPrice,ARow] := vItem.Price;
         Floats[colQty,ARow] := 1;
         Ints[colId,ARow]:= vItem.ItemId;
       end;
    end;
  end
  else begin //blok service
    if vService.SelectInDB(AItemId) then begin
       with asgService do begin
         Cells[colCode,ARow] := vService.ServiceCode;
         Cells[colName,ARow] := vService.ServiceName;
         Floats[colPrice,ARow] := vService.Price;
         Floats[colQty,ARow] := 1;
         Ints[colId,ARow]:= vService.ServiceId;
       end;
    end;
  end;
  ArrangecolSize;
end;

procedure TfrmServicePkgAdd.asgServiceCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
   CanEdit := ACol in [colCode,colName,colQty,colPrice,colNotes];
end;

procedure TfrmServicePkgAdd.asgServiceGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPrice] then
    HAlign := taRightJustify;
end;

procedure TfrmServicePkgAdd.asgServiceGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colQty,colPrice : AEditor := edPositiveNumeric;
  end;
end;

procedure TfrmServicePkgAdd.asgServiceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;
begin
 //  if BrowseMode then exit;
   case Key of
     VK_F8 : ShortCutF8(asgService,Key,colCode);
     VK_DELETE : begin
       if (Shift = [ssCtrl]) then
       DeleteRowGrid(asgService,asgService.Row,colCode);
     end;
      ord('A')..ord('Z'), ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
         case asgService.Col of
           colCode,colName : begin
            vId := frmLovFlat.Execute(IfThen(asgService.Col=colName,'NAME','CODE'),chr(Key),'SERVICE',
              ' AND service_type <> '+FormatSQLString(SERVICE_TYPE_PACKAGE));
             if vId > 0 then
               getItem(vId,asgService.Row,False);
           end;
         end;
      end;
   end;

end;

procedure TfrmServicePkgAdd.rbPackageKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   asgService.SetFocus;
end;

procedure TfrmServicePkgAdd.setPrice;
begin
  if rbPackage.Checked then
    txtPrice.FloatValue := asgItem.ColumnSum(colPrice,1,asgItem.RowCount-1) +
                           asgService.ColumnSum(colPrice,1,asgService.RowCount-1);
end;

procedure TfrmServicePkgAdd.asgServiceCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
begin
  setPrice;
end;

procedure TfrmServicePkgAdd.setGridSelection(AGrid: TAdvStringGrid);
begin
  if AGrid <> nil  then begin
    asgItem.ShowSelection    := (asgItem.Name = AGrid.Name);
    asgService.ShowSelection := (asgService.Name = AGrid.Name);
  end
  else begin
    asgItem.ShowSelection    := False;
    asgService.ShowSelection := False;
  end;
end;

procedure TfrmServicePkgAdd.asgServiceEnter(Sender: TObject);
begin
  setGridSelection(asgService);
end;

procedure TfrmServicePkgAdd.asgItemEnter(Sender: TObject);
begin
  setGridSelection(asgItem);
end;

procedure TfrmServicePkgAdd.asgItemExit(Sender: TObject);
begin
  setGridSelection(nil);
end;

procedure TfrmServicePkgAdd.asgServiceExit(Sender: TObject);
begin
   setGridSelection(nil);
end;

function TfrmServicePkgAdd.NewExecute(APurpose,
  AResultType: string): string;
begin
  setGridSelection(nil);
  vItem := TItems.Create;
  vService := TServices.Create;
  MasterPurpose := APurpose;
  MasterSeq := 0;//AServiceSeq;
  EditMode  := (MasterSeq <> 0);
  InitForm;
  if EditMode then
    LoadData;
  Run(Self);
  vItem.Free;
  vService.Free;
  Result := IfThen(AResultType ='NAME',txtNama.Text,txtKode.Text);


end;

end.
