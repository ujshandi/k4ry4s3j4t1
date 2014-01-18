unit MainMenu;

interface

uses
  SQLServerConnections, Subroutines, UConst,AdoDb,IniFiles,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ImgList, Menus, FthCtrls, FthSBar, ExtCtrls, ComCtrls,
  ToolWin, AdvGrid, AdvEdit, Gauges, WinXP, strUtils, jpeg, ImageButton;

{Personalized Windows Message for StatusBar}
const
  WM_UpdateStatusBarMsg = WM_User + 8;
  WM_ResizeScrollBoxMsg = WM_User + 16;

type
  //Table Name: System_Menu
  //* Menu_ID
  //- Menu_Group
  //- Menu_Name
  //- Image_Index
  //- Form_Name
  //- Form_Type
  //    ftDetail[i/u/v]  ex: frmDataBarang     FEditMode
  //    ftLookup[v/p]    ex: frmKelolaBarang   FLookupMode
  //    ftReview[i/r/v]  ex: frmPembelian      FReviewMode
  //    ftBrowse[v/p]    ex: frmRekapPembelian FBrowseMode
  //    ftReport[p]      ex: frmLaporanMutasi
  //    ftSetting[u]     ex: frmSettingPayroll
  //  CanAdd, CanEdit, CanLookup, CanBrowse, CanReview, CanRevers, CanPrint
  //  Run

  //Table Name: System_Access
  //* User_ID
  //* Menu_ID
  //- Access_List: integer (I/U/V/P/R) Number (ex: 1 1 1 1 1 = 31)
  //- Shortcut
  //- OutlookBar_Panel
  //- OutlookBar_Button
  //- Usage_Count

  TfrmMainMenu = class(TForm)
    ImageList: TImageList;
    FramePanel: TPanel;
    StatusBar: TStatusBar;
    TitlePanel: TPanel;
    Splitter1: TSplitter;
    SplitterPanel: TPanel;
    lblJudul: TLabel;
    ScrollBox1: TScrollBox;
    Timer1: TTimer;
    ProgressBar: TProgressBar;
    ShortcutBarPanelPopupMenu: TPopupMenu;
    LargeIcons1: TMenuItem;
    SmallIcons1: TMenuItem;
    AddGroup1: TMenuItem;
    RemoveGroup1: TMenuItem;
    RenameGroup1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    HideShortcutBar1: TMenuItem;
    SmallImageList: TImageList;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ShortcutBarButtonPopupMenu: TPopupMenu;
    N14: TMenuItem;
    OutlookBarShortcut1: TMenuItem;
    Open1: TMenuItem;
    OpeninNewWindow1: TMenuItem;
    N15: TMenuItem;
    RemovefromOutlookBar1: TMenuItem;
    RenameShortcut1: TMenuItem;
    Panel2: TPanel;
    Gauge: TGauge;
    WinXP1: TWinXP;
    MenuPanel: TPanel;
    pclMenu: TPageControl;
    tshSetting: TTabSheet;
    PanelTopMenu: TPanel;
    ImgBanner: TImage;
    ScrollBox2: TScrollBox;
    pnlSetting: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    pnlSett: TPanel;
    ImageButton5: TImageButton;
    Label29: TLabel;
    pnlReport: TPanel;
    ImageButton6: TImageButton;
    pnlTransaksi: TPanel;
    ImageButton7: TImageButton;
    pnlData: TPanel;
    ImageButton8: TImageButton;
    Label41: TLabel;
    Label42: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    lblTanggal: TLabel;
    lblUserLocation: TLabel;
    pnlLogOff: TPanel;
    lblLogOff: TLabel;
    ImageButton1: TImageButton;
    Label1: TLabel;
    Label2: TLabel;
    ImageButton2: TImageButton;
    Label4: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    pnlShutDown: TPanel;
    Label9: TLabel;
    Image1: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    Label20: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label27: TLabel;
    Label28: TLabel;
    Label31: TLabel;

    //new style by jay...
    function GetSubMenuHeight(Sender: TObject): integer;
    procedure ScrollMenu(Sender: TObject);
    procedure Houver(Sender: TObject);
    procedure unHouver(Sender: TObject);

    procedure UpdateStatusBar(var AMessage: TMessage); message WM_UpdateStatusBarMsg;
    procedure ResizeScrollBox(var AMessage: TMessage); message WM_ResizeScrollBoxMsg;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    { MainMenu events }
    procedure FilePrintSetup1Click(Sender: TObject);
    procedure FileLogoff1Click(Sender: TObject);
    procedure FileExit1Click(Sender: TObject);
    procedure ViewGoToMenu1Click(Sender: TObject);
    procedure HelpContent1Click(Sender: TObject);
    procedure HelpTopicSearch1Click(Sender: TObject);
    procedure HelpAbout1Click(Sender: TObject);

    { dynamic MainMenu & ShortcutBar events }
    procedure ShortcutBarContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure LoadMenu(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OutlookBarShortcut1Click(Sender: TObject);
    procedure lblUserLocationClick(Sender: TObject);
    procedure ImageButton2Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);

  protected
    { Private declarations }
    vTag: Integer;
    LastPanel: TPanel; LastPanelParent: TWinControl;
    LastPanelWidth, LastPanelHeight: integer;
    CurrentTopic: string;
    MenuExpand : boolean;
    //new style by jay...
    procedure DestroyMenu;
    procedure AddNewMenu(AParent: TPanel; ACaption: string; ATag: integer; AEnabled, AIsHeader: boolean);
    procedure ArrangeMenuIndex;

    function AddSubMenuItem(aMenuItem:TMenuItem; aCaption:string;AImageIndex: integer; AShortcut: TShortcut; ATag: integer; AEnabled: boolean):TMenuItem;
    procedure AddMainMenuItem(AMenuItem: TMenuItem; ACaption: string; AImageIndex: integer; AShortcut: TShortcut; ATag: integer; AEnabled: boolean);
    procedure AddShortcutBarButton(APanelName: string; AButtonName: string; AImageIndex: integer; ATag: integer);
    procedure ChangeDisplay;
    procedure CreateSystemMenu;
    procedure RefreshFavourite;
    procedure GetPanel(AMenuID: integer);
    procedure PutLastPanel(AShowDefault: boolean = true);
    procedure OpenForm(AMenuID: integer; AShowModal: boolean = false);
    procedure BackupData;
    procedure RestoreData;
    procedure Disconecting;
    procedure Connecting;
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;
  StatusBarText: string = '';

procedure RearrangeForms;
procedure InitializeApplication;
procedure FinalizeApplication;

function Run(Sender: TForm): TModalResult;
function CanAdd(Sender: TForm): boolean;
function CanEdit(Sender: TForm): boolean;
function BisaAkses(ID: integer; Access: TAccessList): Boolean;

function BisaNambah(ID: integer): Boolean;
function BisaLiat(ID: integer): Boolean;
function BisaPrint(ID:integer):boolean;
function CanLookup(Sender: TForm): boolean;
function CanBrowse(Sender: TForm): boolean;
function CanReview(Sender: TForm): boolean;
function CanRevers(Sender: TForm): boolean;
function CanPrint(Sender: TForm): boolean;
function Can_Access(Sender : TForm;MenuID : integer=0):boolean;

procedure StatusBar(Text: string); overload; // set Text='' to clear
procedure StatusBar(Position: integer); overload; // set Position=-1 to hide
procedure ScrollBox(Width, Height: integer);

implementation

