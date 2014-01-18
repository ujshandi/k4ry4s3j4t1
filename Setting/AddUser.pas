unit AddUser;
{I ..\..\MODULE.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,{UPayroll,}
  Dialogs, StdCtrls, AdvEdit,SqlServerConnections,UConst,StrUtils,Math,Menus,
  Subroutines{IFDEF PAYROLL, UPayrollENDIF}, Grids,
  BaseGrid, AdvGrid;

type
  TfrmAddUser = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    txtLoginName1: TAdvEdit;
    btnSave: TButton;
    cancelBtn: TButton;
    cbAccessLevel: TComboBox;
    Label5: TLabel;
    txtLoginID: TAdvEdit;
    asgPermission: TAdvStringGrid;
    Label2: TLabel;
    procedure cancelBtnClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure asgPermissionCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure asgPermissionGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure cbAccessLevelChange(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure cbAccessLevelSelect(Sender: TObject);
  private
    { Private declarations }
    accessList : TStringList;
    permissionArr:TSystemMenu_Arr;
    menuArr : TSystemMenu_Arr;
    accessArr:TSystemAccess_Arr;
    aUser:TSystemUser;
    menuGroupList:TStringList;
    EditMode: boolean;
    procedure clearForm;
    function validateForm :boolean;
    procedure loadUserPermission;
    procedure ViewUserPermission;
    procedure loadPermission;
    procedure loadDefaultPermission;

    procedure initForm;
    function isValid: boolean;
    function isSave: boolean;
    //procedure execute(Name: string; jabatan: TJabatan);
  public
    procedure execute(pDeptId:string); overload;
    function execute(ALoginID: string;pDeptId:string): boolean; overload;
    function NewExecute(AUserID: string): boolean;

  end;

var
  frmAddUser: TfrmAddUser;

implementation

uses un_ryu;

//uses mainMenu;

{$R *.dfm}

procedure TfrmAddUser.clearForm;
var i,j,k:integer;
begin
  txtLoginID.Text := '';
//  txtLoginName.Text := '';
  cbAccessLevel.ItemIndex := 0;
  cbAccessLevel.Clear;
  accessList.Clear;
  TSystemUser.AccessLevelList(accessList);
  for i := 0 to accessList.Count-1 do begin
    if GlobalSystemUser.AccessLevel <= StrToInt(accessList.Names[i]) then
      break;
  end;
  j := accessList.Count-i;
  for k:=1 to j do
    accessList.Delete(i);

  asgPermission.ClearNormalCells;
  asgPermission.RowCount := 1;

  NameValueListToValueList(accessList,cbAccessLevel.Items);
  cbAccessLevel.ItemIndex := -1;
  cbAccessLevel.Enabled := true;
end;

procedure TfrmAddUser.execute(pDeptId:string);
begin
  //if not canAdd(self) then begin MessageDlg(MSG_UNAUTHORISED_ACCESS,mtWarning,[mbOK],0);exit;end;
  clearForm;
  txtLoginID.Enabled := true;
  btnSave.Caption := '&Save';
  aUser.Reset;
  loadPermission;
  showModal;
end;

{procedure TfrmAddUser.execute(Name: string; jabatan:TJabatan);
begin
  if not canAdd(self) then begin MessageDlg(MSG_UNAUTHORISED_ACCESS,mtWarning,[mbOK],0);exit;end;
  clearForm;
  txtLoginName.Text := Name;
  if (jabatan.KodeBagian = KASIR) then
    cbAccessLevel.ItemIndex := 1
  else if jabatan.KodeBagian = MANAGER then
    cbAccessLevel.ItemIndex := 3;

  txtLoginID.Enabled := true;
  cbAccessLevel.Enabled := false;
  btnSave.Caption := '&Save';
  loadPermission();
  ShowModal;
end;
}

function TfrmAddUser.execute(ALoginID: string;pDeptId:string): boolean;
begin
//  Result := false;
  //if not CanEdit(self) then begin MessageDlg(MSG_UNAUTHORISED_ACCESS,mtWarning,[mbOK],0);exit;end;
  clearForm;
  aUser.SelectInDB(ALoginID);
  txtLoginID.Text := aUser.UserId;
  txtLoginID.Enabled := false;
//  txtLoginName.Text := aUser.UserName;
//  txtNIK.Text := aSystUser.NIK;
  if (aUser.AccessLevel = LEVEL_OWNER) then
    cbAccessLevel.ItemIndex := cbAccessLevel.Items.IndexOf('Direksi')
  else if (aUser.AccessLevel = LEVEL_ADMIN) then
    cbAccessLevel.ItemIndex := cbAccessLevel.Items.IndexOf('Admin')
  else if (aUser.AccessLevel = LEVEL_MANAGER) then
    cbAccessLevel.ItemIndex := cbAccessLevel.Items.IndexOf('Manager')
  else if (aUser.AccessLevel = LEVEL_SUPERVISOR) then
    cbAccessLevel.ItemIndex := cbAccessLevel.Items.IndexOf('Supervisor')
  else if (aUser.AccessLevel = LEVEL_OPERATOR) then
   cbAccessLevel.ItemIndex := cbAccessLevel.Items.IndexOf('Operator');


  txtLoginID.Enabled := false;
  btnSave.Caption := '&Update';
  loadPermission;
  Result := (ShowModal=mrOK);
end;

procedure TfrmAddUser.cancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmAddUser.validateForm: boolean;
var msgString:string;
begin
  result := true;
  if txtLoginID.Text = '' then begin
    msgstring := msgString + 'Login ID Masih Kosong' +SLineBreak;
    txtLoginID.SetFocus;
    result := false;
  end else begin
    if (txtLoginID.Enabled) AND TSystemUser.IsExistInDB(trim(txtLoginID.Text)) then begin
      msgstring := msgString + 'Login ID sudah dipakai user lain.' +SLineBreak;
      result := false;
    end;
  end;
{  if txtLoginName.Text = '' then begin
    msgstring := msgString + 'Login Name Masih Kosong' +SLineBreak;
    result := false;
  end;}
  if (btnSave.Caption = '&Save') AND (TSystemUser.UserIDAlreadyRegistered(txtLoginID.Text)) then begin
    MessageDlg('User ID ini sudah terdaftar sebagai system user',mtInformation,[mbok],0);
  end;
  if cbAccessLevel.Text = '' then begin
    msgstring := msgString + 'Access Level Belum Dipilih' +SLineBreak;
    result := false;
  end;
  if msgString <> '' then
    MessageDlg(msgString,mtError,[mbOK],0);
end;

procedure TfrmAddUser.btnSaveClick(Sender: TObject);
var systemAccess:TSystemAccess_Arr;i:integer;
    accessListset:TAccessListSet;state:boolean;
//    menuGroupList:TStringList; tempPermission:TSystemMenu_Arr;
begin
  if validateForm = true then begin
    aUser.UserId := txtLoginID.Text;
    aUser.UserName := txtLoginID.Text;

    if cbAccessLevel.Text = 'Direksi' then
      aUser.AccessLevel := LEVEL_OWNER
    else if cbAccessLevel.Text = 'Admin' then
      aUser.AccessLevel := LEVEL_ADMIN
    else if cbAccessLevel.Text = 'Manager' then
      aUser.AccessLevel := LEVEL_MANAGER
    else if cbAccessLevel.Text = 'Supervisor' then
      aUser.AccessLevel := LEVEL_SUPERVISOR
    else if cbAccessLevel.Text = 'Operator' then
      aUser.AccessLevel := LEVEL_OPERATOR;

    systemAccess:=TSystemAccess_Arr.Create(aUser);
    for i:=1 to asgPermission.RowCount-1 do begin
      if asgPermission.Colors[0,i] <> clGradientActiveCaption then begin
        asgPermission.GetCheckBoxState(1,i,state);
        if state then accessListset := accessListset + [alInsert] else accessListset := accessListset - [alInsert];
        asgPermission.GetCheckBoxState(2,i,state);
        if state then accessListset := accessListset + [alUpdate] else accessListset := accessListset - [alUpdate];
        asgPermission.GetCheckBoxState(3,i,state);
        if state then accessListset := accessListset + [alView] else accessListset := accessListset - [alView];
        asgPermission.GetCheckBoxState(4,i,state);
        if state then accessListset := accessListset + [alPrint] else accessListset := accessListset - [alPrint];
        asgPermission.GetCheckBoxState(5,i,state);
        if state then accessListset := accessListset + [alRevers] else accessListset := accessListset - [alRevers];
        systemAccess.Add(asgPermission.Ints[6,i],accessListset,TShortcut(0),'','',0);
      end;
    end;
    if btnSave.Caption = '&Save' then begin
      try
        myConnection.ADOConnection.BeginTrans;
        aUser.InsertOnDB;
        systemAccess.InsertOnDB;
        myConnection.ADOConnection.CommitTrans;
      except
        myConnection.ADOConnection.RollbackTrans;
        raise;
      end;
      MessageDlg('Sukses' + SLineBreak + 'User dapat mengatur password pada saat login pertama',mtInformation,[mbOK],0);
      if MessageDlg('Tambah user baru?',mtInformation,[mbYes,mbNo],0) = mrYes then
        clearForm
      else
        cancelBtnClick(nil);
    end else begin
      try
        myconnection.ADOConnection.BeginTrans;
        aUser.UpdateOnDB;
        systemAccess.DeleteUpdateOnDB;
        myConnection.ADOConnection.CommitTrans;
      except
        myConnection.ADOConnection.RollbackTrans;
        raise;
      end;
      Alert('Sukses');
      cancelBtnClick(nil);
    end;
    systemAccess.Destroy;
  end;
end;

procedure TfrmAddUser.FormCreate(Sender: TObject);
begin
  accessList := TStringList.Create;
  permissionArr:=TSystemMenu_Arr.create;
  menuArr := TSystemMenu_Arr.create;
  accessArr :=TSystemAccess_Arr.Create(self);
  aUser:=TSystemUser.Create;
  menuGroupList := TStringList.Create;
end;

procedure TfrmAddUser.FormDestroy(Sender: TObject);
begin
  accessList.Destroy;
  permissionArr.destroy;
  menuArr.Destroy;
  accessArr.Destroy;
  aUser.Destroy;
  menuGroupList.Destroy;
end;

procedure TfrmAddUser.FormShow(Sender: TObject);
begin
  if txtLoginID.Enabled then txtLoginId.SetFocus else cbAccessLevel.SetFocus;
end;

procedure TfrmAddUser.loadPermission;
var i,j,row,index:integer;accessList:TAccessListSet;tempPermission: TSystemMenu_Arr;
begin
  permissionArr.Clear;
  permissionArr.LoadFromDB;

  //Group permission
  permissionArr.getMenuGroupList(menuGroupList);
  for i:=0 to menuGroupList.Count-1 do begin
    tempPermission := menuGroupList.Objects[i] as TSystemMenu_Arr;
    permissionArr.getMenuGroup(tempPermission,menuGroupList.Strings[i]);
  end;

  accessArr.Destroy;
  accessArr := TSystemAccess_Arr.Create(aUser);
//  asgPermission.RowCount := permissionArr.count+1;
  if aUser.UserId <> '' then begin
    accessArr.LoadFromDB;
    asgPermission.RowCount := 1;
    asgPermission.UnHideColumnsAll;
    for i:=0 to MenuGroupList.Count-1 do begin
      asgPermission.AddRow;
      asgPermission.Cells[0,asgPermission.RowCount-1] := MenuGroupList.Strings[i];
      asgPermission.FontStyles[0,asgPermission.RowCount-1] := [fsBold];
      //color the row
      for j:=0 to asgPermission.ColCount-1 do asgPermission.Colors[j,asgPermission.RowCount-1] := clGradientActiveCaption;
      tempPermission := TSystemMenu_Arr(MenuGroupList.Objects[i]);
      for j:=0 to tempPermission.Count-1 do begin
        asgPermission.AddRow;
        row := asgPermission.RowCount-1;
        asgPermission.Cells[0,row] := tempPermission[j].MenuName;
        asgPermission.Ints[6,row] := tempPermission[j].MenuId;
        index := accessArr.IndexOf(tempPermission[j].MenuId);
        if (index >= 0) then begin
          accessList := accessArr[index].AccessList;
          case tempPermission[j].FormType of
            ftDetail:
            begin
              asgPermission.AddCheckBox(1,row,alInsert in accessList,false);
              asgPermission.AddCheckBox(2,row,alUpdate in accessList,false);
              asgPermission.AddCheckBox(3,row,alView in accessList,false);
            end;
            ftLookup:
            begin
              asgPermission.AddCheckBox(3,row,alView in accessList,false);
              asgPermission.AddCheckBox(4,row,alPrint in accessList,false);
            end;
            ftReview:
            begin
              asgPermission.AddCheckBox(1,row,alInsert in accessList,false);
              asgPermission.AddCheckBox(3,row,alView in accessList,false);
              asgPermission.AddCheckBox(5,row,alRevers in accessList,false);
            end;
            ftSetting:asgPermission.AddCheckBox(2,row,alUpdate in accessList,false);
            else begin
              asgPermission.AddCheckBox(3,row,alView in accessList,false);
              asgPermission.AddCheckBox(4,row,alPrint in accessList,false);
            end
          end;
        end else begin
          case tempPermission[j].FormType of
            ftDetail:
            begin
              asgPermission.AddCheckBox(1,row,true,false);
              asgPermission.AddCheckBox(2,row,true,false);
              asgPermission.AddCheckBox(3,row,true,false);
            end;
            ftLookup:
            begin
              asgPermission.AddCheckBox(3,row,true,false);
              asgPermission.AddCheckBox(4,row,true,false);
            end;
            ftReview:
            begin
              asgPermission.AddCheckBox(1,row,true,false);
              asgPermission.AddCheckBox(3,row,true,false);
              asgPermission.AddCheckBox(5,row,true,false);
            end;
            ftSetting:asgPermission.AddCheckBox(2,row,true,false);
            else begin
              asgPermission.AddCheckBox(3,row,true,false);
              asgPermission.AddCheckBox(4,row,true,false);
            end
          end;
        end;
      end;
    end;
    asgPermission.HideColumn(6);
  end else
    LoadDefaultPermission;
end;

procedure TfrmAddUser.asgPermissionCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
//  if GlobalSystemUser.AccessLevel >= LEVEL_OWNER then
 //   CanEdit := true;
  CanEdit:= ACol = 2;
end;

procedure TfrmAddUser.asgPermissionGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign:= taCenter
  else if ACol = 2 then HAlign := taCenter;
end;

procedure TfrmAddUser.loadDefaultPermission;
var state:boolean;i,j,row:integer;tempPermission:TSystemMenu_Arr;
begin
  state := false;
  asgPermission.RowCount := 1;
  //Group permission
  for i:=0 to menuGroupList.Count-1 do begin
    tempPermission := menuGroupList.Objects[i] as TSystemMenu_Arr;
    permissionArr.getMenuGroup(tempPermission,menuGroupList.Strings[i]);
  end;

  if (cbAccessLevel.ItemIndex >= 0) AND (permissionArr.Count > 0) then begin
    asgPermission.UnHideColumnsAll;
    for i:=0 to MenuGroupList.Count-1 do begin
      asgPermission.AddRow;
      asgPermission.Cells[0,asgPermission.RowCount-1] := MenuGroupList.Strings[i];
      asgPermission.FontStyles[0,asgPermission.RowCount-1] := [fsBold];
      //color the row
      for j:=0 to asgPermission.ColCount-1 do asgPermission.Colors[j,asgPermission.RowCount-1] := clGradientActiveCaption;

      tempPermission := TSystemMenu_Arr(MenuGroupList.Objects[i]);
      for j:=0 to tempPermission.Count-1 do begin
        //menentukan default access rights
       // if accessList.Names[cbAccessLevel.ItemIndex] = IntToStr(LEVEL_KASIR) then
        //  state:=false
        if accessList.Names[cbAccessLevel.ItemIndex] = IntToStr(LEVEL_SUPERVISOR) then begin
            if {$IFDEF ACCOUNTING}(tempPermission[j].MenuGroup = MENU_GROUP_ACCOUNTING) OR {$ENDIF}
               (tempPermission[j].MenuGroup = MENU_GROUP_SYSTEM) then state := false
            else state:=true;
        end else if accessList.Names[cbAccessLevel.ItemIndex] = IntToStr(LEVEL_ADMIN) then begin
            if {$IFDEF ACCOUNTING}(tempPermission[j].MenuGroup = MENU_GROUP_ACCOUNTING) OR {$ENDIF}
               (tempPermission[j].MenuGroup = MENU_GROUP_SYSTEM) then state := false
            else state:=true;
        end else if accessList.Names[cbAccessLevel.ItemIndex] = IntToStr(LEVEL_MANAGER) then begin
            if {$IFDEF ACCOUNTING}(tempPermission[j].MenuGroup = MENU_GROUP_ACCOUNTING) OR {$ENDIF}
               (tempPermission[j].MenuGroup = MENU_GROUP_SYSTEM) then state := false
            else state:=true;
        end else if accessList.Names[cbAccessLevel.ItemIndex] = IntToStr(LEVEL_OWNER) then
          state := true
        else if accessList.Names[cbAccessLevel.ItemIndex] = IntToStr(LEVEL_DEVELOPER) then
          state:=true;

        //nama menu
        asgPermission.AddRow;
        row := asgPermission.RowCount-1;
        asgPermission.Cells[0,row] := tempPermission[j].MenuName;
        asgPermission.Ints[6,row] := tempPermission[j].MenuId;

        case tempPermission[j].FormType of
          ftDetail:
          begin
            asgPermission.AddCheckBox(1,row,state,false);
            asgPermission.AddCheckBox(2,row,state,false);
            asgPermission.AddCheckBox(3,row,state,false);
          end;
          ftLookup:
          begin
            asgPermission.AddCheckBox(3,row,state,false);
            asgPermission.AddCheckBox(4,row,state,false);
          end;
          ftReview:
          begin
            asgPermission.AddCheckBox(1,row,state,false);
            asgPermission.AddCheckBox(3,row,state,false);
            asgPermission.AddCheckBox(5,row,state,false);
          end;
          ftSetting:asgPermission.AddCheckBox(2,row,state,false);
          else begin
            asgPermission.AddCheckBox(3,row,state,false);
            asgPermission.AddCheckBox(4,row,state,false);
          end;
        end;
      end;
    end;
  end;
  asgPermission.HideColumn(6);
end;

procedure TfrmAddUser.cbAccessLevelChange(Sender: TObject);
begin
  //loadDefaultPermission;
{  if (cbAccessLevel.Text = 'Admin') or (cbAccessLevel.Text = 'Owner') or (cbAccessLevel.Text = 'Developer') then
     cmbDept.items.Clear
  else
     TPayrollDepartment.GetListDepartment(listDept,cmbDept.Items);}
end;

procedure TfrmAddUser.loadUserPermission;
var i:integer; SystemMenu:TSystemMenu_Arr;
begin
  asgPermission.RowCount:= 2;
  SystemMenu:= TSystemMenu_Arr.Create;
  SystemMenu.Clear;
  SystemMenu.FindInDB2;
  for i:= 0 to SystemMenu.Count-1 do begin
    asgPermission.AddCheckBox(2,i+1, False,false);
    asgPermission.Cells[1, i+1]:= SystemMenu[i].MenuName;
    asgPermission.Ints[3,  i+1]:= SystemMenu[i].MenuId;
    asgPermission.AddRow;
  end;

  asgPermission.AutoNumberCol(0);
  asgPermission.AutoSizeColumns(True, 4);
  asgPermission.ColWidths[3]:= 0;
  DeleteRowTerakhir(asgPermission,2,1);
  SystemMenu.Free;
end;

function TfrmAddUser.isSave: boolean;
var state:boolean;i:integer;
  SystemAccsess:TSystemAccess;
  SystemUser:TSystemUser;
begin
  state:= False;
  SystemUser:= TSystemUser.Create;
  SystemAccsess:= TSystemAccess.Create(SystemUser);

  SystemUser.UserId:= txtLoginID.Text;
  SystemUser.UserName:= txtLoginID.Text;
  SystemUser.AccessLevel:= StrToInt(accessList.Names[cbAccessLevel.ItemIndex]);

  try
    MyConnection.BeginSQL;
    if EditMode then
      SystemUser.UpdateOnDB
    else
      SystemUser.InsertOnDB;

    SystemAccsess.SystemUser.UserId:= SystemUser.UserId;

    for i:= 0 to asgPermission.RowCount-1 do begin
      if not IsClear(asgPermission, i+1, 3) then begin
        asgPermission.GetCheckBoxState(2,i+1,state);
        SystemAccsess.SystemUser.UserId:= SystemUser.UserId;
        SystemAccsess.SystemMenu.MenuId:= asgPermission.Ints[3, i+1];
        SystemAccsess.CanAccess:= IfThen(state, -1, 0);
        if TSystemAccess.IsExisInDB(SystemUser.UserId, SystemAccsess.SystemMenu.MenuId) then
          SystemAccsess.UpdateOnDB
        else
          SystemAccsess.InsertOnDB;
      end;
    end;
    MyConnection.EndSQL;
    Result:= True;
    if EditMode then
      Inform(MSG_SUCCESS_UPDATE)
    else Inform(MSG_SUCCESS_SAVING);
  except
    myConnection.UndoSQL;
    Result:= False;
    if EditMode then
      Inform(MSG_UNSUCCESS_UPDATE)
    else Inform(MSG_UNSUCCESS_SAVING);

  end;
  SystemAccsess.Free;
  SystemUser.Free;

end;

procedure TfrmAddUser.ViewUserPermission;
var i: integer; SystemAccess:TSystemAccess_Arr;
begin
  asgPermission.RowCount:= 2;

  SystemAccess:= TSystemAccess_Arr.Create(aUser);
  SystemAccess.Clear;
  SystemAccess.LoadFromDB2(aUser.UserId);
  for i:= 0 to SystemAccess.Count-1 do begin
    asgPermission.AddCheckBox(2,i+1, (SystemAccess[i].CanAccess = -1),false);
    asgPermission.Cells[1, i+1]:= SystemAccess[i].SystemMenu.MenuName;
    asgPermission.Ints[3,  i+1]:= SystemAccess[i].SystemMenu.MenuId;
    asgPermission.AddRow;
  end;
  asgPermission.AutoNumberCol(0);
  asgPermission.AutoSizeColumns(True, 4);
  asgPermission.ColWidths[3]:= 0;
  DeleteRowTerakhir(asgPermission,2,1);
  SystemAccess.Free;

end;

function TfrmAddUser.NewExecute(AUserID: string): boolean;
begin
//  Result := false;
  EditMode:= AUserID <> '';
  clearForm;
  initForm;

  aUser.Reset;
  if EditMode then begin
    aUser.SelectInDB(AUserID);
    txtLoginID.Text := aUser.UserId;
    txtLoginID.Enabled := false;
//    txtLoginName.Text := aUser.UserName;

    cbAccessLevel.ItemIndex:= accessList.IndexOfName(IntToStr(aUser.AccessLevel));
  end;

  if EditMode then ViewUserPermission;
//  else loadUserPermission;
  Result := (ShowModal=mrOK);
end;

procedure TfrmAddUser.SaveClick(Sender: TObject);
begin
  if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSave then
      if EditMode then ModalResult:= mrOk
      else
        if Confirmed(MSG_ADD_DATA) then
          initForm
        else
          ModalResult:= mrOk;
end;

function TfrmAddUser.isValid: boolean;
begin
  Result:= False;
{  if txtLoginName.Text = '' then
    Inform('Login Name belum diisi.')
  else}
  if txtLoginID.Text = '' then
    Inform('Login Id belum diisi.')
  else
  if cbAccessLevel.ItemIndex = -1 then
    Inform('Access Level belum diisi.')
  else Result:= True;

end;

procedure TfrmAddUser.initForm;
begin
  ResetGrid(asgPermission, 2, 5,1,1);
  asgPermission.ColumnSize.StretchColumn:= 1;
  txtLoginID.Text := '';
//  txtLoginName.Text := '';


  asgPermission.ClearNormalCells;
  asgPermission.RowCount := 1;

 // TSystemUser.AccessLevelList(accessList);
 // NameValueListToValueList(accessList,cbAccessLevel.Items);
  cbAccessLevel.ItemIndex := -1;
  cbAccessLevel.Enabled := true;

  btnSave.Caption:= IfThen(EditMode, '&Update', '&Save');
  txtLoginID.Enabled := not EditMode;
  loadUserPermission;
end;

procedure TfrmAddUser.cbAccessLevelSelect(Sender: TObject);
var i: integer;
   vStatus : boolean;
begin
  if cbAccessLevel.ItemIndex=-1 then exit;
  vStatus := StrToInt(accessList.Names[cbAccessLevel.itemIndex])>LEVEL_OPERATOR;
     for i:= 1 to asgPermission.RowCount -1 do
        asgPermission.SetCheckBoxState(2,i,vStatus);
end;

end.
