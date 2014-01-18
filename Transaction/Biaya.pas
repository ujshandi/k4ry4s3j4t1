unit Biaya;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,
  Dialogs, ComCtrls, AdvEdit, ExtCtrls, StdCtrls, Grids, BaseGrid, AdvGrid,UMaster,UFinance;

type
  TfrmBiaya = class(TForm)
    l: TLabel;
    mmNotes: TMemo;
    asgTerima: TAdvStringGrid;
    btnDelete: TButton;
    btnNew: TButton;
    Bevel1: TBevel;
    Panel1: TPanel;
    txtSubtotal: TAdvEdit;
    txtDisc: TAdvEdit;
    txtTotal: TAdvEdit;
    btnSave: TButton;
    btnBatal: TButton;
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    Label11: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure asgTerimaCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgTerimaCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgTerimaGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgTerimaGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure btnBatalClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure asgTerimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDiscChange(Sender: TObject);
    procedure txtDiscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    BrowseMode : boolean;
    MasterSeq : integer;
    vAccount : TAccount;
    procedure ArrangeColSize;
    procedure getAccount(AId,Arow:integer);
    procedure InitForm;
    procedure InitGrid;
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure NewNumber;
    procedure SetAmount(ARow:integer);
    procedure setFooter;
    procedure PrintData;
  public
    { Public declarations }
    function Execute(ATransId:integer):boolean;
  end;

var
  frmBiaya: TfrmBiaya;

implementation

uses UConst, Subroutines, MainMenu, un_ryu, SQLServerConnections,
  AutoBengkel, AccountAdd, LOVFlat;
const
  colNo = 0;
  colCode = 1;
  colName = 2;
  colAMount = 3;
  colNotes = 4;
  colID = 5;

{$R *.dfm}

{ TfrmBiaya }

procedure TfrmBiaya.ArrangeColSize;
begin
  with asgTerima do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);
  end;
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;

  with asgTerima do begin
    ColWidths[colID]:=0;
  end;
end;

function TfrmBiaya.Execute(ATransId: integer): boolean;
begin
  vAccount := TAccount.Create;
  Result := False;
  BrowseMode := ATransId>0;
  MasterSeq := ATransId;
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  vAccount.Free;
end;

procedure TfrmBiaya.InitForm;
begin
  dtpTrans.Enabled  := not BrowseMode;
  btnNew.Enabled    := not BrowseMode;
  mmNotes.ReadOnly  := BrowseMode;
  txtDisc.ReadOnly  := BrowseMode;
  btnSave.Caption   := IfThen(BrowseMode,'&Print','&Save');
  txtSubtotal.Clear;
  txtDisc.Clear;
  txtTotal.Clear;
  mmNotes.Clear;

  Self.Caption := IfThen(BrowseMode,'View Pengeluaran Biaya','New Pengeluaran Biaya');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  NewNumber;
  Self.ActiveControl := mmNotes;
  InitGrid;
end;

procedure TfrmBiaya.InitGrid;
begin
 ResetGrid(asgTerima,2,7,1,1);
  with asgTerima do begin
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Biaya';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colAmount,0]:= 'Amount';
    Cells[colNotes,0]:= 'Keterangan';
    Cells[colID,0] := 'ID';
  end;

  ArrangeColSize;
end;

function TfrmBiaya.isSaved: boolean;
var vPayment : TPayment;
   i:integer;
begin
  vPayment := TPayment.Create;
  vPayment.PaymentNum := TPayment.getNewNumber(PAYMENT_TYPE_BIAYA,dtpTrans.DateTime);
  vPayment.PaymentDate := dtpTrans.Date;
  vPayment.PaymentType := PAYMENT_TYPE_BIAYA;
  vPayment.UserInsert  := GlobalSystemUser.UserId;
  vPayment.Notes       := mmNotes.Lines.Text;
  vPayment.Subtotal    := txtSubtotal.FloatValue;
  vPayment.Discount    := txtDisc.FloatValue;
  vPayment.Total       := txtTotal.FloatValue; 
  for i:= 1 to asgTerima.RowCount-1 do
    with asgTerima do begin
      if not IsClear(asgTerima,i,colID) then begin
         vPayment.MoneyTrans_Arr.Add(0,0,0,DB_CR_TYPE_CREDIT,Floats[colAMount,i],
          Cells[colNotes,i],Ints[colId,i]);
      end;
    end;
  Result := vPayment.InsertOnDb;
  if not Result then
    Alert(MSG_UNSUCCESS_SAVING);
  vPayment.Free;
//  Result := vPayment.i;
end;

function TfrmBiaya.isValid: boolean;
begin
  Result := True;

end;

procedure TfrmBiaya.LoadData;
var i,vRow:integer;
   vPayment : TPayment;