uses Login, About, {SettingShortcut,} ChangePassword,{ KelolaUser,} HtmlHlp,
  KelolaUser, PersonKelolaAll,
  ItemKelola,  PenerimaanRekap, KartuStok, CompanyProfile, MotorKelola,
  MekanikPendapatan, RugiLaba, MutasiBarangRekap, ItemPrice, AccountKelola,
  BiayaRekap, SalesServiceRekap, un_ryu, UTransaction, StokOpnameRekap,
  EstimasiRekap, HistoriKendaraan;



{$R *.dfm}

procedure RearrangeForms;
//const
 // FORM_BG_COLOR = $00E9E9E9;//clMoneyGreen;//$00FAE701;
 // FIXED_COLOR = $009D8D7D;//$00325A32;// $009A930A;
 // FIXED_FONT_COLOR = clWhite;// $00FFFFFF;
 // PRIMARY_BAND_COLOR = $00EAFFF4;//$00FFFFCE;
var i, j: integer; Form: TForm;
  Panel: TPanel; Control: TControl; MainPanelFound: boolean; NeedUpdate: boolean;
  AdvStringGrid: TAdvStringGrid; AdvEdit: TAdvEdit; Button: TButton; DateTimePicker: TDateTimePicker;
  ShortCutBar: TFourthShortcutBar; vLabel : TLabel;
  RadioGroup : TRadioGroup; GroupBox : TGroupBox;
  RadioButton : TRadioButton; vCheckBox : TCheckBox;
  StaticText : TStaticText;
begin
  frmMainMenu.Caption := Application.Title;
  GlobalSystemMenu_Arr.LoadFromDB;


  for i:=0 to Application.ComponentCount-1 do
  if (Application.Components[i] is TForm) then begin
    Form := (Application.Components[i] as TForm);
    if (Form.Name='frmMainMenu') then continue;
    //Form.BorderStyle := bsSizeable;
    Form.BorderIcons := [biSystemMenu,biMaximize];
    Form.Position    := poDesktopCenter;
    Form.Color       := clFormBackGround;
//    Form.Font.Color  := clWhite;
    MainPanelFound   := false;

    for j:=0 to Form.ComponentCount-1 do
    if (Form.Components[j] is TAdvStringGrid) then begin
      AdvStringGrid := (Form.Components[j] as TAdvStringGrid);
      AdvStringGrid.FixedColor      := clFixedColum;
      AdvStringGrid.FixedFont.Color := clFixedFont;
      AdvStringGrid.Font.Style      := [];
      AdvStringGrid.SelectionColor  := clSelection;
      AdvStringGrid.SelectionTextColor := clBlack;
      AdvStringGrid.GridLineColor := clBlack;
    end else if (Form.Components[j] is TAdvEdit) then begin
      AdvEdit := (Form.Components[j] as TAdvEdit);

      AdvEdit.DisabledColor := AdvEdit.Color;
      AdvEdit.FocusColor    := clInfoBk;

    end else if (Form.Components[j] is TDateTimePicker) then begin
      DateTimePicker := (Form.Components[j] as TDateTimePicker);
      DateTimePicker.Format := '';
      if DateTimePicker.Kind=dtkDate then begin
        DateTimePicker.DateMode := dmComboBox;
        DateTimePicker.DateFormat := dfShort;
      end;
    end else if (Form.Components[j] is TButton) then begin
      Button := (Form.Components[j] as TButton);
      if (Button.Name='btnCancel') then
        Button.Cancel := true;
    end else if (Form.Components[j] is TPanel) then begin
      Panel := (Form.Components[j] as TPanel);
      Panel.Color := clFormBackGround;
      if (UpperCase(Panel.Name)='MAINPANEL') and (Panel.Name<>'MainPanel') then
        Panel.Name := 'MainPanel';

      if (Panel.Name='MainPanel') then
        MainPanelFound := true;
    end

    else if (Form.Components[j] is TFourthShortcutBar) then begin
      ShortCutBar := (Form.Components[j] as TFourthShortcutBar);
      ShortCutBar.Colors.Background := clFormBackGround;
      ShortCutBar.Colors.Face       := clFormBackGround;
      ShortCutBar.Colors.UseDefault := False;
      ShortCutBar.Colors.Background := clFormBackGround;

    end
    else if (Form.Components[j] is TRadioGroup) then begin
      RadioGroup := (Form.Components[j] as TRadioGroup);
      RadioGroup.Color := clFormBackGround;
      RadioGroup.Font.Name := 'Tahoma';
      RadioGroup.Font.Color := clWhite;
      RadioGroup.Repaint;
      RadioGroup.Refresh;
    end
    else if (Form.Components[j] is TRadioButton) then begin
      RadioButton := (Form.Components[j] as TRadioButton);
      RadioButton.Repaint;
      RadioButton.Font.Color := clWhite;
      RadioButton.Color := clFormBackGround;
      RadioButton.Repaint;

      RadioButton.Font.Name := 'Tahoma';
    end
    else if (Form.Components[j] is TGroupBox) then begin
      GroupBox := (Form.Components[j] as TGroupBox);
      GroupBox.Font.Color := clWindowText;
  //    GroupBox.Font.Name := 'Tahoma';
    end
    else if (Form.Components[j] is TStaticText) then begin
      StaticText := (form.components[j] as TStaticText);
//      StaticText.Font.Color := clbWhite;
      StaticText.Font.Name := 'Tahoma';
    end
    else if (Form.Components[j] is TCheckBox) then begin
      vCheckBox := (form.components[j] as TCheckBox);
      vCheckBox.Font.Color := clWhite;
      vCheckBox.Font.Name := 'Tahoma';
    end
    else if (Form.Components[j] is TLabel) then begin
      vLabel := (form.components[j] as TLabel);
      vLabel.Font.Color := clWhite;
      vLabel.Font.Name := 'Tahoma';
    end;

    NeedUpdate := false;
    for j:=0 to GlobalSystemMenu_Arr.Count-1 do
      if (UpperCase(GlobalSystemMenu_Arr[j].FormName)=UpperCase(Form.Name)) and
        (GlobalSystemMenu_Arr[j].FormType in [ftLookup,ftBrowse, ftSetting{ j+ } {,ftReview}]) then
        NeedUpdate := true;

    if (NeedUpdate) and (not MainPanelFound) then begin
      Panel := TPanel.Create(Form);
      Panel.Name := 'MainPanel';
      Panel.Width := Form.ClientWidth;
      Panel.Height := Form.ClientHeight;
      Form.Color:= clFormBackGround;

      Panel.Caption := '';

      Panel.BevelOuter := bvNone;
      for j:=0 to Form.ComponentCount-1 do
      if (Form.Components[j] is TControl) then begin
        Control := (Form.Components[j] as TControl);
        if (Control<>Panel) and (Control.Parent=Form) then
          Control.Parent := Panel;
        if (Control is TAdvStringGrid) then begin
          AdvStringGrid := (Control as TAdvStringGrid);
          AdvStringGrid.Anchors := [akLeft,akTop,akRight,akBottom];
        end else begin
          if (Control.Left>Panel.Width div 2) then
            Control.Anchors := Control.Anchors - [akLeft] + [akRight];
          if (Control.Top>Panel.Height div 2) then
            Control.Anchors := Control.Anchors - [akTop] + [akBottom];
        end;
      end;
      Panel.Parent := Form;
      Panel.Align := alClient;
    end;
  end;
end;

procedure InitializeApplication;
var vIniFile : TIniFile;
  vExeName : string;
