unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,Dialogs,
  Buttons, ExtCtrls, jpeg;

type
  TfrmAbout = class(TForm)
    MainPanel: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Memo1: TMemo;
    Label1: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses un_ryu;

//uses UTransaction;

{$R *.dfm}

procedure TfrmAbout.FormCreate(Sender: TObject);
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
begin
  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  Memo1.Lines.Clear;
  if n > 0 then begin
    Buf := AllocMem(n);
    Memo1.Lines.Add('VersionInfoSize = ' + IntToStr(n));
    GetFileVersionInfo(PChar(S), 0, n, Buf);
    for i := 1 to InfoNum do
      if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len) then
        Memo1.Lines.Add(InfoStr[i] + ' = ' + Value);
    FreeMem(Buf, n);
  end else
    Memo1.Lines.Add('No version information found');

//  ProductName.Caption := //Application.Name;
  Version.Caption := 'Version 16.10.12';
  if (FileExists('Skin\about1.jpg')) then
    Image1.Picture.LoadFromFile('Skin\about1.jpg');
end;

procedure TfrmAbout.SpeedButton1Click(Sender: TObject);
var str : string;
begin
  str :=
        '16.10.12'+#13 +
        '- Data Estimasi tidak bisa di delete '+#13+
        '- Data Estimasi tidak bisa di edit '+#13+
        '- Print faktur alamat bisa panjang '+#13+
        '21.01.12'+#13 +
        '- Data mobil pelanggan tidak bisa di delete '+#13+
        '17.10.11'+#13 +
        '- Data pelanggan tidak bisa di delete '+#13+
        '- Pelanggan jika New, Kode belum otomatis difieldnya dengan urutan pengkodean selanjutnya '+#13+
        '- Spare part, pembeda satuan antara pembelian dengan penjualan '+#13+
        '- input Part bisa ditentukan berdasarkan kendaraan '+#13+
        '- History Harga => ada group kendaraan dan dimunculkan agar bisa di filter '+#13+
//        '-  '+#13+
//        '-  '+#13+
          '25.10.11'+#13 +
         '- Tambah Field Contact Person, No.Rek, Fax di supplier '+#13+
         '- Mobil pelanggan bisa lebih dari satu';

  Inform(str);       
end;

end.

