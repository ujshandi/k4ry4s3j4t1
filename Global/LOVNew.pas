unit LOVNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid,  DB, ADODB,strUtils,Math,
  AdvEdit, Buttons;

type
  TfrmLOVNew = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    txtNama: TAdvEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    asgList: TAdvStringGrid;
    rdbNama: TRadioButton;
    rdbKode: TRadioButton;
    lblStok: TLabel;
    procedure txtNamaChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure asgListCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgListDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure asgListGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgListGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure rdbKodeClick(Sender: TObject);
    procedure rdbNamaClick(Sender: TObject);
  private
    { Private declarations }
    MasterType, tmpType,
    SearchType:integer;
    WithCheck : boolean;
    TglStok:TDate;
    Cabang:integer;
    procedure ArrangeColSize;
    procedure ReloadData;
    procedure Status;
    procedure ResetForm;
  public
    { Public declarations }
    function Execute( var listResult:TStringList;ALovType:integer;AWithCheck:boolean;ASearch:string=''; ASearchType:integer=0;
                ATglStok:TDate=0;ACabang:integer=0):boolean;overload;
    function Execute(ALovType:integer;ASearch:string=''):string;overload;
  end;

var
  frmLOVNew: TfrmLOVNew;

implementation

uses SQLServerConnections, un_ryu, UConst, UMaster, AutoBengkel,
  Subroutines;

{$R *.dfm}

{ TfrmLOVNew }
const colCheck = 0;
      colCode = 1;
      colName = 2;
      colStok = 3;
      colSeq  = 4;

function TfrmLOVNew.Execute(var listResult: TStringList;ALovType: integer;
  AWithCheck:boolean;ASearch:string; ASearchType:integer;ATglStok:TDate;ACabang:integer): boolean;
var i:integer; vState: boolean;
begin

  txtNama.Text:= ASearch;
  MasterType  := ALovType;
  TglStok     := ATglStok;
  Cabang      := ACabang;
  WithCheck   := AWithCheck;
  SearchType  := ASearchType;
  ResetForm;
  rdbNama.Checked:= SearchType = LOV_SEARCH_NAMA;
  rdbKode.Checked:= SearchType = LOV_SEARCH_KODE;

//Chan ANTI N.A.T.O  ReloadData;
  Result := False;
  listResult.Clear;
  Self.ActiveControl := txtNama;
  txtNamaChange(Self);
  if ShowModal = mrOK then begin
    for i:= 1 to asgList.RowCount-1 do begin
      asgList.GetCheckBoxState(colCheck,i,vState);
      if vState then
         if MasterType = LOV_MONEY_ACC then
           listResult.Add(asgList.Cells[colCode,i]+'='+asgList.Cells[colName,i])
         else
           listResult.Add(IntToStr(asgList.Ints[colSeq,i])+'='+asgList.Cells[colCode,i])
    end;
    Result := True;
  end;
end;