begin
  vIniFile :=  TIniFile.Create(ChangeFileExt(ParamStr(0),'.ini'));

  with vIniFile do begin
    vExeName := ReadString('COMPANY','DBNAME','');
    if vExeName = '' then
       WriteString('COMPANY','DBNAME','')
  end;

  Application.Name := 'KaryaSejati_'+EkstrakString(vExeName,'_',2);
  Application.Title := ReplaceSubStr(Application.Name,'_',' ');
  Application.HelpFile := 'KaryaSejati.chm';

end;

procedure FinalizeApplication;
begin
  GlobalSystemUser.SystemAccess_Arr.SaveUsageCountOnDB;
  GlobalSystemUser.SystemAccess_Arr.Clear;
  Application.Terminate;
end;

function Run(Sender: TForm): TModalResult;
var X: TControl;
begin
  X := TControl(Sender.FindComponent('MainPanel'));
  if (X<>nil) and (X.Parent<>Sender) then
    Result := mrOK
  else
    Result := Sender.ShowModal;
end;

function CanAccess(Sender: TForm; Access: TAccessList): boolean;
var X: TSystemAccess;
begin
  X := GlobalSystemUser.SystemAccess_Arr.GetByFormName(Sender.Name);
  Result := (X<>nil) and (Access in X.AccessList);
  //add by yusup
//  if (GlobalSystemUser.AccessLevel>=LEVEL_DEVELOPER) then Result := true;
    if (GlobalSystemUser.AccessLevel>=LEVEL_OWNER ) then Result := true;
end;


function BisaAkses(ID: integer; Access: TAccessList): Boolean;
var X: TSystemAccess;
begin
  X:= GlobalSystemUser.SystemAccess_Arr.GetByMenuID(ID);
  Result  := (X<>nil) and (Access in X.AccessList);
  if (GlobalSystemUser.AccessLevel>=LEVEL_OWNER ) then Result := true;
end;

function BisaNambah(ID: integer): Boolean;
begin
  Result  := BisaAkses(ID,alInsert);
end;

function BisaLiat(ID: integer): Boolean;
begin
  Result  := BisaAkses(ID,alView);
end;

function BisaPrint(ID: integer): Boolean;
begin
  Result  := BisaAkses(ID,alPrint);
end;

function CanAdd(Sender: TForm): boolean;
begin
  Result := CanAccess(Sender,alInsert);
end;

function CanEdit(Sender: TForm): boolean;
begin
  Result := CanAccess(Sender,alUpdate);
end;

function CanLookup(Sender: TForm): boolean;
begin
  Result := CanAccess(Sender,alView);
end;

function CanBrowse(Sender: TForm): boolean;
begin
  Result := CanAccess(Sender,alView);
end;

function CanReview(Sender: TForm): boolean;
begin
  Result := CanAccess(Sender,alView);
end;

function CanRevers(Sender: TForm): boolean;
begin
  Result := CanAccess(Sender,alRevers);
end;

function CanPrint(Sender: TForm): boolean;
begin
  Result := CanAccess(Sender,alPrint);
end;

function Can_Access(Sender : TForm;MenuID : integer):boolean;
begin
  Result := TSystemAccess.Can_Access(Sender,MenuID);
end;

procedure ScrollBox;
begin
  PostMessage(Application.MainForm.Handle,WM_ResizeScrollBoxMsg,Width,Height);
  Application.ProcessMessages;
end;

procedure StatusBar(Text: string);
begin
  StatusBarText := Text;
  PostMessage(Application.MainForm.Handle,wm_UpdateStatusBarMsg,0,0);
  Application.ProcessMessages;
end;

procedure StatusBar(Position: integer);
begin
  if (Position=-1) then
    PostMessage(Application.MainForm.Handle,wm_UpdateStatusBarMsg,2,0)
  else
    PostMessage(Application.MainForm.Handle,wm_UpdateStatusBarMsg,1,Position);
  Application.ProcessMessages;
end;

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
 GLOBAL_PATH := GetCurrentDir;
  lblUserLocation.Caption := '';
  Self.DoubleBuffered := true;
  StatusBar.Panels[2].Width := 50;
  StatusBar.Panels[1].Width := 150;
  StatusBar.Panels[0].Width := ClientWidth - StatusBar.Panels[1].Width - StatusBar.Panels[2].Width;
  Panel2.SetBounds(StatusBar.Panels[0].Width + 2,
    StatusBar.Top + 2,
    StatusBar.Panels[1].Width - 2,
    StatusBar.Height - 2);
  ProgressBar.SetBounds(
    StatusBar.Panels[0].Width + 2,
    StatusBar.Top + 2,
    StatusBar.Panels[1].Width - 2,
    StatusBar.Height - 2);
  LastPanel := nil;  LastPanelParent := nil;
  LastPanelWidth := 0; LastPanelHeight := 0;
  if (FileExists('Skin\banner.jpg')) then
    self.imgBanner.Picture.LoadFromFile('Skin\banner.jpg');
//  if (FileExists('Skin\banner_emf.emf')) then
//     self.imgBanner.Picture.LoadFromFile('Skin\banner_emf.emf');

end;

procedure TfrmMainMenu.FormShow(Sender: TObject);
begin
//  btnData.Click;
  ChangeDisplay;
 // CreateSystemMenu
end;

procedure TfrmMainMenu.FormActivate(Sender: TObject);
begin
  if (GlobalSystemUser.UserID='') then FileLogoff1Click(nil);
end;

procedure TfrmMainMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  HHCloseAll;
  PutLastPanel;
  DestroyMenu;
  FinalizeApplication;
end;

procedure TfrmMainMenu.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if Assigned(LastPanelParent) then
//    PostMessage(LastPanelParent.Handle,WM_KEYDOWN,Key,0);
  if Key=VK_F1 then
   HHDisplayTopic(CurrentTopic)
  else  if  Key = VK_F5 then
    ViewGoToMenu1Click(Self);
end;

procedure TfrmMainMenu.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  Resize := (NewWidth>400) and (NewHeight>300);
end;

procedure TfrmMainMenu.Timer1Timer(Sender: TObject);
begin
  lblTanggal.Caption := FormatDateTime(LongDateFormat+' '+LongTimeFormat,Now);
end;

procedure TfrmMainMenu.ChangeDisplay;
 var i,j: integer;// Menu: TMenuItem;
//LastSubmenuName,LastMenuGroup: string;
  APanel : TPanel; AImageButton : TImageButton;
  vPictNormal,vPictOver, vPictDisable:string;
