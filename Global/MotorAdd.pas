unit MotorAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls,strUtils;

type
  TfrmMotorAdd = class(TForm)
    btnSave: TButton;
    btnBatal: TButton;
    txtYear: TAdvEdit;
    txtNama: TAdvEdit;
    Label1: TLabel;
    txtKode: TAdvEdit;
    Bevel2: TBevel;
    StaticText1: TStaticText;
    procedure btnSaveClick(Sender: TObject);
    procedure cmbItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    EditMode : boolean;
    MasterSeq : integer;
    MasterPurpose : string;
    procedure InitForm;
    function isSaved:boolean;
    function isValid:boolean;
    procedure LoadData;
  public
    { Public declarations }
    function Execute(APurpose:string;AServiceSeq:integer):boolean;
  end;

var
  frmMotorAdd: TfrmMotorAdd;

implementation

uses UMaster, Subroutines, UConst, SQLServerConnections, MainMenu,
  AutoBengkel;

{$R *.dfm}

{ TfrmServiceAdd }

procedure TfrmMotorAdd.InitForm;
var vPurpose : string;
begin
  vPurpose := IfThen(MasterPurpose=MOTOR_TYPE,'Kendaraan','Biaya');
  txtKode.Clear;
  txtNama.Clear;
//  txtWeight.Clear;
  txtYear.Clear;
  btnSave.Caption:= IfThen(EditMode, '&Update', '&Simpan');
  Self.Caption := IfThen(EditMode,'  Edit Data ','  Input Data ')+vPurpose;
  txtKode.Text := TMotor.GetNewNumber(MasterPurpose);
  Self.ActiveControl := txtNama;
end;

function TfrmMotorAdd.isSaved: boolean;
var vMotor : TMotor;
begin
  vMotor := TMotor.Create;
  vMotor.MotorCode:= txtKode.Text;
  vMotor.MotorName:= txtNama.Text;
  vMotor.MotorType:= MasterPurpose;
  vMotor.MotorYear  := txtYear.IntValue;
  vMotor.MotorId := MasterSeq;
  vMotor.UserInsert  := GlobalSystemUser.UserId;
  vMotor.UserEdit    := GlobalSystemUser.UserId;
  if not EditMode then
    Result:= vMotor.InsertOnDB
  else Result:= vMotor.UpdateOnDB;
end;

function TfrmMotorAdd.isValid: boolean;
begin
  Result:= False;
{  if (not EditMode) and (TServices.ExistInDB(txtKode.Text)) then begin
    Inform('Kode sudah ada.');
    txtKode.SetFocus;
  end else}
  if txtKode.Text = '' then begin
    Inform('Kode belum diisi.');
    txtKode.SetFocus;
  end else
  if txtNama.Text = '' then begin
    Inform('Nama belum diisi.');
    txtNama.SetFocus;
  end else
    Result:= True;

end;

procedure TfrmMotorAdd.LoadData;
var vMotor : TMotor;
begin
  vMotor := TMotor.Create;
  if not vMotor.SelectInDB(MasterSeq) then begin
    Alert(MSG_NO_DATA_FOUND);
    vMotor.Free;
    exit;
  end;
  txtNama.Text     := vMotor.MotorName;
  txtYear.IntValue := vMotor.MotorYear;
  txtKode.Text     := vMotor.MotorCode;
  vMotor.Free;
end;

procedure TfrmMotorAdd.btnSaveClick(Sender: TObject);
begin
  if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then begin
      if not EditMode then begin
        if Confirmed(MSG_ADD_DATA) then
          InitForm
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
    end;
end;

function TfrmMotorAdd.Execute(APurpose:string;AServiceSeq: integer): boolean;
begin
  Result := True;
  MasterPurpose := APurpose;
  MasterSeq := AServiceSeq;
  EditMode  := (MasterSeq <> 0);
  InitForm;
  if EditMode then
    LoadData;
  Run(Self);  
end;

procedure TfrmMotorAdd.cmbItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    btnSave.SetFocus;
end;

end.