procedure TfrmLOVNew.ReloadData;
var SQL : string;

  procedure CreateCheckBox;
  var i: integer;vPhone:string;
  begin
    asgList.RowCount := 2;
    for i:= 0 to ADOQuery1.RecordCount-1 do  begin
      if WithCheck then
        asgList.AddCheckBox(colCheck,i+1,False,True);
      asgList.Cells[colCode,i+1] := ADOQuery1.Fields[0].AsString;

      if MasterType = LOV_CUSTOMER then begin
        vPhone :=ADOQuery1.Fields[3].AsString;
        asgList.Cells[colName,i+1] := ADOQuery1.Fields[1].AsString+' ('+IfThen(vPhone<>'',vPhone,ADOQuery1.Fields[4].AsString)+')';
      end
      else
        asgList.Cells[colName,i+1] := ADOQuery1.Fields[1].AsString;
      if MasterType <> LOV_MONEY_ACC then
        asgList.Ints[colSeq,i+1]  := ADOQuery1.Fields[2].AsInteger;
      asgList.AddRow;
      ADOQuery1.Next;
   end;
   DeleteRowTerakhir(asgList,2,1);
  end;

  procedure CreateCheckBox2;
  var i: integer;
       vItem2 : TItems;
       vAddMore : string;
  begin
    asgList.RowCount := 2;
    vItem2 := TItems.Create;
    for i:= 0 to ADOQuery1.RecordCount-1 do  begin
      if WithCheck then
        asgList.AddCheckBox(colCheck,i+1,False,True);
      asgList.Cells[colCode,i+1] := ADOQuery1.Fields[0].AsString;
      asgList.Cells[colName,i+1] := ADOQuery1.Fields[1].AsString;
      vItem2.SelectInDb(ADOQuery1.Fields[2].AsInteger);
      if MasterType <> LOV_MONEY_ACC then
        asgList.Ints[colSeq,i+1]  := ADOQuery1.Fields[2].AsInteger;

   {   if MasterType = LOV_ITEM then begin
        if ADOQuery1.Fields[3].AsString = ITEM_TYPE_LENSA then begin
           vAddMore := 'Uk: '+ vItem2.ItemSize+'; Add: '+vItem2.Cylinder + '; Diameter: '+vItem2.Diameter + ' '+
                       TMasterCode.getNameFromSeq(vItem2.MaterialSeq);
        end
        else if ADOQuery1.Fields[3].AsString = ITEM_TYPE_FRAME then begin
           vAddMore := vItem2.Series+' '+TMasterCode.getNameFromSeq(vItem2.ModelSeq) + ' '+
               TMasterCode.getNameFromSeq(vItem2.SizeSeq) + ' '+ TMasterCode.getNameFromSeq(vItem2.FrameTypeSeq)
              +' '+ TMasterCode.getNameFromSeq(vItem2.ColorSeq)+' '+TMasterCode.getNameFromSeq(vItem2.MaterialSeq);
        end;
      end;  }
      asgList.Cells[colName,i+1] := asgList.Cells[colName,i+1] + ' '+vAddMore;
      asgList.AddRow;
      ADOQuery1.Next;
   end;
   vItem2.Free;
   DeleteRowTerakhir(asgList,2,1);
  end;