begin
 { LastSubmenuName := '';
  subMenu := nil;
  lblUserLocation.Caption := GlobalSystemUser.UserName;
  tag := 0;
}
  MenuExpand := False;
  if (GlobalSystemUser.UserId<>'') then begin
    for i:= 0 to pnlSetting.ControlCount-1 do begin
    if (pnlSetting.Controls[i] is TPanel) then begin
      APanel := (pnlSetting.controls[i] as TPanel);
      if APanel.Name = 'pnlLogOff' then Continue;
      if APanel.Name = 'pnlShutDown' then Continue;
      for j:= 0 to APanel.ControlCount-1 do
        if (APanel.Controls[j] is TImageButton) then begin
          AImageButton := (APanel.Controls[j] as TImageButton);
          AImageButton.Enabled := True;
          case AImageButton.Tag of
          10000 :
            begin
               vPictNormal := 'Skin\Setting_normal.jpg';
               vPictOver := 'Skin\Setting_over.jpg';
               vPictDisable := 'Skin\Setting_dis.jpg';
            end;//utk image setting
          20000 :
             begin
               vPictNormal := 'Skin\master_normal.jpg';
               vPictOver := 'Skin\master_over.jpg';
               vPictDisable := 'Skin\master_dis.jpg';
            end;//utk image setting
          30000 :
            begin
               vPictNormal := 'Skin\trans_normal.jpg';
               vPictOver := 'Skin\trans_over.jpg';
               vPictDisable := 'Skin\trans_dis.jpg';
               {vPictNormal := 'Skin\Trans_normal.jpg';
               vPictOver := 'Skin\Trans_over.jpg';
               vPictDisable := 'Skin\Trans_dis.jpg';}
            end;//utk image setting
          40000 :
            begin
               vPictNormal := 'Skin\lap_normal.jpg';
               vPictOver := 'Skin\lap_over.jpg';
               vPictDisable := 'Skin\lap_dis.jpg';
            end;//utk image setting
          50000 :
            begin
               vPictNormal := 'Skin\fo_normal.jpg';
               vPictOver := 'Skin\fo_over.jpg';
               vPictDisable := 'Skin\fo_dis.jpg';
            end;//utk image Receptionist
          end;
          if (FileExists(vPictNormal)) then
            AImageButton.PictNormal.LoadFromFile(vPictNormal);
          if (FileExists(vPictOver)) then
            AImageButton.PictOver.LoadFromFile(vPictOver);
          if (FileExists(vPictDisable)) then
            AImageButton.PictDisabled.LoadFromFile(vPictDisable);
          AImageButton.OnClick := ScrollMenu;
          AImageButton.Enabled := True;
          MenuExpand := True;
          ScrollMenu(AImageButton);

        end;
    end;

  end;



   { GlobalSystemUser.SystemAccess_Arr.LoadFromDB;
    for i:=0 to GlobalSystemUser.SystemAccess_Arr.Count-1 do
    with GlobalSystemUser.SystemAccess_Arr[i] do begin
      if (Trim(OutlookPanel)='') or (Trim(OutlookButton)='') then continue;
      Self.AddShortcutBarButton(OutlookPanel,OutlookButton,SystemMenu.ImageIndex,SystemMenu.MenuId);
    end;

    GlobalSystemUser.SystemAccess_Arr.RecalculateUsage;
    Self.RefreshFavourite;
    //FileLogoff1.Caption := 'Log Off';
  end else begin
    //FileLogoff1.Caption := 'Log On';
  end;

  // Main Menu
  FileNewData1.Clear;
  FileNewTransaction1.Clear;
  ViewData1.Clear;
  ViewTransaction1.Clear;
  ViewReport1.Clear;
  ViewSettings1.Clear;
  for i:=0 to GlobalSystemMenu_Arr.Count-1 do
  with GlobalSystemMenu_Arr[i] do begin
    case FormType of
      ftDetail: Menu := FileNewData1;
      ftLookup: Menu := ViewData1;
      ftReview: Menu := FileNewTransaction1;
      ftBrowse: Menu := ViewTransaction1;
      ftReport: Menu := ViewReport1;
      ftSetting: Menu := ViewSettings1;
      else Menu := nil;
    end;
    if (Menu=nil) then continue;
    if (MenuGroup<>LastMenuGroup) then begin
      LastMenuGroup := MenuGroup;
      if (i>0) then    Self.AddMainMenuItem(Menu, '-', -1, 0, 0, false);
      Self.AddMainMenuItem(Menu,'******* '+MenuGroup+' *******', -1, 0, 0, false);
    end;
    if copy(MenuName,0,1) <> '*' then begin
     //&&&&&&&&&&&&& add by chan &&&&&&&&&&&&&&
      if (UpperCase(SubMenuName) = 'BARANG') or
         (UpperCase(SubMenuName) = 'PENERIMAAN BARANG') or
         (UpperCase(SubMenuName) = 'RELASI') or
         (UpperCase(SubMenuName) = 'SURAT JALAN') or
         (UpperCase(SubMenuName) = 'CUSTOMER') or
         (UpperCase(SubMenuName) = 'RETUR') or
//         (UpperCase(SubMenuName) = 'RETUR') or
         (UpperCase(SubMenuName) = 'PEMESANAN BARANG') or
         (UpperCase(SubMenuName) = 'PENJUALAN') then begin
         if LastSubmenuName <> SubMenuName then begin
           LastSubmenuName := SubMenuName;
         subMenu := Self.AddSubMenuItem(Menu,SubMenuName,0,0,0,True);
         end;
          if FormType = ftReport then
           Self.AddMainMenuItem(subMenu,MenuName+' (M'+copy(IntToStr(MenuID),2,3)+')', ImageIndex, Shortcut, MenuId,
          (GlobalSystemUser.AccessLevel>=LEVEL_DEVELOPER) or
          (GlobalSystemUser.SystemAccess_Arr.IndexOf(MenuId)<>-1))
         else
         Self.AddMainMenuItem(subMenu,MenuName+' ('+IntToStr(MenuID)+')', ImageIndex, Shortcut, MenuId,
        (GlobalSystemUser.AccessLevel>=LEVEL_DEVELOPER) or
        (GlobalSystemUser.SystemAccess_Arr.IndexOf(MenuId)<>-1));
       end
       else  begin
       //&&&&&&&&&&&&& add by chan &&&&&&&&&&&&&&
        LastSubmenuName := '';
        Self.AddMainMenuItem(Menu, MenuName+' ('+IntToStr(MenuID)+')', ImageIndex, Shortcut, MenuId,
        (GlobalSystemUser.AccessLevel>=LEVEL_DEVELOPER) or
        (GlobalSystemUser.SystemAccess_Arr.IndexOf(MenuId)<>-1));
      end;
    end; }
  end
  else
    DestroyMenu;

  PutLastPanel;

end;

procedure TfrmMainMenu.RefreshFavourite;
var i: integer; Prefix: string;
begin

  for i:=0 to 9 do
    with GlobalSystemUser.SystemAccess_Arr.TopUsage[i] do
      if Assigned(GlobalSystemUser.SystemAccess_Arr.TopUsage[i]) and
        (GlobalSystemUser.SystemAccess_Arr.TopUsage[i].UsageCount>0) then begin
        case SystemMenu.FormType of
          ftDetail: Prefix := 'New';
          ftLookup: Prefix := 'Data';
          ftReview: Prefix := 'New';
          ftBrowse: Prefix := 'Transaction';
          ftReport: Prefix := 'Report';
          ftSetting: Prefix := 'Setting';
        end;

        Self.AddShortcutBarButton('Favourite',Prefix+' '+SystemMenu.MenuName,SystemMenu.ImageIndex,SystemMenu.MenuId);
      end;

end;

procedure TfrmMainMenu.OpenForm(AMenuId: integer; AShowModal: boolean);
var Form: TForm; SystemMenu: TSystemMenu; SystemAccess: TSystemAccess;
begin

  SystemMenu := GlobalSystemMenu_Arr.GetByMenuID(AMenuId);
  if (SystemMenu=nil) then
    raise EAbort.Create('SystemMenu not found.')
  else begin
    Form := TForm(Application.FindComponent(SystemMenu.FormName));
    if (Form<>nil) then begin
      Form.Caption := SystemMenu.MenuName;
      case SystemMenu.FormType of
        ftDetail:  CurrentTopic := 'Manager\Menu New Data\'+SystemMenu.FormName;
        ftLookup:  CurrentTopic := 'Manager\Menu View Data\'+SystemMenu.FormName;
        ftReview:  CurrentTopic := 'Manager\Menu New Transaction\'+SystemMenu.FormName;
        ftBrowse:  CurrentTopic := 'Manager\Menu View Transaction\'+SystemMenu.FormName;
        ftReport:  CurrentTopic := 'Manager\Menu View Report\'+SystemMenu.FormName;
        ftSetting: CurrentTopic := 'Manager\Menu View Setting\'+SystemMenu.FormName;
      end;
    end;
  end;

  SystemAccess := GlobalSystemUser.SystemAccess_Arr.GetByMenuID(AMenuID);
  if (SystemAccess<>nil) then begin
    SystemAccess.IncUsageCount;
    GlobalSystemUser.SystemAccess_Arr.RecalculateUsage;
    Self.RefreshFavourite;
  end;

  if (SystemMenu.FormType in [ftLookup,ftBrowse,ftReview,ftReport, ftSetting{ j+ }]) and (not AShowModal) and
     (Form<>nil) and Can_Access(Form,AMenuID) {and ((CanLookup(Form)) or (CanBrowse(Form)))} then begin
    GetPanel(AMenuID);
