unit Login;
  {DeFINE DEBUG}
interface

uses
  SQLServerConnections, UConst, Subroutines,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, AdvEdit, ExtCtrls, Buttons, WinXP;

type
  TfrmLogin = class(TForm)
    pnlInput: TPanel;
    txtLoginID: TAdvEdit;
    txtLoginPwd: TAdvEdit;
    lblCopyright: TLabel;
    lblPassword: TLabel;
    lblLogin: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    WinXP1: TWinXP;
    pnlLogo: TPanel;
    imgLogo: TImage;
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    LoginMode: boolean;
    LocalLoginID, LocalLoginName: string;
    LocalAccessLevel, LocalNeedAccessLevel: integer;
  public
    { Public declarations }
    function LogOn: boolean;
    function Authorize(var ALoginID: string; ANeedAccessLevel: integer): boolean;
    procedure Status(const MessageStatus: string = '');
  end;

var
  frmLogin: TfrmLogin;
  NeedAccessLevel: integer = 0;
  myMainForm: TForm = nil;

implementation

//uses MainMenu;
//{$I PROFILE.INC}
{$R *.dfm}

procedure TfrmLogin.btnOKClick(Sender: TObject);
begin
  btnOK.Enabled := false;

  if (GlobalSystemUser.SelectInDB(txtLoginID.Text) = false) then begin
//    if (LoginMode) then UserLog('WARNING invalid login, '+txtLoginID.Text);
    ShowMessage('Invalid login/password.');
    GlobalSystemUser.Reset;
    txtLoginID.SetFocus;
  end else if (GlobalSystemUser.Passwd <> txtLoginPwd.Text)    then begin
//    if (LoginMode) then UserLog('WARNING invalid password, '+txtLoginID.Text);
    ShowMessage('Invalid login/password.');
    GlobalSystemUser.Reset;
    txtLoginID.SetFocus;
  end else if (GlobalSystemUser.DisableDate<>0) then begin
//    if (LoginMode) then UserLog('WARNING login disabled, '+txtLoginID.Text);
    ShowMessage('Login disabled.');
    GlobalSystemUser.Reset;
    txtLoginID.SetFocus;
  end else begin
    LocalLoginID := txtLoginID.Text;
    LocalLoginName := GlobalSystemUser.UserName;
    LocalAccessLevel := GlobalSystemUser.AccessLevel;
    if (LocalAccessLevel<LocalNeedAccessLevel) then begin
      if (LoginMode) then begin
//        UserLog('WARNING access violation, '+txtLoginID.Text);
        ShowMessage('Logon need access level '+IntToStr(LocalNeedAccessLevel)+'.');
      end else
        ShowMessage('Authentication need access level '+IntToStr(LocalNeedAccessLevel)+'.');
      txtLoginID.SetFocus;
    end else begin
//      if (LoginMode) then UserLog('INFO login, '+LocalLoginID);
      ModalResult := mrOK;
    end;
  end;

  btnOK.Enabled := true;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  if Assigned(myMainForm) and (LoginMode) then
    Application.Terminate
  else
    ModalResult := mrCancel;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  LoginMode := true;   {banner4Skin\about1.jpg}
  if (FileExists('Skin\about1.jpg')) then
    imgLogo.Picture.LoadFromFile('Skin\about1.jpg');
  Caption := ReplaceSubStr(Caption,'ApplicationTitle',Application.Title);
{$IFDEF POLITIX}
  lblCopyright.Visible := false;
{$ENDIF}
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  pnlLogo.Visible := (LoginMode);
  lblCopyRight.Visible := (LoginMode);
  if (LoginMode) then Self.ClientHeight := pnlLogo.Height + pnlInput.Height
  else Self.ClientHeight := pnlInput.Height;
  txtLoginID.Clear;
  txtLoginPwd.Clear;
  txtLoginID.SetFocus;
{$IFDEF DEBUG}
  txtLoginID.Text := 'heri';
  txtLoginPwd.Text := 'realtime';
  btnOK.SetFocus;
{$ENDIF}
end;

function TfrmLogin.LogOn: boolean;
begin
  Self.Caption := 'Log on to '+Application.Title;
  LoginMode := true;
  LocalNeedAccessLevel := NeedAccessLevel;

  if Assigned(myMainForm) then myMainForm.Hide;
  Result := (ShowModal=mrOK);
  if (Result) then begin
    GlobalSystemUser.UserId := LocalLoginID;
    GlobalSystemUser.UserName := LocalLoginName;
    GlobalSystemUser.AccessLevel := LocalAccessLevel;
    if Assigned(myMainForm) then myMainForm.Show;
  end else begin
    //if Assigned(myMainForm) then myMainForm.Close;
  end;
end;

function TfrmLogin.Authorize(var ALoginID: string; ANeedAccessLevel: integer): boolean;
var LastBorderStyle: TFormBorderStyle; LastCaption: string;
begin
  Self.Caption := Application.Title+' - Authorization';
  LastBorderStyle := BorderStyle; BorderStyle := bsToolWindow;
  LastCaption := Caption; Caption := Application.Title+' - Otorisasi';
  LoginMode := false;
  LocalNeedAccessLevel := ANeedAccessLevel;

  if (ShowModal=mrOK) then ALoginID := LocalLoginID;
  Result := (ModalResult = mrOK);
  BorderStyle := LastBorderStyle;
  Caption := LastCaption;
end;

procedure TfrmLogin.Status(const MessageStatus: string);
begin
  Self.Caption := 'Log on to '+ Application.Title;
  lblLogin.Visible := (MessageStatus='');
  lblPassword.Visible := (MessageStatus='');
  txtLoginID.Visible := (MessageStatus='');
  txtLoginPwd.Visible := (MessageStatus='');
  btnOK.Visible := (MessageStatus='');
  btnCancel.Visible := (MessageStatus='');
  pnlInput.Caption := MessageStatus;

  try
    if (MessageStatus<>'') then begin
      if (not Self.Visible) then Self.Show;
      //if (not Self.Visible) then Self.Visible := true;
    end else begin
      if (Self.Visible) then Self.Hide;
      //if (Self.Visible) then Self.Visible := false;
    end;
  except
  end;
  Application.ProcessMessages;
end;

end.
