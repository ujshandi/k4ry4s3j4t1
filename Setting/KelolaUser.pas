unit KelolaUser;

interface

uses
  Subroutines, AddUser,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls;

type
  TfrmKelolaUser = class(TForm)
    asgSystUsers: TAdvStringGrid;
    btnRemove: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure asgSystUsersButtonClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure asgSystUsersGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure asgSystUsersDblClick(Sender: TObject);
    procedure asgSystUsersCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure asgSystUsersCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
  private
    systUsers : TSystemUser_Arr;
    accessList : TStringList;
    DeptID : String;
    procedure loadData;
    { Private declarations }
  public
    procedure execute(pDeptIDe:string);
    { Public declarations }
  end;

var
  frmKelolaUser: TfrmKelolaUser;

implementation

uses ChangePassword, {MainMenu,} UConst, MainMenu;

{$R *.dfm}

{ TkelolaSystUserFrm }

procedure TfrmKelolaUser.execute(pDeptIDe:string);
begin
 {if not CanLookup(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    Exit;
  end;}

  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;

  DeptID := pDeptIDe;
  loadData;
  Run(Self);
end;

procedure TfrmKelolaUser.loadData;
var i:integer;
begin
  TSystemUser.AccessLevelList(accessList);
  systUsers.Clear;
  systUsers.FindOnDB('','',GlobalSystemUser.AccessLevel,False,DeptID);
  asgSystUsers.RowCount := systUsers.Count + 1;
  asgSystUsers.Cells[1,0] := 'Login ID';
  asgSystUsers.Cells[2,0] := 'Login Name';
  asgSystUsers.Cells[3,0] := 'Access Level';
  asgSystUsers.Cells[4,0] := 'Status';
  asgSystUsers.Cells[5,0] := 'Action';

  for i := 0 to systUsers.Count-1 do begin
    asgSystUsers.Cells[1,i+1] := systUsers[i].UserId;
    asgSystUsers.Cells[2,i+1] := systUsers[i].UserName;
    asgSystUsers.Cells[3,i+1] := accessList.Values[IntToStr(systUsers[i].AccessLevel)];
    asgSystUsers.AddCheckBox(4,i+1,not systUsers[i].is_disabled,false);
    asgSystUsers.AddButton(5,i+1,60,18,'Set Password',haCenter,vaCenter);
  end;
  asgSystUsers.AutoNumberCol(0);
end;

procedure TfrmKelolaUser.FormCreate(Sender: TObject);
begin
  accessList := TStringList.Create;
  systUsers := TSystemUser_Arr.Create;
end;

procedure TfrmKelolaUser.FormDestroy(Sender: TObject);
begin
  SystUsers.Destroy;
  accessList.Destroy;
end;

procedure TfrmKelolaUser.asgSystUsersButtonClick(Sender: TObject; ACol, ARow: Integer);
begin
  frmChangePassword.Execute(asgSystUsers.Cells[1,asgSystUsers.Row]);
  {if (MessageDlg('Password di-reset kosong',mtConfirmation,[mbYes,mbNo],0)) = mrYes then begin
    systUsers[ARow-1].LoginPwd := '';
    systUsers[ARow-1].UpdatePasswordOnDB;
    ShowMessage('Sukses');
  end;}
end;

procedure TfrmKelolaUser.asgSystUsersGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 THEN
    HAlign := taCenter
  else  if ACol in [0,4,5] then
    HAlign := taCenter;
end;

procedure TfrmKelolaUser.btnRemoveClick(Sender: TObject);
var aUser :TSystemUser; i:integer; state:boolean;
begin
  aUser := TSystemUser.Create;
  aUser.UserId := asgSystUsers.Cells[1, asgSystUsers.row];
  aUser.DeleteOnDB;
  aUser.Destroy;
  Alert('Sukses');
  if asgSystUsers.Row <> asgSystUsers.RowCount - 1 then begin
    for i := asgSystUsers.Row +1 to asgSystUsers.RowCount -1 do begin
      asgSystUsers.Cells[1,i-1] := asgSystUsers.Cells[1,i];
      asgSystUsers.Cells[2,i-1] := asgSystUsers.Cells[2,i];
      asgSystUsers.Cells[3,i-1] := asgSystUsers.Cells[3,i];
      asgSystUsers.GetCheckBoxState(4,i,state);
      asgSystUsers.SetCheckBoxState(4,i-i,state);
    end;
  end;
  asgSystUsers.RowCount := asgSystUsers.RowCount - 1;
end;

procedure TfrmKelolaUser.btnAddClick(Sender: TObject);
begin
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  frmAddUser.NewExecute('');
  loadData;
end;

procedure TfrmKelolaUser.btnEditClick(Sender: TObject);
begin
  if (asgSystUsers.Row>0) and (asgSystUsers.Row<asgSystUsers.RowCount) then begin
  //  frmAddUser.Execute(asgSystUsers.Cells[1,asgSystUsers.Row],DeptID);
    frmAddUser.NewExecute(asgSystUsers.Cells[1,asgSystUsers.Row]);
    LoadData;
  end;
end;

procedure TfrmKelolaUser.asgSystUsersDblClick(Sender: TObject);
begin
  btnEditClick(nil);
end;

procedure TfrmKelolaUser.asgSystUsersCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);

begin

  systUsers[ARow-1].is_disabled := state;
  //systUsers[ARow-1].UpdateOnDB;
  if state = false then begin

    Alert('User ' + asgSystUsers.Cells[1,Arow] + ' sudah di-NonAktifkan');
  end
  else begin
    Alert('User ' + asgSystUsers.Cells[1,Arow] + ' sudah di-Aktifkan');
  end;

end;

procedure TfrmKelolaUser.asgSystUsersCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := ACol in [4];
end;

end.