//    if (LastPanelParent<>nil) and (LastPanelParent.FindComponent('btnCancel')<>nil) then
  //    TControl(LastPanelParent.FindComponent('btnCancel')).Visible := false;
  end else begin//if (SystemMenu.FormType in [ftReview,ftReport]) then begin
  //  PutLastPanel;
     GetPanel(0);
  end;

  case AMenuID of
    {SETTING}
    1  : frmKelolaUser.execute('');
   100 : frmPersonKelolaAll.Execute;
   103 : frmMotorKelola.Execute(MOTOR_TYPE);
   104 : frmItemKelola.Execute;
   105 : frmItemPrice.Execute;
   106 : frmAccountKelola.Execute;
   300 : frmPenerimaanRekap.Execute(SHIP_TYPE_TERIMA_BARANG,300);//frmRestaurant.Execute;
   301 : frmPenerimaanRekap.Execute(SHIP_TYPE_RETUR_BELI,301);
   302 : frmEstimasiRekap.Execute(ESTIMASI_TYPE_ORDER,303);//Alert(MSG_UNDERCONSTRUCTION); //frmMutasiBarangRekap.Execute(SHIP_TYPE_MUTASI_MASUK,302);
   303 : frmEstimasiRekap.Execute(ESTIMASI_TYPE_1,303);//frmMutasiBarangRekap.Execute(SHIP_TYPE_MUTASI_KELUAR,303);
   304 : frmOpnameRekap.Execute(SHIP_TYPE_OPNAME,304);
   305 : frmSalesServiceRekap.Execute(SHIP_TYPE_SERVICE,305);//frmPenerimaanRekap.Execute(SHIP_TYPE_RETUR_SERVICE,305);
 //ga dipake  306 : frmSalesServiceRekap.Execute(SHIP_TYPE_SALES,306);
   307 : frmPenerimaanRekap.Execute(SHIP_TYPE_RETUR_SALES,307);
   308 : frmPenerimaanRekap.Execute(SHIP_TYPE_CLAIM,308);
   309 : frmBiayaRekap.Execute('',309);
   400 : frmKartuStok.Execute;
   401 : frmHistoriKendaraan.Execute;
   402 : frmRugiLaba.Execute;

   else Alert(MSG_UNDERCONSTRUCTION);//raise EAbort.Create('MenuID not recognize');
  end;
end;

procedure TfrmMainMenu.GetPanel(AMenuID: integer);
var Form: TForm; Panel: TPanel; SystemMenu: TSystemMenu;
  //Icon: TIcon;
   Caption: TCaption;
   //ImageIndex: integer;
begin
  if (AMenuID=0) then begin
    Panel      := frmAbout.MainPanel;
    Caption    := 'About';
//    ImageIndex := -1;
//    DestroyMenu;
  end else begin
    SystemMenu := GlobalSystemMenu_Arr.GetByMenuID(AMenuId);
    if not Assigned(SystemMenu) then Exit;
    Form := (Application.FindComponent(SystemMenu.FormName) as TForm);
    if not Assigned(Form) then Exit;
    Panel := (Form.FindComponent('MainPanel') as TPanel);
    if not Assigned(Panel) then Exit;
    Caption := SystemMenu.MenuName;
  //  ImageIndex := SystemMenu.ImageIndex;
  end;

//  if (LastPanel=Panel) then Exit;

  // set the Caption
  if (Caption='') and (Panel.Parent is TForm) then
    lblJudul.Caption := (Panel.Parent as TForm).Caption
  else
    lblJudul.Caption := Caption;

  // set the Icon
 { if (ImageIndex=-1) then begin
    Image1.Visible := false;
  end else begin
    Icon := TIcon.Create;
    try
      ImageList.GetIcon(ImageIndex,Icon);
//      Image1.Picture.Icon.Assign(Icon);
    finally
      Icon.Destroy;
    end;
    Image1.Visible := true;
  end;
  }
  if Assigned(LastPanel) then
    PutLastPanel(false);

  // set the Panel
  LastPanel         := Panel;
  LastPanelParent   := LastPanel.Parent;
  LastPanel.Visible := false;
  LastPanel.Align   := alNone;
  LastPanel.Parent  := ScrollBox1;
  LastPanelWidth    := LastPanel.Width;
  LastPanelHeight   := LastPanel.Height;
  LastPanel.Visible := true;
  LastPanel.Color   := clFormBackGround;
  ScrollBox1Resize(nil);

end;

procedure TfrmMainMenu.PutLastPanel(AShowDefault: boolean);
var Form: TForm; SystemMenu: TSystemMenu;
begin
  if Assigned(LastPanel) then begin
    if (LastPanelParent.FindComponent('btnCancel')<>nil) then
      TControl(LastPanelParent.FindComponent('btnCancel')).Visible := true;
    LastPanel.Parent := LastPanelParent;
    LastPanel.Align  := alClient;
    LastPanel.Color  := clFormBackGround;
    LastPanel := nil; LastPanelParent := nil;
  end;
  if(AShowDefault)then GetPanel(0);

  //jaya idol
  SystemMenu := GlobalSystemMenu_Arr.GetByMenuID(vTag);
  if not Assigned(SystemMenu) then Exit;
  Form := (Application.FindComponent(SystemMenu.FormName) as TForm);
  if not Assigned(Form) then Exit;

  if vTag <> 0 then
    Form.Close;
  
end;

procedure TfrmMainMenu.ScrollBox1Resize(Sender: TObject);
begin // 552 x 362
  if Assigned(LastPanel) and (LastPanel.Parent=ScrollBox1) then begin
    if (LastPanelHeight<=ScrollBox1.Height) and
       (LastPanelWidth<=ScrollBox1.Width) then
      LastPanel.Align := alClient
    else if (LastPanelHeight<=ScrollBox1.Height) and
       (LastPanelWidth>ScrollBox1.Width) then begin
      LastPanel.Align := alLeft;
      LastPanel.Width := LastPanelWidth;
    end else if (LastPanelHeight>ScrollBox1.Height) and
       (LastPanelWidth<=ScrollBox1.Width) then begin
      LastPanel.Align := alTop;
      LastPanel.Height := LastPanelHeight;
    end else if (LastPanelHeight>ScrollBox1.Height) and
       (LastPanelWidth>ScrollBox1.Width) then begin
      LastPanel.Align := alNone;
      LastPanel.Width := LastPanelWidth;
      LastPanel.Height := LastPanelHeight;
    end;
  end;
end;

procedure TfrmMainMenu.UpdateStatusBar(var AMessage: TMessage);
begin
  case AMessage.WParam of
    0: StatusBar.Panels[0].Text := StatusBarText;
    1: begin
      if (AMessage.LParam <> ProgressBar.Position) then
        ProgressBar.Position := AMessage.LParam ;
      ProgressBar.Show;
    end;
    2: ProgressBar.Hide;
  end;