begin
  vPayment := TPayment.Create;
  if not vPayment.SelectInDB(MasterSeq) then begin
    Alert(MSG_NO_DATA_FOUND);
    vPayment.Free;
    exit;
  end;
  sttNum.Caption := ' '+vPayment.PaymentNum;
  dtpTrans.DateTime := vPayment.PaymentDate;
  mmNotes.Lines.Text := vPayment.Notes;
  txtSubtotal.FloatValue := vPayment.Subtotal;
  txtDisc.FloatValue     := vPayment.Discount;
  txtTotal.FloatValue    := vPayment.Total;
  vPayment.MoneyTrans_Arr.FindOnDb(vPayment.PaymentId);
  InitGrid;
  for i:= 0 to vPayment.MoneyTrans_Arr.Count-1 do
    with asgTerima do begin
      vRow := RowCount-1;
      Cells[colCode, vRow]  := vPayment.MoneyTrans_Arr[i].Account.AccCode;
      Cells[colName,vRow]   := vPayment.MoneyTrans_Arr[i].Account.AccName;
      Floats[colAmount,vRow]:= vPayment.MoneyTrans_Arr[i].Amount;
      Cells[colNotes,vRow]  := vPayment.MoneyTrans_Arr[i].Notes;
      AddRow;
    end;
   DeleteRowTerakhir(asgTerima,2,1);
   ArrangeColSize;
  vPayment.Free;
end;

procedure TfrmBiaya.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := TPayment.getNewNumber(PAYMENT_TYPE_BIAYA,dtpTrans.Date);
end;

procedure TfrmBiaya.PrintData;
begin

end;

procedure TfrmBiaya.SetAmount(ARow: integer);
begin

end;

procedure TfrmBiaya.btnSaveClick(Sender: TObject);
begin
  if BrowseMode then
     PrintData
  else begin
   if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then
      if not BrowseMode then begin
        if Confirmed(MSG_ADD_DATA) then
          InitForm
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
   end;
end;

procedure TfrmBiaya.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
CanEdit := (ACol in [colCode,colName,colAmount,colNotes]) and (not BrowseMode);
end;

procedure TfrmBiaya.asgTerimaCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
begin
  case Col of
    colAmount : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
        SetAmount(Row);
      //  asgTerima.AddRow;
      end;

      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;
  end;
  setFooter;
  ArrangeColSize;
end;

procedure TfrmBiaya.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colAmount] then
    HAlign := taRightJustify;
end;

procedure TfrmBiaya.asgTerimaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colAmount : AEditor := edFloat;
  end;
end;

procedure TfrmBiaya.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBiaya.btnDeleteClick(Sender: TObject);
begin
   if Confirmed('Data pada baris ke-'+IntToStr(asgTerima.Row)+ 'akan dihapus?') then
    deleterow(asgTerima,asgTerima.Row,colCode);
   setFooter;
end;

procedure TfrmBiaya.btnNewClick(Sender: TObject);
var vEditor : TEditorType;
begin
   vEditor := edComboList;
   frmAccountAdd.NewExecute;
   asgTerimaGetEditorType(Self,colCode,asgTerima.Row,vEditor);
   asgTerimaGetEditorType(Self,colName,asgTerima.Row,vEditor);
end;

procedure TfrmBiaya.getAccount(AId, Arow: integer);
begin
  vAccount.Reset;
  if vAccount.SelectOnDB(AId)then
    with asgTerima do begin
      Cells[colCode,Arow] := vAccount.AccCode;
      Cells[colName,Arow] := vAccount.AccName;
      Ints[colId,Arow]    := vAccount.AccId;
    end;
  ArrangeColSize;
end;

procedure TfrmBiaya.asgTerimaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
  vSearch : string;
begin
   if BrowseMode  then exit;
   case Key of
     VK_F8 : ShortCutF8(asgTerima,Key,colCode);
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        btnDelete.Click;
     end;
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgTerima.Col of
         colCode,colName : begin
           vSearch :=LowerCase(chr(Key));
           vId := frmLovFlat.Execute(IfThen(asgTerima.Col=colName,'NAME','CODE'),vSearch,'ACCOUNT','');
           if vId > 0 then
             getAccount(vId,asgTerima.Row);
         end;
       end;
     end;
   end;

end;

procedure TfrmBiaya.setFooter;
begin
  txtSubtotal.FloatValue := asgTerima.ColumnSum(colAMount,1,asgTerima.RowCount-1);
  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue;
end;

procedure TfrmBiaya.txtDiscChange(Sender: TObject);
begin
 if not BrowseMode then
  setFooter;
end;

procedure TfrmBiaya.txtDiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSave.SetFocus;
end;

procedure TfrmBiaya.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    asgTerima.SetFocus;
end;

end.
