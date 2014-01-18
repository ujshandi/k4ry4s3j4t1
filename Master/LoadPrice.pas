unit LoadPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, AdvEdit, ExtCtrls, Menus;

const colCode = 0;
      colName = 1;
      colPrice = 2;
      colStatus = 3;
type
  TfrmLoadPrice = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    asgPrice: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    txtPriceCount: TAdvEdit;
    OpenDialog1: TOpenDialog;
    StaticText1: TStaticText;
    PopupMenu1: TPopupMenu;
    DeleteRowSelected1: TMenuItem;
    GroupBox1: TGroupBox;
    chkSame: TCheckBox;
    chkSortir: TCheckBox;
    Button1: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    Button3: TButton;
    asgUpdate: TAdvStringGrid;
    Label2: TLabel;
    txtUpdateCount: TAdvEdit;
    Splitter2: TSplitter;
    Panel4: TPanel;
    asgInsert: TAdvStringGrid;
    Label4: TLabel;
    txtInsertCount: TAdvEdit;
    Label5: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure asgUpdateGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Button3Click(Sender: TObject);
    procedure DeleteRowSelected1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure InitGrid;
  public
    { Public declarations }
    procedure Execute;

  end;

var
  frmLoadPrice: TfrmLoadPrice;


implementation

uses UMaster, un_ryu, SQLServerConnections, UConst, Subroutines;

{$R *.dfm}

{ TfrmLoadPrice }

procedure TfrmLoadPrice.Execute;
begin
  Self.Caption := 'Update harga dari file excel';
  InitGrid;
  txtPriceCount.Clear;
  txtUpdateCount.Clear;
  chkSame.Checked := False;
  chkSortir.Checked := False;
  ShowModal;
end;

procedure TfrmLoadPrice.Button1Click(Sender: TObject);
var i,vRow:integer; vAdd : boolean;
begin
   try
     //vAdd := False;
     txtUpdateCount.Clear;
     txtInsertCount.Clear;
     Screen.Cursor := crHourGlass;
     ResetGrid(asgUpdate,2,5,1,0);
     ResetGrid(asgInsert,2,5,1,0);
     for i:= 1 to asgPrice.RowCount-1 do  begin
       {if (not chkSortir.Checked) and (not chkSame.Checked) then //jika tanpa filter
         vAdd := true
       else if (chkSortir.Checked) and (not chkSame.Checked) then //jika sortir yg ada pd dtbas
         // dan tampilkan harga yg sama juga
         vAdd := TItems.isExistCode(asgPrice.Cells[colCode,i])
       else if (chkSortir.Checked) and (chkSame.Checked) then
         vAdd := (TItems.isExistCode(asgPrice.Cells[colCode,i],0,IfThen(chkSame.Checked,asgPrice.Floats[colPrice,i],0)))
       else if (not  chkSortir.Checked) and (chkSame.Checked) then
         vAdd := not TItems.isOldSameNewPrice(asgPrice.Cells[colCode,i],0,asgPrice.Floats[colPrice,i]);
        }
       vAdd := TItems.isExistCode(asgPrice.Cells[colCode,i]);
       if vAdd then begin
         vRow := asgUpdate.RowCount-1;
         asgUpdate.Update;
         asgUpdate.Cells[colCode,vRow] := asgPrice.Cells[colCode,i];
         asgUpdate.Cells[colName,vRow] := asgPrice.Cells[colName,i];
         asgUpdate.Floats[colPrice,vRow] := asgPrice.Floats[colPrice,i];
         asgUpdate.Cells[colStatus,vRow] := 'Not yet';
         txtUpdateCount.IntValue := vRow;
         txtUpdateCount.Update;
         asgUpdate.AddRow;
       end
       else begin
         vRow := asgInsert.RowCount-1;
         asgInsert.Update;
         asgInsert.Cells[colCode,vRow] := asgPrice.Cells[colCode,i];
         asgInsert.Cells[colName,vRow] := asgPrice.Cells[colName,i];
         asgInsert.Floats[colPrice,vRow] := asgPrice.Floats[colPrice,i];
         asgInsert.Cells[colStatus,vRow] := 'Not yet';
         txtInsertCount.IntValue := vRow;
         txtInsertCount.Update;
         asgInsert.AddRow;

         SetCellColor(asgPrice,clRed,colCode,i,colPrice);
         asgPrice.Update;
       end;
     end;  
     DeleteRowTerakhir(asgUpdate,2,1);
     DeleteRowTerakhir(asgInsert,2,1);

     asgUpdate.AutoSizeColumns(True,2);
     asgInsert.AutoSizeColumns(True,2);
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmLoadPrice.Button2Click(Sender: TObject);
   var vFileName : String;