end;

procedure TfrmMainMenu.ResizeScrollBox(var AMessage: TMessage);
begin
  LastPanel.Align := alNone;
  if (AMessage.WParam>=0) then LastPanelWidth := AMessage.WParam;
  if (AMessage.LParam>=0) then LastPanelHeight := AMessage.LParam;
  ScrollBox1Resize(nil);
end;

procedure TfrmMainMenu.OutlookBarShortcut1Click(Sender: TObject);
//var i: integer;
begin
 { if frmSettingShortcut.Execute then begin

    for i:=0 to GlobalSystemUser.SystemAccess_Arr.Count-1 do
    with GlobalSystemUser.SystemAccess_Arr[i] do begin
      if (Trim(OutlookPanel)='') or (Trim(OutlookButton)='') then continue;
      Self.AddShortcutBarButton(OutlookPanel,OutlookButton,SystemMenu.ImageIndex,SystemMenu.MenuId);
    end;

  end;}
end;

procedure TfrmMainMenu.FilePrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmMainMenu.FileLogoff1Click(Sender: TObject);
begin
  GlobalSystemUser.Reset;
  //DestroyMenu;
  frmLogin.LogOn;

//  ChangeDisplay;
  CreateSystemMenu
end;

procedure TfrmMainMenu.FileExit1Click(Sender: TObject);
begin
  FinalizeApplication;
end;

procedure TfrmMainMenu.MenuClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then
    OpenForm(TMenuItem(Sender).Tag)
  else if (Sender is TFourthShortcutBarButton) then
    OpenForm(TFourthShortcutBarButton(Sender).Tag);
end;

procedure TfrmMainMenu.ViewGoToMenu1Click(Sender: TObject);
var MenuID: string;tmp:integer;
begin
  if InputQuery('Go To Menu','Menu Number',MenuID) then begin
     if UpperCase(copy(MenuID,1,1))= 'M' then
       tmp := StrToIntDef('6'+copy(MenuID,2,3),0)
     else
       tmp := StrToIntDef(MenuID,0);
    OpenForm(tmp);
  end;
end;

procedure TfrmMainMenu.HelpContent1Click(Sender: TObject);
begin
  //Application.HelpCommand(HELP_FINDER, 0);
  HHDisplayTOC;
end;

procedure TfrmMainMenu.HelpTopicSearch1Click(Sender: TObject);
begin
 // Application.HelpCommand(HELP_FINDER, Integer(PChar('')));
  HHDisplayIndex('');
end;

procedure TfrmMainMenu.HelpAbout1Click(Sender: TObject);
begin
  PutLastPanel;
// TODO change to modal
// default form is ProjectName Today
end;

procedure TfrmMainMenu.ShortcutBarContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
//  if (ShortcutBar.GetControlsAtPos(MousePos).ClassName=TFourthShortcutBarButton) then
//    ShortcutBar.PopupMenu := ShortcutBarButtonPopupMenu;
//  else
//    ShortcutBar.PopupMenu := ShortcutBarPanelPopupMenu;
end;

procedure TfrmMainMenu.AddMainMenuItem(AMenuItem: TMenuItem; ACaption: string;
  AImageIndex: integer; AShortcut: TShortcut; ATag: integer; AEnabled: boolean);
var NewMenuItem: TMenuItem;
begin
  NewMenuItem            := TMenuItem.Create(AMenuItem);
  NewMenuItem.Caption    := ACaption;
  NewMenuItem.ImageIndex := AImageIndex;
  NewMenuItem.Shortcut   := AShortcut;
  NewMenuItem.Tag        := ATag;
  NewMenuItem.Enabled    := AEnabled;
  NewMenuItem.OnClick    := MenuClick;
  AMenuItem.Add(NewMenuItem);
end;

procedure TfrmMainMenu.AddShortcutBarButton(APanelName: string; AButtonName: string;
  AImageIndex: integer; ATag: integer);
var
  ShortcutBarPanel: TFourthShortcutBarPanel;
  NewShortcutBarButton: TFourthShortcutBarButton;
begin
  ShortcutBarPanel := nil;

  if not Assigned(ShortcutBarPanel) then begin
    
  end;
  NewShortcutBarButton := ShortcutBarPanel.Buttons.Add;
  NewShortcutBarButton.Text := AButtonName;
  NewShortcutBarButton.ImageIndex := AImageIndex;
  NewShortcutBarButton.Tag := ATag;
  NewShortcutBarButton.OnClick := MenuClick;
end;

procedure TfrmMainMenu.lblUserLocationClick(Sender: TObject);
begin
  frmChangePassword.Execute(GlobalSystemUser.UserId);
end;

function TfrmMainMenu.AddSubMenuItem(aMenuItem: TMenuItem;
  aCaption: string; AImageIndex: integer; AShortcut: TShortcut;
  ATag: integer; AEnabled: boolean):TMenuITem;
var subMenu : TMenuItem;
begin
  subMenu := TMenuItem.Create(aMenuItem);
 // aMenuItem := subMenu.Parent;
  subMenu.Caption   := aCaption;
  subMenu.ImageIndex:= AImageIndex;
  subMenu.ShortCut  := AShortcut;
  subMenu.Tag       := ATag;
  subMenu.Enabled   := AEnabled;
  aMenuItem.Add(subMenu);
  Result := subMenu;
end;

procedure TfrmMainMenu.ButtonClick(Sender: TObject);
begin

//Akses Menu...
  OpenForm(TComponent(Sender).Tag);
  vTag:= TComponent(Sender).Tag;

end;

procedure TfrmMainMenu.AddNewMenu(AParent: TPanel; ACaption: string;
  ATag: integer; AEnabled, AIsHeader: boolean);
var NewLabel: TLabel; NewBevel: TBevel;
begin
  NewLabel:= TLabel.Create(Self);
  NewLabel.Parent      := AParent;
  NewLabel.Caption     := ' '+ACaption;
  NewLabel.Cursor      := crHandPoint;
  NewLabel.Tag         := ATag;
  NewLabel.Align       := alBottom;  //alBottom
  NewLabel.Constraints.MinHeight := 18;
  NewLabel.OnMouseEnter:= Houver;
  NewLabel.OnMouseLeave:= unHouver;

  NewLabel.OnClick     := ButtonClick;
  NewLabel.AutoSize    := True;
  NewLabel.WordWrap    := True;
  NewLabel.ParentFont  := True;
  NewLabel.SendToBack;

  if AIsHeader then begin
    NewLabel.Color     := clPrimaryBand;
    NewLabel.Tag       := 0;
    NewLabel.Layout    := tlBottom;
    NewLabel.Constraints.MinHeight:= 18;
    NewLabel.OnClick   := ScrollMenu;
    NewLabel.Font.Style:= [fsBold];
    NewLabel.BringToFront;

    //garis penghalang...
    NewBevel:= TBevel.Create(Self);
    NewBevel.Parent := AParent;
    NewBevel.Constraints.MinHeight := 5;
    NewBevel.Constraints.MaxHeight := 5;
    NewBevel.Style:= bsLowered;
    NewBevel.Shape:= bsTopLine;
    NewBevel.Align:= alBottom;
    NewBevel.SendToBack;
  end ;
//  AParent.AutoSize:= True;
  AParent.Height:= GetSubMenuHeight(AParent);
  AParent.Color := $00F2F2FF;
end;

