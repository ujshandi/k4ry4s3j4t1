unit ServiceAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls,strUtils;

type
  TfrmServiceAdd = class(TForm)
    btnSave: TButton;
    btnBatal: TButton;
    txtPrice: TAdvEdit;
    txtNama: TAdvEdit;
    Label1: TLabel;
    txtKode: TAdvEdit;
    Bevel2: TBevel;
    StaticText1: TStaticText;
    procedure btnSaveClick(Sender: TObject);
    procedure cmbItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBatalClick(Sender: TObject);
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
    function NewExecute(APurpose,AResultType:string):string;
  end;

var
  frmServiceAdd: TfrmServiceAdd;

implementation

uses UMaster, Subroutines, UConst, SQLServerConnections, MainMenu,
  AutoBengkel, ItemKelola;

{$R *.dfm}

{ TfrmServiceAdd }

procedure TfrmServiceAdd.InitForm;
var vPurpose : string;
begin
  vPurpose := IfThen(MasterPurpose=SERVICE_TYPE_SINGLE,'Service','Lain-Lain');
  txtKode.Clear;
  txtNama.Clear;
//  txtWeight.Clear;
  txtPrice.Clear;
  btnSave.Caption:= IfThen(EditMode, '&Update', '&Save');
  Self.Caption := IfThen(EditMode,'  Edit Data ','  Input Data ')+vPurpose;
  txtKode.Text := TServices.GetNewNumber(MasterPurpose);
  Self.ActiveControl := txtKode;
end;

function TfrmServiceAdd.isSaved: boolean;
var Service : TServices;
begin
  Service := TServices.Create;
  Service.ServiceCode:= txtKode.Text;
  Service.ServiceName:= txtNama.Text;
  Service.ServiceType:= MasterPurpose;
  Service.Price   := txtPrice.FloatValue;
  Service.ServiceId := MasterSeq;
  Service.UserInsert  := GlobalSystemUser.UserId;
  Service.UserEdit    := GlobalSystemUser.UserId;
  if not EditMode then
    Result:= Service.InsertOnDB
  else Result:= Service.UpdateOnDB;
end;

function TfrmServiceAdd.isValid: boolean;
begin
  Result:= False;
  if TServices.isExistCode(txtKode.Text,IfThen(EditMode,MasterSeq,0)) then begin
    Inform('Kode sudah ada.');
    txtKode.SetFocus;
  end else
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

procedure TfrmServiceAdd.LoadData;
var Service : TServices;
begin
  Service := TServices.Create;
  if not Service.SelectInDB(MasterSeq) then begin
    Alert(MSG_NO_DATA_FOUND);
    Service.Free;
    exit;
  end;
  txtNama.Text        := Service.ServiceName;
  txtPrice.FloatValue := Service.Price;
  txtKode.Text        := Service.ServiceCode;
  Service.Free;
end;

procedure TfrmServiceAdd.btnSaveClick(Sender: TObject);
begin
  if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then begin
      if not EditMode then begin
        if Confirmed(MSG_ADD_DATA) then begin
          InitForm;
          frmItemKelola.ReloadOther(0,TServices.getMaxID,True);
        end
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
    end;
end;

function TfrmServiceAdd.Execute(APurpose:string;AServiceSeq: integer): boolean;
begin

  MasterPurpose := APurpose;
  MasterSeq := AServiceSeq;
  EditMode  := (MasterSeq <> 0);
  InitForm;
  if EditMode then
    LoadData;
  Run(Self);
  Result := ModalResult = mrOk;
end;

procedure TfrmServiceAdd.cmbItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    btnSave.SetFocus;
end;

function TfrmServiceAdd.NewExecute(APurpose,AResultType: string): string;
begin
  MasterPurpose := APurpose;
  MasterSeq :=0;
  EditMode  := (MasterSeq <> 0);
  InitForm;
  if EditMode then
    LoadData;
  Run(Self);
  Result := IfThen(AResultType ='NAME',txtNama.Text,txtKode.Text);
end;

procedure TfrmServiceAdd.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