begin
  OpenDialog1.Filter := '*.xls';
  if OpenDialog1.Execute then begin
    vFileName := OpenDialog1.FileName;
    if vFileName = '' then exit;
    Delay(1000);
    Self.Update;
     try
      Screen.Cursor := crHourGlass;
      asgPrice.LoadFromXLS(vFileName);
      asgPrice.AutoSizeColumns(True,3);
      txtPriceCount.IntValue := asgPrice.RowCount-1;
    finally
      Screen.Cursor := crDefault;


     end;
  end;
end;

procedure TfrmLoadPrice.asgUpdateGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
 if ARow = 0 then
    HAlign := taCenter
  else if ACol = colPrice then
    HAlign := taRightJustify;
end;

procedure TfrmLoadPrice.Button3Click(Sender: TObject);
var vItem : TItems;
    i : integer;
begin

   vItem := TItems.Create;
   try
     Screen.Cursor := crSQLWait;
     try
       MyConnection.BeginSQL;
       for i:= 1 to asgUpdate.RowCount-1 do begin
          if asgUpdate.Cells[colStatus,i] = 'DONE' then
            Continue
          else begin
            vItem.Reset;
            vItem.ItemCode := asgUpdate.Cells[ColCode,i];
            vItem.Price  := asgUpdate.Floats[ColPrice,i];
            vItem.UpdatePrice;
            asgUpdate.Cells[colStatus,i] := 'DONE';
            SetCellFontColor(asgUpdate,clRed,colCode,i);
            asgUpdate.Update;
          end;
       end;

      { for i:= 1 to asgInsert.RowCount-1 do begin
          if asgInsert.Cells[colStatus,i] = 'DONE' then
            Continue
          else begin
            vItem.Reset;
            vItem.ItemCode := asgInsert.Cells[ColCode,i];
            vItem.Price    := asgInsert.Floats[ColPrice,i];
            vItem.ItemName := asgInsert.Cells[colName,i];
            vItem.UserInsert := GlobalSystemUser.UserId;
            vItem.ItemType := ITEM_TYPE_PART;
            vItem.InsertPrice;
            asgInsert.Cells[colStatus,i] := 'DONE';
            SetCellFontColor(asgInsert,clRed,colCode,i);
            asgInsert.Update;
          end;
       end;}

       MyConnection.EndSQL;
       Inform(MSG_SUCCESS_UPDATE);
     except
       Alert(MSG_UNSUCCESS_UPDATE);
       MyConnection.UndoSQL;
     end;
   finally
     vItem.Free;
     Screen.Cursor := crDefault;
   end;
  // Inform(MSG_UNDERCONSTRUCTION);
end;

procedure TfrmLoadPrice.DeleteRowSelected1Click(Sender: TObject);
var i: integer;
begin
  
  //vCount := 0;
  for i:= asgUpdate.RowCount-1 downto 1 do
    if (asgUpdate.IsSelected(colCode,i)) or (asgUpdate.IsSelected(colPrice,i)) or
      (asgUpdate.IsSelected(colName,i)) then
       if asgUpdate.RowCount = 2 then
         asgUpdate.ClearRows(i,1)
       else
         asgUpdate.RemoveRows(i,1);
      //Inc(vCount);
//  ShowMessage(IntToStr(vCount)+', row selected');
end;

procedure TfrmLoadPrice.InitGrid;
begin
//  ResetGrid(asgPrice,2,5,1,0);
  asgPrice.RowCount := 2;
  asgPrice.ClearNormalCells;
  ResetGrid(asgUpdate,2,5,1,0);
  ResetGrid(asgInsert,2,5,1,0);

end;

procedure TfrmLoadPrice.Button4Click(Sender: TObject);
var vItem : TItems;
    i : integer;
begin

   vItem := TItems.Create;
   try
     Screen.Cursor := crSQLWait;
     try
       MyConnection.BeginSQL;
       for i:= 1 to asgInsert.RowCount-1 do begin
          if asgInsert.Cells[colStatus,i] = 'DONE' then
            Continue
          else begin
            vItem.Reset;
            vItem.ItemCode := asgInsert.Cells[ColCode,i];
            vItem.Price    := asgInsert.Floats[ColPrice,i];
            vItem.ItemName := asgInsert.Cells[colName,i];
            vItem.UserInsert := GlobalSystemUser.UserId;
            vItem.ItemType := ITEM_TYPE_PART;
            vItem.InsertPrice;
            asgInsert.Cells[colStatus,i] := 'DONE';
            SetCellFontColor(asgInsert,clRed,colCode,i);
            asgInsert.Update;
          end;  
       end;

       MyConnection.EndSQL;
       Inform(MSG_SUCCESS_UPDATE);
     except
       Alert(MSG_UNSUCCESS_UPDATE);
       MyConnection.UndoSQL;
     end;
   finally
     vItem.Free;
     Screen.Cursor := crDefault;
   end;

end;

end.
