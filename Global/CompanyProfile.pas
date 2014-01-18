unit CompanyProfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit,strUtils,un_ryu, ExtCtrls;

type
  TfrmCompany = class(TForm)
    Label1: TLabel;
    txtName: TAdvEdit;
    txtAddress: TAdvEdit;
    txtCity: TAdvEdit;
    txtTelp1: TAdvEdit;
    txtTelp2: TAdvEdit;
    txtFax: TAdvEdit;
    StaticText1: TStaticText;
    btnSave: TButton;
    btnCancel: TButton;
    txtDesc: TAdvEdit;
    Label2: TLabel;
    mmInfo: TMemo;
    Bevel1: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    function isValid:boolean;
    function isSaved:boolean;
    procedure LoadData;
  public
    { Public declarations }
    procedure Execute;
  end;

var
  frmCompany: TfrmCompany;

implementation

uses  SQLServerConnections, UConst, Subroutines, UMaster;

{$R *.dfm}

{ TfrmCompany }

procedure TfrmCompany.Execute;
begin
  Self.Caption := 'Company Profile';
  LoadData;
  ShowModal;
  Self.ActiveControl := txtName;
end;

procedure TfrmCompany.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmCompany.isSaved: boolean;
var Company : TCompanyProfile; i:integer;
begin
   Result := False;
   Company := TCompanyProfile.Create;
   try

     try
       MyConnection.BeginSQL;

       Company.CompanyName  := txtName.Text;
       Company.Address      := txtAddress.Text;
       Company.Telp1        := txtTelp1.Text;
       Company.Telp2        := txtTelp2.Text;
       Company.City         := txtCity.Text;
       Company.Fax          := txtFax.Text;
       Company.Branch       := txtDesc.Text;
       for i:= 0 to mmInfo.Lines.Count-1 do begin
         Company.Info := Company.Info+mmInfo.Lines.Strings[i]+';';
       end;
       if Company.isExist then
         Company.UpdateOnDB
       else
         Company.InsertOnDB;

       MyConnection.EndSQL;
       Result := True;
     except
       MyConnection.UndoSQL;
     end
   finally
     Company.Free;
   end
end;

function TfrmCompany.isValid: boolean;
begin
  Result := True;
end;

procedure TfrmCompany.LoadData;
var vCompany : TCompanyProfile;i,vCount:integer;
begin
  vCompany := TCompanyProfile.Create;
  try
    if vCompany.SelectInDB then begin
      with vCompany do begin
        txtName.Text  := CompanyName;
        txtAddress.Text := Address;
        txtCity.Text  := City;
        txtTelp1.Text := Telp1;
        txtTelp2.Text := Telp2;
        txtFax.Text   := Fax;
        txtDesc.Text  := Branch;
        vCount := HitungChar(Info,';');
      end;
        mmInfo.Clear;
        for i:=0 to vCount-1 do begin
          mmInfo.Lines.Append( EkstrakString(vCompany.Info,';',i+1));
        end;

    end
    else begin
      txtName.Clear;
      txtAddress.Clear;
      txtCity.Clear;
      txtTelp1.Clear;
      txtTelp2.Clear;
      txtFax.Clear;
      txtDesc.Clear;
      mmInfo.Clear;
    end;
    
  finally
    vCompany.Free;
  end
end;

procedure TfrmCompany.btnSaveClick(Sender: TObject);
begin
   if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
     if isSaved then
       ModalResult := mrOk;
end;

end.