begin
  case MasterType of
    LOV_ITEM :
      begin
        SQL := 'SELECT item_code, item_name, item_seq FROM item '+
                IfThen(txtNama.Text<>'',' WHERE '+IfThen(SearchType = LOV_SEARCH_NAMA, 'UPPER(item_name)','UPPER(item_code)')+' LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY item_name ';
      end;
    LOV_JASA : SQL := 'SELECT service_code, service_name, service_seq FROM service '+
                IfThen(txtNama.Text<>'',' WHERE UPPER(service_name) LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY service_name ';
    LOV_EMPLOYEE : SQL := 'SELECT emp_code, emp_name, emp_seq FROM Employee '+
                ' WHERE is_mechanic = -1 '+
                IfThen(txtNama.Text <> '',' AND UPPER(emp_name) LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY emp_name ';
    LOV_SUPPLIER : SQL := 'SELECT ps_code, ps_name, ps_seq FROM Person '+
                ' WHERE ps_type = '+FormatSQLString(PS_TYPE_SUBDEALER)+
                IfThen(txtNama.Text <> '',' AND UPPER(ps_name) LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY ps_name ';
    LOV_CUSTOMER : SQL := 'SELECT person_code, person_name, person_id,phone1,Phone2 FROM Persons '+
                ' WHERE person_type = '+FormatSQLString(PS_TYPE_CUSTOMER)+
                IfThen(txtNama.Text <> '',' AND UPPER(person_name) LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY person_name ';
    LOV_CONTACT : SQL := 'SELECT ps_code, ps_name, ps_seq FROM Person '+
                ' WHERE ps_type = '+FormatSQLString(PS_TYPE_MECHANIC)+
                IfThen(txtNama.Text <> '',' AND UPPER(ps_name) LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY ps_name ';
    LOV_VC_ALL : SQL := 'SELECT ps_code, ps_name, ps_seq FROM Person '+
//                ' WHERE ps_type = '+FormatSQLString(PS_TYPE_SUPPLIER)+
                IfThen(txtNama.Text <> '',' WHERE UPPER(ps_name) LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY ps_name ';
    LOV_ACCOUNT : SQL := 'SELECT acc_num, acc_name, acc_seq FROM account '+
                IfThen(txtNama.Text<>'', ' WHERE '+IfThen(SearchType = LOV_SEARCH_NAMA, 'UPPER(acc_name)',
                  'UPPER(acc_num)')+' LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                IfThen(txtNama.Text <> '',' and ',' where ')+
                ' acc_seq not in (select distinct acc_seq_parent from account where acc_seq_parent is not null) '+
                ' and ((acc_seq_parent is not null) or (acc_seq_parent <> 0)) '+
                ' ORDER BY acc_num ';
    LOV_MONEY_ACC: SQL := 'SELECT money_code, money_name, money_type FROM money_account '+
                IfThen(txtNama.Text<>'',' WHERE '+IfThen(SearchType = LOV_SEARCH_NAMA, 'UPPER(money_name)','UPPER(money_code)')+' LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY money_code ';

    LOV_GUEST : SQL := 'SELECT guest_code, guest_name, guest_id FROM Guests '+
               // ' WHERE ps_type = '+FormatSQLString(PS_TYPE_CUSTOMER)+
                IfThen(txtNama.Text <> '',' AND UPPER(guest_name) LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
                ' ORDER BY guest_name ';
    LOV_SEC     : SQL := 'SELECT sec_num, sec_name, sec_seq FROM standar_entry '+
    IfThen(txtNama.Text<>'',' WHERE '+IfThen(SearchType = LOV_SEARCH_NAMA, 'UPPER(sec_name)','UPPER(sec_num)')+' LIKE '+FormatSQLString(UpperCase(txtNama.Text)+'%'))+
    ' ORDER BY sec_num ';

  end;

  asgList.ClearNormalCells;
  asgList.AutoSizeColumns(True,2);
  //ADOQuery1.Fields.Clear;
  ADOQuery1.Active    := False;
  ADOQuery1.Connection:= myConnection.ADOConnection;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text  := SQL;
 // ADOQuery1.Fields.Clear;
  ADOQuery1.Open;
  asgList.Cells[colCheck,0] := '#';
  //ResetGrid();
  case MasterType of
  LOV_ITEM : begin
    Self.Caption := 'Daftar Item';
    asgList.Cells[colCode,0] := 'Kode Item';
    asgList.Cells[colName,0] := 'Deskripsi Item';
    if (TglStok>0) and (Cabang>0) then
       asgList.Cells[colStok,0] := 'Stok';
    CreateCheckBox2;
  end;
  LOV_JASA : begin
    Self.Caption := 'Daftar Jasa';
    asgList.Cells[colCode,0] := 'Kode Jasa';
    asgList.Cells[colName,0] := 'Nama Jasa';
    CreateCheckBox;
  end;
  LOV_EMPLOYEE : begin
    Self.Caption := 'Daftar Mekanik';
    asgList.Cells[colCode,0] := 'Kode Mekanik';
    asgList.Cells[colName,0] := 'Nama Mekanik';
    CreateCheckBox;
  end;
  LOV_SUPPLIER : begin
    Self.Caption := 'Daftar Supplier';
    asgList.Cells[colCode,0] := 'Kode Suppplier';
    asgList.Cells[colName,0] := 'Nama Supplier';
    CreateCheckBox;
  end;
  LOV_CUSTOMER : begin
    Self.Caption := 'Daftar Customer';
    asgList.Cells[colCode,0] := 'Kode Customer';
    asgList.Cells[colName,0] := 'Nama Customer';
    CreateCheckBox;
  end;
  LOV_CONTACT : begin
    Self.Caption := 'Daftar Contact Person';
    asgList.Cells[colCode,0] := 'Kode Contact Person';
    asgList.Cells[colName,0] := 'Nama Contact Person';
    CreateCheckBox;
  end;
  LOV_VC_ALL : begin
    Self.Caption := 'Daftar Relasi';
    asgList.Cells[colCode,0] := 'Kode Relasi';
    asgList.Cells[colName,0] := 'Nama Relasi';
    CreateCheckBox;
  end;

  LOV_ACCOUNT : begin
    Self.Caption := 'Daftar Account';
    asgList.Cells[colCode,0] := 'No Account';
    asgList.Cells[colName,0] := 'Nama Account';
    CreateCheckBox;
  end;

  LOV_MONEY_ACC : begin
    Self.Caption := 'Daftar Kas/Bank';
    asgList.Cells[colCode,0] := 'Kode Kas/Bank';
    asgList.Cells[colName,0] := 'Nama Kas/Bank';
    CreateCheckBox;
  end;

  LOV_SEC : begin
    Self.Caption := 'Daftar Standar Entry';
    asgList.Cells[colCode,0] := 'Kode Std Entry';
    asgList.Cells[colName,0] := 'Nama Std Entry';
    CreateCheckBox;
  end;
  LOV_GUEST : begin
    Self.Caption := 'List of Guest';
    asgList.Cells[colCode,0] := 'Guest Code';
    asgList.Cells[colName,0] := 'Guest Name';
    CreateCheckBox;
  end;

  end;

  ArrangeColSize;

end;

procedure TfrmLOVNew.Status;
var i,counter:integer;state:Boolean;
begin
  counter := 0;
   for i:= 1 to asgList.RowCount-1 do begin
     asgList.GetCheckBoxState(colCheck,i,state);
     if state then
       Inc(counter);
   end;

end;

procedure TfrmLOVNew.txtNamaChange(Sender: TObject);
begin
if (txtNama.Text <> '') or (MasterType <> LOV_ITEM) then
    ReloadData;
end;

procedure TfrmLOVNew.btnOKClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

function TfrmLOVNew.Execute(ALovType: integer; ASearch: string): string;
begin
  txtNama.Text := ASearch;
  MasterType := ALovType;
  WithCheck  := False;
  ResetForm;
  SearchType := LOV_SEARCH_NAMA;
  rdbNama.Checked:= SearchType = LOV_SEARCH_NAMA;
  rdbKode.Checked:= SearchType = LOV_SEARCH_KODE;

  ReloadData;
  Result := '';
  Self.ActiveControl := txtNama;

  if ShowModal = mrOK then begin

    Result := IntToStr(asgList.Ints[colSeq,asgList.Row]);
//    ModalResult := mrCancel;
  end;

end;

procedure TfrmLOVNew.asgListCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
   CanEdit := (ACol = colCheck);
end;

procedure TfrmLOVNew.asgListDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
   if ARow >0 then
     if not WithCheck then
       ModalResult := mrOk;
end;

procedure TfrmLOVNew.asgListGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
   if ARow = 0 then HAlign := taCenter
   else if ACol = colStok then
     HAlign := taRightJustify;
end;

procedure TfrmLOVNew.asgListGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  var vState : Boolean;
begin
 if asgList.GetCheckBoxState(colCheck,ARow,vState) then
    if vState then
      ABrush.Color := $0080FFFF
    else
      ABrush.Color := clWhite;
end;

procedure TfrmLOVNew.rdbKodeClick(Sender: TObject);
begin
  SearchType := IfThen(rdbNama.Checked, LOV_SEARCH_NAMA, LOV_SEARCH_KODE);
  rdbNama.Checked:= SearchType = LOV_SEARCH_NAMA;
  rdbKode.Checked:= SearchType = LOV_SEARCH_KODE;
  SearchType := IfThen(rdbNama.Checked, LOV_SEARCH_NAMA, LOV_SEARCH_KODE);
end;

procedure TfrmLOVNew.rdbNamaClick(Sender: TObject);
begin
  SearchType := IfThen(rdbNama.Checked, LOV_SEARCH_NAMA, LOV_SEARCH_KODE);
  rdbNama.Checked:= SearchType = LOV_SEARCH_NAMA;
  rdbKode.Checked:= SearchType = LOV_SEARCH_KODE;
  SearchType := IfThen(rdbNama.Checked, LOV_SEARCH_NAMA, LOV_SEARCH_KODE);
end;

procedure TfrmLOVNew.ResetForm;
begin
   Self.Position := poDesktopCenter;
  case MasterType of
    LOV_ITEM : begin
      Self.Height := 400;
      Self.Width  := 600;
      lblStok.Visible := True;
    end

    else begin
       Self.Height := 450;
       Self.Width  :=  400;
       lblStok.Visible := False;
    end;
  end;
end;

procedure TfrmLOVNew.ArrangeColSize;
begin
  asgList.AutoSizeColumns(True,2);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
   case MasterType of
     LOV_GUEST : begin
       asgList.ColWidths[colStok] :=0;
       asgList.ColWidths[colSeq] :=0;
     end;
   end;
end;

end.