procedure TfrmMainMenu.Houver(Sender: TObject);
var HeaderMenu: boolean;
begin
  HeaderMenu:= (Sender as TLabel).Font.Style = [fsbold];
  if not HeaderMenu then begin
    (Sender as TLabel).Font.Style:= [fsUnderLine];
    (Sender as TLabel).Font.Color:= clBlue;
  end
  else begin
    (Sender as TLabel).Font.Style:= [fsBold, fsUnderLine];
    (Sender as TLabel).Font.Color:= clBlue;
  end;
end;

procedure TfrmMainMenu.ScrollMenu(Sender: TObject);
var AMenu: TPanel;
begin
//  AMenu:= TLabel(Sender).Parent as TPanel;
   AMenu:= TIMageButton(Sender).Parent as TPanel;
  AMenu.AutoSize:= False;
 // if MenuExpand then Exit;

  //if (AMenu.Height <> TLabel(Sender).Height) and (not MenuExpand) then begin
  if (AMenu.Height <> TIMageButton(Sender).Height) or (GlobalSystemUser.UserId=''){and (not MenuExpand) }then begin
    AMenu.Height := TLabel(Sender).Height;
    MenuExpand := True;
  end
  else begin
    MenuExpand := False;
    AMenu.Height:= GetSubMenuHeight(AMenu);
  end;
 // lblLogOff.Caption := IfThen(not MenuExpand,'Log Off','Log In');
  lblLogOff.Caption := IfThen(GlobalSystemUser.UserId='','Masuk Aplikasi','Keluar Sementara');
end;

procedure TfrmMainMenu.unHouver(Sender: TObject);
var HeaderMenu: boolean;
begin
  HeaderMenu:= (Sender as TLabel).Font.Style = [fsbold, fsUnderLine];
  (Sender as TLabel).Font.Color:= clBlack;
  if not HeaderMenu then
    (Sender as TLabel).Font.Style:= []
  else
   (Sender as TLabel).Font.Style:= [fsBold];
end;

procedure TfrmMainMenu.CreateSystemMenu;
var i: integer; LastMenuGroup: string;
  vParent,{, APanel,}SubMenu: TPanel; isHeader: boolean;
//  AImageButton : TImageButton;
begin
//  DestroyMenu;
  ChangeDisplay;
  lblUserLocation.Caption := GlobalSystemUser.UserName;
  tag := 0;
//  btnHome.Click;
  SubMenu:= nil;
  for i:=0 to GlobalSystemMenu_Arr.Count-1 do
  with GlobalSystemMenu_Arr[i] do begin
    case FormType of

     // ftLookup: vParent  := PanelData;
    //  ftBrowse: vParent  := PanelTransaction;
    //  ftReport: vParent  := PanelReport;
      ftSetting: vParent := pnlSetting;
      else vParent := nil;
    end;
    if (vParent = nil) then continue;
    if (MenuGroup<>LastMenuGroup) then begin
      LastMenuGroup      := MenuGroup;
      SubMenu            := TPanel.Create(Self);
      SubMenu.Parent     := vParent;
      SubMenu.Align      := alTop;
      SubMenu.AutoSize   := True;
      SubMenu.BevelOuter := bvNone;
      SubMenu.ParentColor:= True;
      SubMenu.Caption    := '';

      isHeader:= True;
      Self.AddNewMenu(SubMenu, MenuGroup, 0,
      (GlobalSystemUser.AccessLevel>=LEVEL_DEVELOPER) or
      (GlobalSystemUser.SystemAccess_Arr.IndexOf(MenuId)<>-1),
      isHeader);
    end;

    Self.AddNewMenu(SubMenu, MenuName, MenuId,
      (GlobalSystemUser.AccessLevel>=LEVEL_DEVELOPER) or
      (GlobalSystemUser.SystemAccess_Arr.IndexOf(MenuId)<>-1),
      False);
  end;

  PutLastPanel;
  ArrangeMenuIndex;
end;

procedure TfrmMainMenu.ArrangeMenuIndex;
var i, j, k, l: integer;
  ATabSheet: TTabSheet; ALabel: TLabel; APanel, ASubPanel: TPanel;
begin
  for i:= 0 to pclMenu.ControlCount-1 do begin
    if (pclMenu.Controls[i] is TTabSheet) then begin
      ATabSheet:= (pclMenu.Controls[i] as TTabSheet);

      for j:= 0 to ATabSheet.ControlCount-1 do begin
        if (ATabSheet.Controls[j] is TPanel) then begin
          APanel:= ATabSheet.Controls[j] as TPanel;

          for k:= 0 to APanel.ControlCount -1 do begin
            if (APanel.Controls[k] is TPanel) then begin
              ASubPanel:= APanel.Controls[k] as TPanel;

              for l:= 0 to ASubPanel.ControlCount-1 do begin
                if (ASubPanel.Controls[l] is TLabel) then begin
                  ALabel:= (ASubPanel.Controls[l] as TLabel);
                  if ALabel.Font.Style = [fsBold] then
                    ALabel.Align:= alTop;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;


procedure TfrmMainMenu.DestroyMenu;
var i, j: integer;
  //ATabSheet: TTabSheet;
  APanel{, ASubPanel}: TPanel;
  AImageButton : TImageButton;
begin
  for i:= 0 to pnlSetting.ControlCount-1 do begin
    if (pnlSetting.Controls[i] is TPanel) then begin
      APanel := (pnlSetting.controls[i] as TPanel);
      if APanel.Name = 'pnlLogOff' then Continue;
      if APanel.Name = 'pnlShutDown' then Continue;
      for j:= 0 to APanel.ControlCount-1 do
        if (APanel.Controls[j] is TImageButton) then begin
          AImageButton := (APanel.Controls[j] as TImageButton);
          AImageButton.Enabled := False;
          AImageButton.OnClick := ScrollMenu;
//          MenuExpand := False;
        // if GlobalSystemUser.UserId <> '' then
            ScrollMenu(AImageButton);
        end;
    end;    

  end;

{  for i:= 0 to pclMenu.ControlCount-1 do
    if (pclMenu.Controls[i] is TTabSheet) then begin
      ATabSheet:= (pclMenu.Controls[i] as TTabSheet);
      for j:= 0 to ATabSheet.ControlCount-1 do
        if (ATabSheet.Controls[j] is TPanel) then begin
          APanel:= ATabSheet.Controls[j] as TPanel;
          for k:= 0 to APanel.ControlCount -1 do
            if (APanel.Controls[k] is TPanel) then begin
              ASubPanel:= APanel.Controls[k] as TPanel;
              for l:= 0 to ASubPanel.ControlCount-1 do
                ASubPanel.Controls[ASubPanel.ControlCount-1].Free;
            end;
        end;
    end;}
end;

procedure TfrmMainMenu.LoadMenu(Sender: TObject);
begin
  pclMenu.ActivePageIndex := TBitBtn(Sender).Tag;

//  PanelMenuCaption.Caption:= TBitBtn(Sender).Caption;
//   btnData.Click;
end;

function TfrmMainMenu.GetSubMenuHeight(Sender: TObject): integer;
var i: integer;
begin
  Result:= 0;
  for i:= 0 to (TPanel(Sender).ControlCount-1) do
    Result:= Result + (TPanel(Sender).Controls[i].Height);
  //ShowMessage(IntToStr(Result))
end;

procedure TfrmMainMenu.ImageButton2Click(Sender: TObject);
begin

  HHDisplayTOC;
end;

procedure TfrmMainMenu.Label6Click(Sender: TObject);
begin
  frmCompany.Execute;

end;

procedure TfrmMainMenu.Label22Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmMainMenu.BackupData;
var  vBranch, vFileName, vServerName:string;
  vIniFile : TIniFile;
begin

  //cari nama server
  vIniFile := TIniFile.Create(ChangeFileExt(ParamStr(0),'.ini'));
  vBranch := vIniFile.ReadString('COMPANY','DBNAME','');
  if vBranch = '' then begin
    vIniFile.Free;
    Alert('Data cabang pada file .ini belum diSet!'+#13+'Hubungi Developper!');
    exit;
  end;
  vIniFile.Free;

  //cari nama server
//  vQuery.SQL.Add('select srvname from master.dbo.sysservers');
  vServerName:= getServerName; //vQuery.Fields[0].AsString;

 { vCommand := ExtractFilePath(Application.ExeName) + 'Backup.bat ';


  if SaveDialog1.Execute then begin
    SaveDialog1.FileName := SaveDialog1.FileName;
    vFileName := SaveDialog1.FileName;
    //txtFileName.Text:= vFileName;
  end
  else exit;

  vCommand := vCommand + vFileName + ' ' + vServerName;
  if WinExec(pchar(vCommand),SHOW_OPENWINDOW) > 31 then
    repeat
      vWindow := FindWindow(nil,'C:\WINDOWS\SYSTEM32\cmd.exe');
    until vWindow = 0;
  }
//  SaveDialog1.FileName := ExtractFilePath(Application.ExeName) +'Bengkel'+ FormatDateTime('ddMMyy',ServerNow);
  SaveDialog1.Filter := 'dat|*.dat';
  SaveDialog1.FileName := ExtractFilePath(Application.ExeName) + vBranch+FormatDateTime('ddMMyy',ServerNow);
  Application.ProcessMessages;
 // vCommand := ExtractFilePath(Application.ExeName) + 'Backup.bat ';

  if SaveDialog1.Execute then begin
    SaveDialog1.FileName := SaveDialog1.FileName;
    vFileName := SaveDialog1.FileName;
  end
  else exit;
 // vWindow := 0;
//   ExtractFileName()
  if Backup_Database(vFileName) then
    Inform('Database telah dibackup.');
    {Confirmed('Database telah dibackup'+#13+'Apakah hasil backup akan dikirim ke pusat?') then begin
        vParameter := ' a '+ EkstrakString(ExtractFileName(vFileName),'.',1)+' '+vFileName;
        if FileExists(vFileName) then                              //pChar(ExtractFilePath(vFileName))
          ShellExecute(Handle,'open','winrar',PChar(vParameter),'',SW_SHOW);
        SendMail(EkstrakString(vFileName,'.',1));
    end;}

end;

procedure TfrmMainMenu.Connecting;
var
  vADOQuery: TADOQuery;
  vADOTable: TADOTable;
  vADOStoredProc: TADOStoredProc;
  i: integer;
  //vPath: string;
begin

  try
     Application.CreateForm(TMyConnection,MyConnection);
//     MyConnection.DataModuleCreate(Self);
    {MyConnection.ADOConnection := TADOConnection.Create(MyConnection);
    MyConnection.ADOConnection.Close;
    vPath := 'FILE NAME='+ ExtractFilePath(Application.ExeName)+ '\Connection.udl';
    //'\DB_YAMAHA.udl';
    MyConnection.ADOConnection.Provider:= 'SQLOLEDB.1';
    MyConnection.ADOConnection.ConnectOptions:= coConnectUnspecified;
    MyConnection.ADOConnection.CursorLocation:= clUseClient;
    MyConnection.ADOConnection.Mode:= cmUnknown;
    MyConnection.ADOConnection.ConnectionString := vPath;
    MyConnection.ADOConnection.LoginPrompt:= False;
    MyConnection.ADOConnection.Open;
    MyConnection.ADOConnection.KeepConnection:= True;}
    repeat Application.ProcessMessages; until MyConnection.ADOConnection.Connected;
  except
    Application.Terminate;
    repeat Application.ProcessMessages; until Application.Terminated;
    raise;
  end;

  for i:= 0 to MyConnection.ComponentCount -1 do begin
    if MyConnection.Components[i] is TADOQuery then begin
      vADOQuery:= (myConnection.Components[i] as TADOQuery);
      vADOQuery.Connection:= MyConnection.ADOConnection;
    end else

    if MyConnection.Components[i] is TADOTable then begin
      vADOTable:= (myConnection.Components[i] as TADOTable);
      vADOTable.Connection:= MyConnection.ADOConnection;
      vADOTable.Active:= True;
    end else

    if MyConnection.Components[i] is TADOStoredProc then begin
      vADOStoredProc:= (MyConnection.Components[i] as TADOStoredProc);
      vADOStoredProc.Connection:= MyConnection.ADOConnection;
      vADOStoredProc.Active:= True;
    end;
  end;

end;

procedure TfrmMainMenu.Disconecting;
{var
  vADOQuery: TADOQuery;
  vADOTable: TADOTable;
  vADOStoredProc: TADOStoredProc;
//  i: integer;
  // vPath: string;}
begin

  try
    MyConnection.Destroy;
    {MyConnection.ADOConnection.Close;
    MyConnection.ADOConnection.ConnectionString := '';
    MyConnection.ADOConnection.KeepConnection := False;
    MyConnection.ADOConnection.Connected:= False;
    MyConnection.ADOConnection.Destroy;}
    Application.ProcessMessages;
  except
    Application.Terminate;
    repeat Application.ProcessMessages; until Application.Terminated;
    raise;
  end;


end;

procedure TfrmMainMenu.RestoreData;
var
  vCommand, vFileName, vServerName: string;
  vWindow: HWND;
  vQuery: TADOQuery;
begin

  //cari nama server
  vQuery:= TADOQuery.Create(nil);
  vQuery.Connection:= MyConnection.ADOConnection;
  vQuery.Close;
  vQuery.SQL.Clear;
  vQuery.SQL.Add('select srvname from master.dbo.sysservers');
  vQuery.Open;
  vServerName:= vQuery.Fields[0].AsString;
  vQuery.Free;


  {IFDEF CICADAS}
//  vCommand := ExtractFilePath(Application.ExeName) + 'Restore.bat ';
  {ENDIF}

  vCommand := ExtractFilePath(Application.ExeName) + 'Restore.bat ';


  if OpenDialog1.Execute then begin
    vFileName := OpenDialog1.FileName;
  end
  else begin
   // Connecting;
    exit;
  end;
  
  //jika status konek, putuskan conection
  if vFileName = '' then exit;

  Disconecting; // .....

  //txtFileName.Text := vFileName;
  vCommand := vCommand + vFileName + ' ' + vServerName;
  vWindow := 0;
  
  if WinExec(pchar(vCommand),SHOW_OPENWINDOW) > 31 then  begin
    Delay(5000);
    repeat
      vWindow := FindWindow(nil,'C:\WINDOWS\SYSTEM32\cmd.exe');
//      Application.ProcessMessages;
    until vWindow = 0;

  end;
  if vWindow = 0 then  begin
    Connecting;
    Inform('Database telah direstore');
  end;

end;

procedure TfrmMainMenu.Label21Click(Sender: TObject);
begin
 // if GlobalSystemUser.AccessLevel >= LEVEL_MANAGER THEN begin
   GetPanel(0);
   BackupData
 // end
  //else
   // Alert(MSG_UNAUTHORISED_ACCESS);
end;

procedure TfrmMainMenu.Label4Click(Sender: TObject);
begin
   if GlobalSystemUser.AccessLevel >= LEVEL_MANAGER THEN begin
     GetPanel(0);
     RestoreData;
   end
   else
    Alert(MSG_UNAUTHORISED_ACCESS);
end;

end.

