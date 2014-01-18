object frmMainMenu: TfrmMainMenu
  Left = 15
  Top = 160
  Width = 638
  Height = 448
  Caption = 'Menu Utama'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    630
    414)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 140
    Top = 64
    Width = 5
    Height = 329
    Cursor = crHSplit
  end
  object FramePanel: TPanel
    Left = 145
    Top = 64
    Width = 485
    Height = 329
    Align = alClient
    BevelOuter = bvLowered
    Color = 15658734
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TitlePanel: TPanel
      Left = 1
      Top = 1
      Width = 483
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblJudul: TLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 23
        Caption = 'lblTitle'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 152829
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
      end
      object Panel1: TPanel
        Left = 234
        Top = 0
        Width = 249
        Height = 40
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          249
          40)
        object Label31: TLabel
          Left = 147
          Top = 24
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop]
          Caption = '[F5] : shortcut menu'
          Color = 12417794
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
      end
    end
    object SplitterPanel: TPanel
      Left = 1
      Top = 41
      Width = 483
      Height = 3
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 44
      Width = 483
      Height = 284
      Align = alClient
      BevelInner = bvLowered
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      OnResize = ScrollBox1Resize
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 393
    Width = 630
    Height = 21
    AutoHint = True
    Panels = <
      item
        Width = 550
      end
      item
        Style = psOwnerDraw
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 50
      end>
    SimplePanel = False
  end
  object ProgressBar: TProgressBar
    Left = 398
    Top = 401
    Width = 148
    Height = 17
    Anchors = [akRight, akBottom]
    Min = 1
    Max = 100
    Position = 1
    Smooth = True
    Step = 1
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 376
    Top = 394
    Width = 185
    Height = 24
    Anchors = [akRight, akBottom]
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 3
    object Gauge: TGauge
      Left = 2
      Top = 2
      Width = 181
      Height = 20
      Align = alClient
      BorderStyle = bsNone
      Color = 16776176
      ForeColor = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Progress = 0
      Visible = False
    end
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 64
    Width = 140
    Height = 329
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'MenuPanel'
    Color = clWhite
    TabOrder = 4
    object pclMenu: TPageControl
      Left = 0
      Top = 0
      Width = 140
      Height = 329
      ActivePage = tshSetting
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15921919
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      OwnerDraw = True
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 0
      object tshSetting: TTabSheet
        Caption = 'tshSetting'
        ImageIndex = 4
        TabVisible = False
        object ScrollBox2: TScrollBox
          Left = 0
          Top = 0
          Width = 132
          Height = 319
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Color = 15068652
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          OnResize = ScrollBox1Resize
          object pnlSetting: TPanel
            Left = 1
            Top = 0
            Width = 125
            Height = 502
            AutoSize = True
            BevelOuter = bvNone
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label24: TLabel
              Left = 0
              Top = 175
              Width = 125
              Height = 5
              Align = alTop
              AutoSize = False
              Color = 15068652
              ParentColor = False
            end
            object Label25: TLabel
              Left = 0
              Top = 419
              Width = 125
              Height = 5
              Align = alTop
              AutoSize = False
              Color = 15068652
              ParentColor = False
            end
            object Label26: TLabel
              Left = 0
              Top = 284
              Width = 125
              Height = 5
              Align = alTop
              AutoSize = False
              Color = 15068652
              ParentColor = False
            end
            object Label11: TLabel
              Left = 0
              Top = 66
              Width = 125
              Height = 5
              Align = alTop
              AutoSize = False
              Color = 15068652
              ParentColor = False
            end
            object pnlSett: TPanel
              Left = 0
              Top = 71
              Width = 125
              Height = 104
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object ImageButton5: TImageButton
                Tag = 10000
                Left = 0
                Top = 0
                Width = 125
                Height = 23
                Cursor = crHandPoint
                Align = alTop
                IncrementalDisplay = True
                Stretch = True
                Transparent = True
                OverEnabled = True
                OnClick = ScrollMenu
              end
              object Label29: TLabel
                Left = 0
                Top = 88
                Width = 125
                Height = 16
                Align = alTop
                Color = 14540253
                ParentColor = False
                Transparent = True
              end
              object Label1: TLabel
                Tag = 1
                Left = 0
                Top = 23
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Hak Pengguna(1)'
                Color = 14540253
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label4: TLabel
                Left = 0
                Top = 75
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Restore Data'
                Color = 14540253
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                OnClick = Label4Click
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label6: TLabel
                Tag = 3
                Left = 0
                Top = 36
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Data Perusahaan'
                Color = 14540253
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                OnClick = Label6Click
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label21: TLabel
                Left = 0
                Top = 62
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Backup Data'
                Color = 14540253
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                OnClick = Label21Click
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label22: TLabel
                Left = 0
                Top = 49
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Printer Setup..'
                Color = 14540253
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                OnClick = Label22Click
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
            end
            object pnlReport: TPanel
              Left = 0
              Top = 424
              Width = 125
              Height = 78
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 1
              object ImageButton6: TImageButton
                Tag = 40000
                Left = 0
                Top = 0
                Width = 125
                Height = 23
                Cursor = crHandPoint
                Align = alTop
                Stretch = True
                Transparent = True
                OverEnabled = True
                OnClick = ScrollMenu
              end
              object Label7: TLabel
                Left = 0
                Top = 62
                Width = 125
                Height = 16
                Align = alTop
              end
              object Label17: TLabel
                Tag = 400
                Left = 0
                Top = 23
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Inventori (400)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label8: TLabel
                Tag = 402
                Left = 0
                Top = 49
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Rugi Laba (402)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label19: TLabel
                Tag = 401
                Left = 0
                Top = 36
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Hint = 'Laporan Per Kendaraan'
                Align = alTop
                Caption = '  Histori Kendaraan (401)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
            end
            object pnlTransaksi: TPanel
              Left = 0
              Top = 289
              Width = 125
              Height = 130
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 2
              object ImageButton7: TImageButton
                Tag = 30000
                Left = 0
                Top = 0
                Width = 125
                Height = 23
                Cursor = crHandPoint
                Align = alTop
                Stretch = True
                Transparent = True
                OverEnabled = True
                OnClick = ScrollMenu
              end
              object Label2: TLabel
                Tag = 300
                Left = 0
                Top = 23
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Terima Barang (300)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label3: TLabel
                Left = 0
                Top = 114
                Width = 125
                Height = 16
                Align = alTop
              end
              object Label10: TLabel
                Tag = 303
                Left = 0
                Top = 62
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Estimasi Harga (303)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label12: TLabel
                Tag = 305
                Left = 0
                Top = 88
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Service (305)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label13: TLabel
                Tag = 304
                Left = 0
                Top = 75
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Stock Opname (304)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label14: TLabel
                Tag = 302
                Left = 0
                Top = 49
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Order Bengkel (302)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label15: TLabel
                Tag = 301
                Left = 0
                Top = 36
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Retur Beli (301)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label18: TLabel
                Tag = 306
                Left = 0
                Top = 101
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Sales (306)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Visible = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
            end
            object pnlData: TPanel
              Left = 0
              Top = 180
              Width = 125
              Height = 104
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 3
              object ImageButton8: TImageButton
                Tag = 20000
                Left = 0
                Top = 0
                Width = 125
                Height = 23
                Cursor = crHandPoint
                Align = alTop
                Stretch = True
                Transparent = True
                OverEnabled = True
                OnClick = ScrollMenu
              end
              object Label41: TLabel
                Tag = 101
                Left = 0
                Top = 88
                Width = 125
                Height = 16
                Align = alTop
              end
              object Label42: TLabel
                Tag = 100
                Left = 0
                Top = 23
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Relasi & Mekanik (100)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowAccelChar = False
                Transparent = True
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label16: TLabel
                Tag = 104
                Left = 0
                Top = 49
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Part & Service (104)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowAccelChar = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label20: TLabel
                Tag = 103
                Left = 0
                Top = 36
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Kendaraan (103)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowAccelChar = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label27: TLabel
                Tag = 105
                Left = 0
                Top = 62
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Histori Harga (105)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowAccelChar = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Label28: TLabel
                Tag = 106
                Left = 0
                Top = 75
                Width = 125
                Height = 13
                Cursor = crHandPoint
                Align = alTop
                Caption = '  Master Biaya (106)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ShowAccelChar = False
                Visible = False
                OnClick = ButtonClick
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
            end
            object pnlLogOff: TPanel
              Left = 0
              Top = 0
              Width = 125
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 4
              object lblLogOff: TLabel
                Left = 35
                Top = 12
                Width = 85
                Height = 13
                Cursor = crHandPoint
                Caption = 'Keluar Sementara'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = FileLogoff1Click
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object ImageButton1: TImageButton
                Left = 0
                Top = 0
                Width = 32
                Height = 33
                Cursor = crHandPoint
                Align = alLeft
                AutoSize = True
                PictNormal.Data = {
                  055449636F6E0000010001002020000000000000A80800001600000028000000
                  2000000040000000010008000000000080040000000000000000000000010000
                  00000000FFFFFF00A0A0A000909090009F909000AFAFA000C0BFB000CFCFCF00
                  BFB0B000908F8F009F9F9000C0E0FF00B0A08F00EFCFAF00D0C0B0009F9F9F00
                  CFBFBF00AF9090008080800070B0D0007FE0FF004FAFF00070AFE000DFBF9F00
                  7F706F004F4F4F00303F3000303030003F3F3F006F6F6F00CFAFA00090808000
                  8FCFD0003FA0FF002080D0007F808F0060605F0040404000CFD0CF00D0D0D000
                  B0B0B0004F90C00080B0BF00CFA0A000807F7F004FAFE00030A0FF00309FF000
                  3F607F00E0C0900050505000AFB0AF009FA0A000BFBFBF00A0C0E00080C0FF00
                  BFF0FF00D0FFFF009F8F8000BF9090005F80A0002F7FB000A0907F00D0DFD000
                  EFEFEF00EFEFE000DFDFDF0070BFF0009FD0FF00C0FFFF0090EFF0008FF0FF00
                  D0A09F005F7080002F9FFF00309FEF00506F70009FA09F00C0C0C000E0EFE000
                  F0F0F000E0E0E000D0D0CF00EFFFFF00B0EFFF0060C0FF006FDFFF008FEFEF00
                  CF9F9F004F6F7F001F8FEF004FB0F00020608F00EFF0EF0070A0D000E0F0FF00
                  40B0FF0060CFE00060808F00205F80001080E00050BFFF00308FC0006090B000
                  70CFFF002F90FF006F7F8000405F60004080A00050BFF000305F7F00B0BFB000
                  90908F007F7F7F005FB0EF002F90EF00406070006FAFBF0050AFFF008F909000
                  A09F8F0060D0FF004FB0FF00309FFF00407FA0005F6F700030708F009FEFFF00
                  3FA0E0002F303000909F90006F706F007070700080EFFF0070D0FF003090B000
                  9FFFFF006FD0FF00DFDFD0009FC0E0005FC0F00040AFFF0090FFFF000F70B000
                  8F8F8F00DFE0DF00DFE0E0005FCFFF001F80CF003FA0EF00AFAFAF00E0DFDF00
                  80AFD00070DFFF0070DFF0002070AF00AFB0B0005FC0FF005FC0E0001F70AF00
                  60CFEF00107FC000309FD00040AFE000B0AFAF004FBFFF00204F60002F303F00
                  40A0C0001F80BF00206F9F005F9FC0002F70AF00203F4F00A0AFA0004F504F00
                  4F90B00060CFF0001F608F00BFC0BF0060BFD0004FBFEF0040AFD0008F908F00
                  5F5F5F0050A0C0007FD0F00040B0F0002F90E0006FD0F000707F70001F5F7000
                  8FD0EF0070D0F0000F5F8000B0DFEF004090BF001F4050002F302F0000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000C6C6C6C6C6C6C6C6C6C6C6C6BD1C311A1CC6C6C6C6C6C6C6C6C6C6C6
                  C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6AD344E4E1CC5C6C6C6C6C6C6C6C6C6C6C6
                  C6C6C6C6C6C6C6C6C6C6C6C6C6C6C62700413E3419C6C6C6C6C6C6C6C6C6C6C6
                  C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6014125322624C6C6C6C6C6C6C6C66AC4C4
                  C511C6C6C6C6C6C6C6C6C6C6C6C6C6024DB227061BC6C6C6C6C6C6C6C3126060
                  BE1AC6C6C6C6C6C6C6C6C6C6C6C6B2063FAD34271BC6C6C6C6C6C6C6AF5E4584
                  A719C6C6C6C6C6C6C6C6C6C6C6C6C60E5C9534AD1AC6C6C6C6C6C6B8C1C23679
                  B31BC6C6C6C6C6C6C6C6C6C6C6C6C611060E4D02AEC6C6C6C6C6C6B8BFC02E98
                  8611C6C6C6C6C6C6C6C6C6C6C6C6952626024D7031C6C6C6C6C6C6B844BA9499
                  BEC6C6C6C6C6C6C6C6C6C6C6C6C6C6AD418FB282BDC6C6C6C6C6668653BBB0A7
                  69C6C6C6C6C6C6C6C6C6C6C6C6C6B611348F34B7C6C6C6C6C6B8B3B9BABBBC62
                  C6C6C6C6C6C6C6C6C6C6C6C6C64DB2950E113431C6C6C6C6C648B37E21B4B558
                  C6C6C6C6C6C6C6C6C6C6C6C6C62726AD02110718AEC6C6C6AF3C2C9F21B0B1C6
                  C6C6C6C6C6C6C6C6C61C311A1A7025958F61AAABAC1BC612569C2021A22C4BC6
                  C6C6C6C6C6C6C6C60E3432011C8227A3665A92A4A1A5A6A7468C72A89CA9C6C6
                  C6C6C6C6C6C6C634263434905C06959B2C859C8C989D9E9F857AA0A1A273C6C6
                  C6C6C6C6C6C6C627412795064F0096978B98208C858D997864728E5A9AC6C6C6
                  C6C6C6C6C6C6C62790320E4D4E00917113927A79858D4688648E93942FC6C6C6
                  C6C6C6C6C6C6C634502781276E898A8B848C7A79138D46855A8E2E3C8FC6C6C6
                  C6C6C6C6C6C6C6343F27810182832C84857A7A4A86458788797A2E621AC6C6C6
                  C6C6C6C6C6C601065C270E767735784679687A7B7C7D1F7E647A207F6280C6C6
                  C6C6C6C6C6C6013E3F6E4C6F707146136849724B1D10737453752D646C62C6C6
                  C6C6C6C6C6C601504F3401036667525E42684928693A3A6A6B4320646C6DC6C6
                  C6C6C6C6C6C6015C003F25320E5D365E5243205F60613A1E626320646522C6C6
                  C6C6C6C6C6C6094C4D4E004F505135420A52535455562B575859205A5BC6C6C6
                  C6C6C6C6C6C6093D3D1C01343E3F40414243384445462B474849204A4BC6C6C6
                  C6C6C6C6C6C609301624312632093334063536373829393A3B2D203CC6C6C6C6
                  C6C6C6C6C6C6090B0C231A240225262701092228291E2A2B2C2D2E2FC6C6C6C6
                  C6C6C6C6C6C6C60E160C1718191A1B1B1B1B181C101D1E1F13202122C6C6C6C6
                  C6C6C6C6C6C6C6C6090B0C0D040E0E090E04050F10111213131415C6C6C6C6C6
                  C6C6C6C6C6C6C6C6C6C602030405060607010809C6C6C60A0AC6C6C6C6C6C6C6
                  C6C6C6C6C6C6C6C6C6C6C6C6C601010101C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
                  C6C6C6C6FFF07FFFFFE07FFFFFE07FFFFFE07F83FFE07F03FFC07F03FFE07E03
                  FFE07E03FFC07E07FFE07C07FFC0F80FFF80F80FFF80701FF800201FF000003F
                  E000003FE000007FE000007FE000007FE000007FC000003FC000003FC000003F
                  C000003FC000007FC000007FC00000FFC00000FFE00000FFF00001FFFC00E7FF
                  FF87FFFF}
                OnClick = FileLogoff1Click
              end
            end
            object pnlShutDown: TPanel
              Left = 0
              Top = 33
              Width = 125
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 5
              object Label9: TLabel
                Left = 35
                Top = 12
                Width = 52
                Height = 13
                Cursor = crHandPoint
                Caption = 'Shut Down'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = FileExit1Click
                OnMouseEnter = Houver
                OnMouseLeave = unHouver
              end
              object Image1: TImage
                Left = 0
                Top = 0
                Width = 32
                Height = 33
                Cursor = crHandPoint
                Align = alLeft
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010004002020000001002000A81000004600000030300000
                  01002000A8250000EE1000004040000001002000284200009636000080800000
                  0100200028080100BE7800002800000020000000400000000100200000000000
                  8010000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000272829015E626709
                  89919C149EABBB21AFC0D52CAFC2DB34B2C8E237AFC5DE36B2C7DD30A0B2C325
                  8996A218636B700B2B2D2F020000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000005E616607A6B0BF1DACBDDA398CA1CA55
                  738ABD6D6078B3824C64A49A3C579CAF34559CBC31579FC1345EA6BD3F6AB0B1
                  537CBB99749ACD75A1C5E54BA6BED028656D730C000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000053555905B1BBCD219BACCF477286B96C5264A58F34448DB4
                  1A2772DB0A1A66F5051F6CFE052776FF062E80FF063588FF073A90FF073E96FF
                  07409AFF063E9CFD0F3D9DEE345FB2C075A1D677AFD1E634626B700B00000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000008E949D0FABBAD739798BBB655060A1912D3985BC0F1461E9030852FE
                  030D56FE04115BFF051663FE051C6CFF052175FE05267CFF052A83FE052C88FF
                  052E8DFE052D90FF042B92FE032894FF042394FD274AADD083B5E46D9DB5C220
                  1718190100000000000000000000000000000000000000000000000000000000
                  9EA6B0149EAED043697AB1743E4B93A51A206FD704034DFB02024BFF02044DFF
                  030751FF030B54FF030E5AFF041263FF04166BFF041972FF041C78FF041E7DFF
                  041F82FF041E86FF041D89FF031B8BFF03188DFF031492FF0818A1F75788D99C
                  A7CBDC2F1D1F20010000000000000000000000000000000000000000989EA70F
                  A1B1D1416979B1753B468FA9141867DF020049FE020049FF010049FE02014AFF
                  02034CFE02054EFF030753FE030A5BFF030C64FE030E6DFF030F72FE031176FF
                  031379FE03127DFF031180FE031084FF030E87FE020B8CFF02099AFE0207AAFE
                  487ADCAE9EC2D22D0000000000000000000000000000000052545705B5C3DC31
                  7686B8684450969E191E6ED802004AFD020049FF020049FF020049FF020049FF
                  010052FF020265FF020379FF080C8EFF0E169BFF101CA2FF0F1DA5FF0C1AA5FF
                  0613A0FF020C98FF02078EFF020786FF020682FF020488FF020397FF0201A7FF
                  0202B8FD5994EC9D6E818916000000000000000000000000B0B8C41691A2C94E
                  5867A4862A3280BF05044FF9010049FF010048FE020049FF010056FE030375FF
                  151C99FE2331AEFF2A3FB9FE2740BCFF223DBCFE1E3CBDFF1D3EBFFE1D42C2FF
                  1E47C5FE1C48C6FF1440C3FE0B2DB9FF0318A8FE020994FF020096FE0100A6FF
                  0100B7FE091CCCF689C9F0610000000000000000B8B8B901BFCCE1297B8CBC62
                  4552979C151866DF010049FF020049FF02004CFF02026CFF19219CFF2A3AB5FF
                  2031B4FF1425B0FF0C1EB0FF071EB1FF0520B3FF0524B6FF0529BAFF062FBDFF
                  0835C1FF0B3DC5FF0E44C8FF104CCCFF104FCEFF0843C8FF0328B4FF0206AAFF
                  0100B7FF020EC9FF3585E9C5A4B2B81000000000E1E4E604B0BFDA346F7FB46F
                  3B468FAA070752F5010048FE01004FFF090B7FFE2734AFFF1D2AB1FE0C17AAFF
                  0411AAFE0213ACFF0218B0FE021DB3FF0222B6FE0328BAFF032DBDFE0332C0FF
                  0437C3FE043DC7FF0542CAFE0749CEFF094FD1FE0A54D4FF0656D5FE0347CAFF
                  0211BBFE010EC9FF085BDDF7B1D7E93300000000F1F4F705ACBCD8386B7CB273
                  343E87B3020049FE01004DFF0B0E83FF2533B2FF1019AAFF030CA7FF020FAAFF
                  0215ADFF021AB1FF021FB4FF0224B8FF032ABBFF032FBEFF0434C1FF0439C4FF
                  043EC8FF0544CBFF0649CFFF074FD2FF0955D5FF095AD8FF095EDAFF0661DCFF
                  0459D5FF0220CBFF0356DBFF9BD6F95D00000000D6D7DA03B3C2DB327081B66E
                  303980BB010049FF060776FE222FB0FF0B14A9FE020CA7FF0211ABFE0217AEFF
                  021CB2FE0221B5FF0226B9FE0333BFFF0346C7FE044CC9FF0448C9FE0443C9FF
                  0546CCFE064BD0FF0851D3FE0957D6FF0A5CD9FE0D64DBFF106ADEFE0F6DE0FF
                  086CE2FE0462DBFF0358DBFE6FB3DD6E0000000000000000C2CFE2257E90BF60
                  333D82B702005BFF1A26A7FF0B16AAFF020EA9FF0213ACFF0218B0FF021DB3FF
                  0224B7FF085ECEFF479CD7FF83BBD4FFA8C2CFFFB8C6D0FFB2C3D2FF95B2D2FF
                  5F89CEFF1554CAFF0957D5FF0B5FDAFF0E66DCFF116CDFFF1574E2FF1A7BE4FF
                  157BE6FF0876E7FF0373E0FF5EA9D6760000000000000000989FA81097A9CD4A
                  414C8BA8090E83FF1423AFFE0210AAFF0215ADFE021AB1FF021FB4FE0230BCFF
                  37A0DCFEAEC7CDFFC9C9C9FECCCCCCFFD0D0D0FED3D3D3FFD7D7D7FEDADADAFF
                  DDDDDDFED4D7DEFF6582CBFE0C5AD2FF126EE0FE1676E3FF1B7DE5FE2084E8FF
                  258BEBFE1685EBFF0583E9FE5EA9D67700000000000000002D2E3002BBC8DE29
                  56629E92111FA4FF0616ADFF0217AFFF021CB2FF0221B5FF032BBBFF42A2DBFF
                  C5C8C8FFCBCBCBFFBACBD1FF6AB1DAFF3789D8FF2478D6FF317BD5FF6094D5FF
                  B8C7DDFFE6E6E6FFEAEAEAFF8895D0FF1467D8FF1C7FE6FF2287E9FF298FECFF
                  3197EEFF2D98F0FF0C88EFFF5EAED877000000000000000000000000676B7008
                  7782BB761025AFFF0219B0FE021EB3FF0223B7FE0228BAFF136AD1FEBEC8CCFF
                  CDCDCDFE94C3D8FF1173D9FE0549CEFF064DD1FE0752D4FF0958D7FE0A5EDAFF
                  0D60D5FE7696D4FFEFEFEFFEF2F2F3FF546DC7FE2389EAFF2A91EDFE339AEFFF
                  3EA3F1FE46A9F3FF1A93F2FE5EAFDA7700000000000000000000000000000000
                  333869600C26B4FF021FB4FF0225B8FF022ABCFF032FBFFF5A9FD5FFCFCFCFFF
                  BBCCD5FF0E6ED7FF0549CFFF074FD2FF0854D5FF095AD8FF0B60DBFF0D67DDFF
                  106EE0FF126BDBFF9BAADBFFF8F8F8FFBAB9E0FF267DE0FF359CF0FF41A5F2FF
                  4EAFF4FF5DB8F6FF2AA0F5FF5EB2DD7700000000000000000000000000000000
                  0004314E0A29B6FF0227B9FE032CBDFF0331C0FE0437C3FF7DB1D6FED4D4D4FF
                  79B4DBFE064DD0FF0750D3FE0856D6FF0F66D7FE5494DCFF2071D7FE1170E1FF
                  1677E4FE1A7EE6FF4372D0FEFDFDFDFFE9E9F5FE286ED4FF44A8F3FE51B1F5FF
                  62BCF6FE74C5F8FF36A9F7FE5DA9CD6800000000000000000000000000000000
                  00011721072BB7FE032EBEFF0332C1FF0438C4FF043EC7FF70A5D6FFDADADAFF
                  75ADDBFF0753D4FF0858D7FF095EDAFF5293DCFFEEEEEEFFAEC3E4FF1472DFFF
                  1B80E7FF2187EAFF3A6DCFFFFFFFFFFFDBDBF0FF367EDAFF55B4F6FF66BEF7FF
                  79C8F8FF8DD2FAFF31ABF9FF5D90A23900000000000000000000000000000000
                  0000000005239AD10334C2FE043AC5FF043FC8FE0444CBFF3075D1FEDFDFDFFF
                  BBCFE0FE0A61D6FF0A60DBFE0C66DDFF146BD7FEE3E8F0FFF3F4F6FE2C72D5FF
                  2289EBFE288DEBFF7A8CD3FEFFFFFFFF969AD6FE54AEF1FF6AC0F7FE7DCBF9FF
                  95D5FBFE9DD9FBFF1BA3EBE55C65670400000000000000000000000000000000
                  00000000010F4A61053CC6FF0441C9FF0546CCFF054BD0FF0653D2FF8DAEDAFF
                  E8E8E8FF85ADDEFF0D65D8FF106FE1FF1474E2FF89A9DFFFFCFCFCFF7D99DAFF
                  2A92EDFF446CCBFFF1F2F9FFE7E7F5FF4B79D1FF6EC3F8FF82CDF9FF9AD8FBFF
                  B7E4FCFF80CFFCFF035F88790000000000000000000000000000000000000000
                  0000000000000302032D9BC50548CDFF054DD1FE0752D4FF0758D7FE0D5DD4FF
                  96B0DCFEF1F1F1FFB9CBE8FE4E84D8FF196CD8FE2E71D4FFFAFBFDFED7DAF0FF
                  2A78DAFE717CCAFFC4C4E6FE5674CBFF70C3F7FE87CFFAFFA0DBFBFEBEE7FCFF
                  C1E9FDFE23A2E2D7000B0E090000000000000000000000000000000000000000
                  000000000000000000051B1E0441BDE50755D5FF085AD8FF095FDBFF0B66DDFF
                  0D65D9FF4E7FD3FFBBC6E7FFF9FAFCFFA6B3E1FF1F78DEFFACB5E1FFFEFEFEFF
                  4974CEFF4CA5EEFF539CE5FF76C6F8FF8CD2FAFFA6DDFCFFC4EAFDFFCEEEFEFF
                  48B7F1EE002A3A2C000000000000000000000000000000000000000000000000
                  000000000000000000000000000926280548BCDE0961DCFF0C68DEFE0F6FE1FF
                  1375E3FE177CE6FF1874DFFE266BD3FF2571D7FE319BF0FF2D61CAFE9E9ED6FF
                  6B76C8FE5AA7EAFF7BCAF9FE91D4FBFFADE0FCFECAECFDFFCAECFEFE49B6F0E8
                  002B3E3600000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000041414043B98AD0D6DE0FE1477E4FF
                  187EE7FF1D85EAFF238DECFF2A95EFFF339DF1FF3EA5F3FF387DD9FFACACDCFF
                  999AD5FF69A5E5FF97D7FBFFB3E3FCFFCEEEFDFFA1DCFDFF268CC4BB001A251D
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000001154046094FB1C2
                  177EE7FE248EEDFF2C97EFFE359FF2FF41A7F4FE4DB1F6FF5DBBF7FE64B0EDFF
                  7BBFF2FE9DD9FCFFB2E3FCFE92D3FAFE3D9AD3CC033E60530000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000B282A042F717B1258AEBB217BDCE93195EDFC40A4F1FF4CACF3FF51ADF2FD
                  4CA2E7EC3682BDC00F52868201223A3200000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000D5D5D801D5D8E20CD5DEF419D5E0F519D5DCE70D
                  D5D6D90100000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF8003FF
                  FE0000FFF800003FF000000FE0000007C0000007800000038000000300000001
                  000000010000000100000001800000018000000180000001C0000001E0000001
                  E0000001E0000001F0000001F0000003F0000003F8000007FC00000FFE00001F
                  FF80007FFFE001FFFFFC0FFFFFFFFFFFFFFFFFFF280000003000000060000000
                  0100200000000000802500000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000004E505203
                  777C8109989FA810AAB4C017C0CDDD1DBCCBDC22C8D9EA25C6D8EA26C4D5E725
                  BDCEDE22C3D2E01DA4B0BB168C959C0F6B707408393B3C020000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000002728290172767A07B3BCC614C4D2E424B3C5DF33
                  A3B7D74195ACD14E8AA3CC58829CC9607B98C7677896C76B7797C86C7899CA6C
                  7B9ECD6981A5D1638AAED75C96B9DD51A5C5E445B7D3EB35C2D6E6249CA8B112
                  585D600500000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000003E404202A6ACB50FC5D2E423ACBDDA3994A8CE4D8096C4606E85BA71
                  5F77B281536BAB8F465DA19F364B92B529418CC7203D89D51A3C8BDD163D8EE2
                  153F90E4184597DF1F4C9ED72956A5C93A64AEB45379BB96749ED17393BDE257
                  AED2EC3EC2D9E824838C920D2B2D2E0100000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000031323401
                  A7AEB70FC1CEE328A1B3D441869AC5596E82B770596DAA87475A9F9C354690B2
                  202D79D10F1E6AEB061A66FB05226FFE062776FF062C7DFF063283FF063689FF
                  073A8EFF073E93FF074197FF07439AFF07439DFF07429EFE083B9BF81944A1DE
                  3E68B6B074A3D776A0CCEC4DC5E1F32B8A959B0D000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000007C7F8407CBD6E820
                  A7B7D53D8699C4586A7DB4735264A48E3D4C95A7293482C3121966E5050D57FC
                  04105AFF04145EFF051863FF051C6AFF052070FF052476FF05287CFF062C81FF
                  062F86FF06328AFF06348EFF063691FF063694FF063696FF053597FF053398FF
                  043099FF062A97F9274CABCD6A9CD682A3D3F04CC3DCEA2354595B0500000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000AEB5BD0EBAC8DF2C95A6CC4B
                  7487B9695868A7873F4D95A4293482C1111664E503054FFD030750FF030953FF
                  030C56FF040F59FF04125DFF041663FF051A69FF051D6FFF052074FF042379FF
                  05267EFF052882FF052986FF052B89FF052B8CFF042A8EFF042A90FF042991FF
                  032692FF032493FF032194FF041D95FB2F53B7C680BBE96EBAE2F73989949A0C
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000B7BFC912B2C1DB328C9DC6536A7BB273
                  4D5B9E93333F8AB21C2273D4060652F602014AFE02024CFF03044DFF030650FF
                  030852FF030B54FF030E58FF04105DFF041363FF041668FF04186DFF041B72FF
                  041D77FF041F7BFF04207EFF042081FF042184FF042187FF042089FF041F8BFF
                  031E8CFF031C8EFF03198FFF031691FF031499FE0E22A8EE5E98DE92AADEF848
                  9FAFB71200000000000000000000000000000000000000000000000000000000
                  000000000000000000000000B9C0C911B1C1DA338A9BC5556778AF7648569A99
                  2E3785BA15196ADE03024CFC020049FF020049FF02014AFF02024BFF02034DFF
                  03054EFF020750FF030953FF030B58FF030D5DFF040F62FF041167FF04136CFF
                  041570FF041674FF041877FF04187BFF04197EFF041880FF041883FF041685FF
                  031587FF031489FF03128AFF03108DFF020E95FF020C9EFF040DA9FA497FDAAA
                  A3DEFA4F9AABB212000000000000000000000000000000000000000000000000
                  0000000000000000A5AAB10BB9C7DE2D8E9FC751697AB17449579B972E3784BA
                  131868E002014AFD020049FF020049FF020049FF020049FF020049FF02014AFF
                  02024CFF02044DFF03054FFF030753FF030858FF030A5EFF030B65FF030B6CFF
                  030C70FF030E74FF030F75FF031076FF031178FF03117BFF03107DFF031080FF
                  030F82FF030D84FF030C86FF020A89FF020992FF02079CFF0206A6FF0306B1FD
                  467FE0AFA7E2FD4C737D820B0000000000000000000000000000000000000000
                  000000005C5E6104C8D4E52299AACD477283B66B505EA08F333D88B3171C6DDA
                  03014BFC020049FF020049FF020049FF020049FF020049FF020049FF020049FF
                  02004AFF020154FF020264FF020372FF02027FFF020388FF02048FFF020693FF
                  030795FF020898FF020899FF020798FF020694FF02068FFF02078AFF020883FF
                  02097EFF030881FF020683FF020586FF020590FF02039AFF0202A5FF0201AFFF
                  0304BCFC5398EDA2B4E3F83B2E31330200000000000000000000000000000000
                  00000000C5CDD712ACBBD7388192C05C5C6CA8823D4890A7202778CC050550F8
                  020049FF020049FF020049FF020049FF020049FF020049FF02004DFF020061FF
                  020176FF030386FF0E1396FF1A26A6FF2334B1FF283DB8FF2B44BCFF2B47BFFF
                  2A49C0FF2848C1FF2447C1FF2043C0FF193CBEFF1232B9FF0922B2FF0312AAFF
                  02079FFF020692FF020586FF020284FF02028EFF020199FF0200A4FF0200AFFF
                  0200BAFF0915CAF571C3F98292A9B41B00000000000000000000000000000000
                  56585A03C7D3E52397A7CC496F7FB46E4C599C942E3684BA0E105FE9020049FF
                  020049FF020049FF020049FF020049FF02004CFF020162FF02027CFF0F1394FF
                  2430ACFF3143B9FF2F44BCFF273EBAFF2239BAFF1E37BAFF1B36BAFF1936BBFF
                  1838BDFF183ABEFF183DC0FF1940C3FF1A44C5FF1B48C7FF1C4CC8FF1A4DC9FF
                  1243C6FF082FBCFF031DB0FF02109EFF020492FF020098FF0200A4FF0200AFFF
                  0200BAFF0204C6FF2160E0D9A2DFFC4F2E313201000000000000000000000000
                  9DA1A80BB5C4DC308899C4566171AB7C404B93A3212878CB03024BFC020049FF
                  020049FF020049FF020049FF020058FF020177FF121896FF2C3AB3FF3041BAFF
                  2436B6FF1B2DB3FF1427B1FF0F23B1FF0B21B1FF0820B2FF0721B4FF0624B6FF
                  0626B8FF072BBAFF072EBDFF0833BFFF0B38C2FF0D3DC5FF0F42C7FF1147C9FF
                  124CCBFF1450CDFF104ECDFF0740C7FF032CB8FF0215A7FF0200A4FF0200AFFF
                  0200BAFF0204C6FF0330D2FD5EB8F6966E7E8411000000000000000000000000
                  CAD1DC13A9B9D63A7D8EBD605766A48737428CAE131664E2020049FF020049FF
                  020049FF02004AFF020164FF080A88FF2835AFFF2E3EB8FF1F2EB2FF1422AEFF
                  0C19ACFF0614ABFF0413ACFF0216AEFF0219B0FF021CB2FF0220B4FF0223B7FF
                  0327B9FF032ABCFF032EBEFF0331C0FF0435C2FF0539C4FF053DC6FF0742C9FF
                  0A47CCFF0B4CCEFF0D50D0FF0D54D2FF0952D3FF0445CAFF032DB9FF0205B1FF
                  0200BAFF0204C6FF022FD2FF2181E8DA8CB2C42F000000000000000000000000
                  D3DCE918A2B2D2407788BA665260A18E323B87B5080752F4020049FF020049FF
                  02004BFF02016BFF121896FF2F3FB7FF2130B3FF131EACFF0812A8FF030EA8FF
                  020FAAFF0213ACFF0217AFFF021AB1FF021DB3FF0221B5FF0224B8FF0328BAFF
                  032BBCFF032FBFFF0332C1FF0436C2FF0439C5FF043DC7FF0440C9FF0544CBFF
                  0648CEFF074CD0FF0950D2FF0954D4FF0857D6FF0657D7FF0455D5FF0441C5FF
                  020ABCFF0204C6FF022FD2FF0666DFFA86C5E557000000000000000000000000
                  D3DDEB1AA0B0D1427586B9694F5E9F912C3581BD020049FE020049FF02004AFF
                  02016BFF171E9CFF2B3BB7FF1924AEFF0A12A8FF030BA6FF020DA8FF0210ABFF
                  0214ADFF0218AFFF021BB2FF021FB4FF0222B6FF0326B9FF0329BBFF032DBDFF
                  0330BFFF0434C1FF0437C3FF043BC5FF043EC7FF0441CAFF0545CCFF0649CFFF
                  074DD1FF0850D2FF0855D4FF0958D6FF095BD8FF075DDAFF055EDBFF045FDBFF
                  044ECDFF020EC7FF022FD2FF0362DEFF71C5F784000000000000000000000000
                  D2DCE919A2B2D2407687B967505FA090252C77C8020049FF020049FF020164FF
                  151B9BFF2837B5FF141EACFF050DA6FF020BA7FF020EA9FF0312ABFF0216AEFF
                  0219B0FF021CB2FF0220B5FF0223B7FF0327B9FF032ABCFF032EBEFF0331C0FF
                  0435C2FF0439C4FF043CC6FF043FC8FF0442CBFF0547CDFF064ACFFF074ED1FF
                  0852D3FF0956D5FF0959D7FF0A5DD9FF0C63DBFF0C65DCFF0A66DEFF0766DFFF
                  0466DFFF0352D2FF0232D2FF0362DEFF4EACE79E000000000000000000000000
                  CDD5E013A8B8D63B7B8DBD625464A48B212871CE020049FF020057FF0C108FFF
                  2736B4FF121CABFF030BA6FF020CA7FF020FAAFF0213ACFF0217AFFF021AB1FF
                  021EB3FF0221B5FF0224B8FF0328BAFF0332BFFF0348C8FF0455CDFF0458CEFF
                  0555CCFF044ECBFF0447CAFF0545CBFF0648CEFF064CD0FF074FD2FF0853D4FF
                  0957D6FF0A5BD8FF0B5FDAFF0D65DBFF0F69DDFF116DDFFF1270E1FF0D6FE2FF
                  096EE3FF046DE2FF0358D7FF0362DEFF1B83C4A6000000000000000000000000
                  9FA4AA0BB3C2DC328597C3595C6DAA8121276FCF02004AFF03037AFF2331B0FF
                  131FADFF030CA7FF020DA8FF0211ABFF0214ADFF0218B0FF021BB2FF021FB4FF
                  0222B6FF032BBBFF0360D0FF1C93DFFF55B2DCFF7FB9D4FF9CBED0FFABC1CFFF
                  ABC1D0FF9DB9D1FF80A7D1FF5186CDFF1759C7FF064CCBFF0854D4FF0958D6FF
                  0A5CD9FF0B60DBFF0E66DCFF0F6ADDFF126EE0FF1573E2FF1878E3FF187AE5FF
                  1077E6FF0875E7FF0376E2FF036ADFFF0E7EC2B1000000000000000000000000
                  56585B03C5D1E52593A5CB4D697BB374262C72C902005BFF141C9FFF1928B1FF
                  040FA8FF020EA9FF0212ACFF0216AEFF0219B0FF021DB3FF0220B5FF0224B7FF
                  035ACEFF30B3E6FF91C5D4FFC5C7C8FFC9C9C9FFCBCBCBFFCECECEFFD0D0D0FF
                  D2D2D2FFD4D4D4FFD7D7D7FFD9D9D9FFD4D7DAFF90A6D1FF2757C1FF0852D0FF
                  0C62DBFF0E67DCFF106BDEFF1270E0FF1675E3FF197AE4FF1C7EE6FF2083E8FF
                  1C83E9FF107EE9FF0679EAFF047FE3FF0E7EC2B2000000000000000000000000
                  00000000C6CEDA14A8B8D63B7B8EBE632D3578C1020378FF1E30B2FF0917ABFF
                  0210AAFF0213ACFF0217AFFF021BB1FF021EB3FF0221B6FF0326B8FF077FDCFF
                  75C9DDFFC5C7C7FFC8C8C8FFCACACAFFCDCDCDFFCFCFCFFFD1D1D1FFD4D4D4FF
                  D6D6D6FFD8D8D8FFDADADAFFDDDDDDFFDFDFDFFFE1E1E1FFDEDFE2FF6E82C8FF
                  0A49C5FF106CDFFF1371E1FF1676E3FF1A7BE5FF1D80E6FF2185E9FF258AEBFF
                  288FECFF1E8AECFF0D81ECFF0387EAFF0E7FC2B2000000000000000000000000
                  0000000062646704C4D1E52593A6CC4D374083B60B1496FF1628B2FF0312ABFF
                  0215ADFF0218B0FF021CB2FF021FB4FF0222B6FF0326B9FF087BDAFF90C6D5FF
                  C7C7C7FFC9C9C9FFCCCCCCFFCECECEFFADC9D5FF6FB9DCFF46A1DCFF338FDAFF
                  3589D7FF4C92D5FF7CA7D6FFC2CEDDFFE3E3E3FFE5E5E5FFE7E7E7FFE9E9E9FF
                  929BD0FF0E4AC4FF1778E4FF1A7CE5FF1E81E7FF2186E9FF268CEBFF2B91EDFF
                  3197EEFF2F98EFFF198CEEFF0686EEFF0E86C4B2000000000000000000000000
                  0000000000000000ABB1B90DB3C3DD33444D96A91222A8FF0A1EB0FF0216AEFF
                  021AB1FF021DB3FF0220B5FF0224B7FF0328BAFF0351CBFF74C0DAFFC8C8C8FF
                  CBCBCBFFCDCDCDFFB3CBD3FF3FADE2FF0673DAFF0552D1FF064BD0FF074ED1FF
                  0751D3FF0856D5FF085BD5FF0A5CCFFF5483CEFFD2D8E4FFEBEBEBFFEDEDEDFF
                  EFEFEFFF777DC6FF1562D4FF1F82E8FF2288EAFF278DECFF2C93EDFF3299EFFF
                  399FF1FF3FA3F2FF2797F1FF0B89F1FF0E88C6B2000000000000000000000000
                  000000000000000000000000C2CBD614545EAC9B1328B0FF041BB0FF021BB1FF
                  021EB4FF0221B6FF0325B8FF0329BBFF032DBDFF2798DEFFC7C9CAFFCCCCCCFF
                  CECECEFFA4C9D7FF148FE1FF054BCEFF0548CEFF064CD0FF074FD2FF0753D4FF
                  0857D6FF095AD8FF0A5EDAFF0C63DCFF0D64DAFF1F5AC6FFC7CFE4FFF1F1F1FF
                  F3F3F3FFEDEDF2FF2B42B6FF2389EAFF288EECFF2D94EEFF349AEFFF3BA0F1FF
                  43A6F2FF4BADF3FF3AA4F3FF1391F3FF0D88C9B2000000000000000000000000
                  000000000000000000000000242526014F56A092112AB4FF021DB2FF021FB4FF
                  0223B7FF0327B9FF032ABBFF032DBDFF0345C7FF78B9D8FFCDCDCDFFD0D0D0FF
                  C4CFD4FF1B92E1FF0548CDFF0549CFFF064DD1FF0750D3FF0854D5FF0858D7FF
                  095CD8FF0A60DAFF0C65DCFF0E69DEFF106DDFFF1370E0FF2655C2FFE8EAF0FF
                  F6F6F6FFF9F9F9FF8787CBFF2378DEFF2F96EEFF359CF0FF3CA2F2FF45A8F2FF
                  4DAEF4FF58B5F6FF4EB1F5FF1B98F4FF0D8BCCB2000000000000000000000000
                  0000000000000000000000000000000001074E880F2BB6FF0220B5FF0224B7FF
                  0328BAFF032BBCFF032EBEFF0331C0FF045ACFFFA9C4D3FFD1D1D1FFD3D3D3FF
                  73BADDFF0556D2FF054ACFFF064ED1FF0751D3FF0856D5FF0859D7FF095FD8FF
                  0A62DAFF0D66DDFF0F6ADEFF116FE0FF1474E2FF1778E4FF156BDAFF8996D3FF
                  FAFAFAFFFCFCFCFFC9C9E8FF1E5CCBFF379DF0FF3EA3F2FF47AAF3FF4FB0F5FF
                  5AB7F6FF66BEF6FF5FBCF7FF229EF6FF0D8DCDB1000000000000000000000000
                  000000000000000000000000000000000106486F0C2CB6FF0325B8FF0329BBFF
                  032CBDFF032FBFFF0332C1FF0436C3FF055FD0FFBBCAD4FFD5D5D5FFD7D7D7FF
                  3E9BDDFF064CD0FF064FD2FF0753D4FF0857D6FF095AD8FF1875D7FF76ACDDFF
                  6EA2DBFF1166D3FF1170E1FF1575E3FF1779E5FF1A7EE6FF1E83E8FF4963C3FF
                  FDFDFDFFFEFEFEFFE4E4F3FF1F53C4FF40A5F2FF48ABF3FF52B2F5FF5DB9F6FF
                  68BFF7FF75C6F8FF6EC4F8FF23A1F7FF0C77A993000000000000000000000000
                  0000000000000000000000000000000000032B420A2BB6FF032ABCFF032DBEFF
                  0330C0FF0334C2FF0438C4FF043BC6FF0459CFFFB0C6D7FFD8D8D8FFDBDBDBFF
                  3991DBFF0750D3FF0754D5FF0858D7FF095BD8FF0962D9FF81B1DFFFEDEDEDFF
                  EFEFEFFF759CD8FF1371DFFF187BE5FF1B7FE7FF1F84E9FF238AEBFF3D5BC1FF
                  FFFFFFFFFFFFFFFFD6D5EDFF275EC9FF4AADF4FF54B3F6FF5FBAF6FF6BC1F7FF
                  78C8F8FF86CFFAFF77C9FAFF1DA1F8FF0C658665000000000000000000000000
                  0000000000000000000000000000000000000A0B0725AAF20430BFFF0331C1FF
                  0435C2FF0439C4FF043DC7FF0440C9FF044DCDFF82AFD7FFDCDCDCFFDEDEDEFF
                  64A5DBFF0758D5FF0859D7FF095DD9FF0A61DBFF0C66DDFF488AD7FFF1F1F1FF
                  F3F3F3FFD0DAECFF1262D1FF1C81E8FF2086E9FF248BEBFF278BEAFF646FC5FF
                  FFFFFFFFFFFFFFFFA09FD7FF3B84DDFF56B5F6FF62BCF7FF6EC3F7FF7BC9F8FF
                  8AD0FAFF9AD8FBFF74C8FAFF11A3FAFC0B364224000000000000000000000000
                  0000000000000000000000000000000000000000021578A40736C2FF0436C3FF
                  043AC5FF043EC7FF0441CAFF0444CBFF0548CEFF2F7AD1FFDEDFE0FFE2E2E2FF
                  C0D2E1FF0C67D4FF095EDAFF0B62DCFF0D67DEFF0E6BDFFF0B63D3FFCFDBECFF
                  F6F6F6FFF9F9F9FF4270CCFF2086E9FF258CECFF2A92EEFF1A56C7FFC8CAE9FF
                  FFFFFFFFFEFEFEFF4C57BBFF57B3F4FF64BDF7FF70C4F8FF7ECBF9FF8DD2FAFF
                  9EDAFBFFAFE1FCFF5BBFFAFF0494D9C800000000000000000000000000000000
                  000000000000000000000000000000000000000000052B350636BEFD043CC6FF
                  043FC8FF0442CAFF0545CCFF0549CEFF054DD1FF0655D0FF8BAED9FFE6E6E6FF
                  E8E8E8FF89B0DDFF0961D4FF0D68DEFF0F6CE0FF1171E1FF1372E0FF6A91D6FF
                  FAFAFAFFFCFCFCFF9DADDFFF1D75DCFF2B94EEFF206BD4FF7F86CDFFFFFFFFFF
                  FFFFFFFFAFAEDDFF3B72D0FF67BFF7FF73C6F8FF81CCF9FF90D4FBFFA2DBFBFF
                  B6E4FCFFAEE1FCFF2CAEFBFF01526F5800000000000000000000000000000000
                  000000000000000000000000000000000000000000000000021E83A80541C9FF
                  0443CBFF0547CDFF054ACFFF064ED2FF0651D4FF0755D6FF0E5CCDFFB1C3DFFF
                  ECECECFFEDEEEEFF9AB7E0FF1863CEFF106BDCFF1577E4FF177CE6FF195ECCFF
                  ECEFF8FFFEFEFEFFEFF1F9FF2057C6FF3097EEFF5461BFFFFDFEFEFFFFFFFFFF
                  D3D3ECFF3551BCFF69BFF6FF76C7F8FF84CEF9FF94D5FBFFA6DDFCFFBBE6FCFF
                  CDEDFDFF77CCFCFF0794D7C800080A0400000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000316180437B7E9
                  0548CEFF054BD0FF064FD3FF0753D4FF0757D6FF085AD8FF085EDAFF105BCCFF
                  99B1DCFFF0F1F1FFF4F4F4FFE1E6F1FF819FDAFF346BCCFF1464D4FF1A75DEFF
                  8D9FDAFFFFFFFFFFFFFFFFFF6271C6FF3697ECFF354AB8FFB1B0DEFF9D9CD5FF
                  3650BBFF68BBF4FF79C9F8FF88D0FAFF98D7FBFFABDFFCFFBFE8FCFFD2EFFDFF
                  ADE1FDFF1EADFAF600384A310000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000000C3D44
                  0546C9F80650D3FF0754D5FF0758D7FF085BD9FF095FDAFF0A64DCFF0C68DEFF
                  0B5CD1FF4D76CCFFC8D1EAFFF9F9F9FFFCFCFCFFFDFDFDFF7F93D5FF1F7DE1FF
                  2D59C3FFF9FAFDFFFFFFFFFFBCBEE4FF2D6FD2FF4AA8F0FF3E80D8FF4D90DFFF
                  6EC1F7FF7CCAF9FF8BD1FAFF9CD9FBFFAFE1FCFFC4E9FDFFD4F0FEFFC3EAFEFF
                  39B7FCFD015E8364000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0113565C054ECFFA0759D8FF085CD9FF0960DBFF0B65DDFF0D69DFFF0E6EE0FF
                  1172E2FF1372E0FF105BCEFF3E66C8FF8999D7FFA8B2E0FF4260C3FF278CEAFF
                  2270D7FF868CD0FFDEDFF1FF8383CAFF2E65CBFF59B8F6FF65BFF7FF71C5F8FF
                  7FCCF9FF8FD3FBFFA0DBFCFFB3E3FCFFC8EBFDFFD6F1FEFFC6EBFEFF45BBFBFE
                  02628C7D00000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000001134B510550CEF30961DCFF0B66DEFF0D6AE0FF0F6FE1FF1273E2FF
                  1578E4FF177CE6FF1A81E8FF1E86EAFF1D7BE1FF1D73DBFF298FEBFF319BF1FF
                  38A0F2FF1C47BDFF8484CBFFC4C3E6FF7475C5FF4B89DAFF74C7F8FF82CEFAFF
                  92D5FBFFA4DCFCFFB8E5FCFFCCEDFDFFD7F1FEFFBAE6FDFF39B5FAFA01618B6D
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000092E2E0445B6D30B69DFFF0F71E2FF1275E3FF1579E5FF
                  177DE7FF1B83E9FF1F87EBFF238CECFF2792EEFF2C97F0FF339DF1FF3AA2F2FF
                  42A8F3FF284FBEFFE4E4F3FFFFFFFFFFBDBDE3FF4774CEFF86CFFAFF96D6FBFF
                  A8DEFCFFBCE7FDFFD0EEFEFFD4F0FEFF90D6FCFF1CA0E8E2013A544100000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000B070125727D0860D6F21377E5FF187FE8FF
                  1C84EAFF2089EBFF248DECFF2893EEFF2E98F0FF349EF2FF3BA3F3FF43A9F4FF
                  4CB0F5FF4EA6EDFF3356BFFF4358BDFF4369C8FF86CCF8FF99D8FCFFACE0FCFF
                  C1E9FDFFD0EFFEFFA8DEFCFF40B4F8F8046BA4920010180F0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000041718022C7D880B61D5EC
                  1781E9FF248EEDFF2995EFFF2F9AF0FF359FF2FF3DA5F3FF45ABF4FF4EB1F6FF
                  58B8F7FF64BEF7FF70C5F8FF7DCBF9FF8CD2FBFF9DDAFCFFB0E2FCFFB5E4FCFF
                  88CFFAFF3AA9F1F20669A7990124382500000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000010E0A
                  01174D55043D9AA71066D4E71E87EAFE2D97F0FF3CA4F2FF4AAFF5FF58B8F7FF
                  64BFF8FF6EC4F8FF75C7F9FF77C6F9FF6DC0F7FF58B4F5FF359CEBEE0D6EB7B2
                  01406E62000E1811000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000004141470441486A28425B9357436EB87A457DC994478AE2A3
                  488DE4A84891E5A5468BD6974380C07F426F9E5D425B772F41464C0700000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000FFFFFFFF
                  FFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF0001FFFF0000FFF00000
                  3FFF0000FFC0000007FF0000FF00000003FF0000FE00000000FF0000FC000000
                  007F0000F8000000003F0000F0000000001F0000E0000000000F0000C0000000
                  00070000C0000000000700008000000000030000800000000003000080000000
                  0003000080000000000300008000000000030000800000000003000080000000
                  0003000080000000000300008000000000030000C000000000030000C0000000
                  00030000E000000000030000F000000000030000F000000000030000F8000000
                  00030000F800000000030000F800000000030000F800000000030000FC000000
                  00070000FC00000000070000FE00000000070000FE000000000F0000FF000000
                  001F0000FF800000003F0000FFC00000007F0000FFE0000000FF0000FFF00000
                  01FF0000FFFC000007FF0000FFFF00001FFF0000FFFFE000FFFF0000FFFFFFFF
                  FFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF000028000000
                  4000000080000000010020000000000000420000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000036373901
                  6366690483878B08999FA60DB9C2CB11C5D0DB16C2CEDA19CFDCE91CD2E0EF1D
                  D1E0EF1ED2E0EE1CC2CFDC1BC5D2DD17C9D5DE139DA6AD0E8C9297096B6F7205
                  393B3C0100000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000002C2D2E0170747705A4AAB10DD2DDE817CBD8E922
                  BECEE42CB3C6DF34AABFDC3CA2B8D9439CB4D74897B1D54D94AFD45093AFD552
                  93B0D55294B1D75296B4D85099B8DB4D9FBDDE48A6C3E242AFCBE63BBAD4EA32
                  C6DCEE28D4E5F31DAFBAC311797F830836383902000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000072757804B7BEC60FD1DCEB1CBECDE32BADBFDB389EB2D44591A7CE50
                  859DC95B7C95C464738DC06D6C87BD746682BB7B627FB9805F7DB9835D7CB987
                  5B7BB8895877B58C5778B68D5A7BB88A6083BE84698EC57B749DCF717EA7D468
                  89B1DA5E96BCE052A5C8E645B6D5EC36C9E1F227C2D2DC1680878B0826272801
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000008B8E9308
                  D4DDEA17C2D0E428ACBEDA3899ADD148899EC8577A90C0656C83B9726077B27F
                  566DAC8B4D64A796445BA1A1364A93B2283B86C61D3380D6142E7DE40E2C7DEE
                  0B2F81F30A3587F50A388BF50A3B8FF50B3E93F30D3E94F0113F96E91B469CDA
                  2952A4C63E63AEAC587FBF8F76A4D5718CB9E15DA0C9E84BB7D8EF37CEE4F322
                  9FA9B00E4A4D4F02000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000008B8F9407D0D9E618BDCBE12B
                  A5B7D63E90A3CB507D91C0616C81B7725D71AD824F63A59243569DA1374994B0
                  263480C815236FE1091A65F5051D69FD062471FE062876FF062B7BFF062F80FF
                  073385FF063789FF073A8EFF073D91FF074095FF074298FF07449AFF07459CFF
                  07459EFF07449FFE083F9DFA0D399AED244CA5CE4972BBA175A7D97394C4E857
                  AED5EF40CCE6F627B2BEC50E3234350100000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000067696C03CBD3DE13C1CEE328A7B7D63C8FA2CA50
                  7A8DBE64677BB2775668A78A46579C9C394892AD2A3785C1161F6CDE07105BF7
                  04115BFE04155FFF051863FE051C68FE051F6DFE052271FF052676FE05297BFE
                  062C7FFE062F83FF063287FE06358BFE06378EFE063991FF063A93FE063B95FE
                  063B97FE063A99FF053A9AFE05389AFE05379BFE05339AFD0B2F99F02E54AEC2
                  6699D38490C6EA5CAFD9F240CEE7F52389919509000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000009FA4AA09CDD8E91EB0C0DA3496A8CD4A7E91BF5F697BB374
                  5566A68A44549A9E35428DB2253080C7111765E5040853FB030A54FE030D56FE
                  030F59FE04125CFF04145EFE051763FE051B68FE051D6DFF052071FE052375FE
                  052679FE05287DFF052A81FE052C84FE052E88FE05308AFF05318DFE05318FFE
                  053291FE053192FF053193FE053094FE042E95FE042D96FF042B97FE032897FE
                  052295F8274AACCB6AA2DB8297CEEF57BAE1F637C7D9E215373A3B0200000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  292A2B01C6CDD50EC3D0E425A5B5D43D8B9DC6547385B86B5D6DAA8149589D98
                  38448FAD283282C2141B6ADF050651F902054EFE030650FF020852FE030A54FE
                  030C56FE040F58FF04115AFE04135EFE041563FE051868FF051B6CFE051D70FE
                  041F74FE042178FF04247BFE05257FFE052782FE052884FF052987FE042A89FE
                  042A8BFE05298DFF04298EFE04288FFE042790FE032591FF032492FE032193FE
                  031F93FE031D94FE071E9AF53A63C0B780C0EC6DAADBF647CDE8F5215D626504
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000002A2B2C01
                  CAD2DC12BDCBE12A9EB0D1438395C25B6B7CB2725464A48A404E95A22F3987B9
                  1D2576D10A0B59F002014AFE02024BFF02034CFF03044EFF03064FFF030751FF
                  030953FF030B55FF030D57FF040F5AFF04115EFF041363FF041567FF05186BFF
                  041A6FFF041B72FF041D76FF041E79FF04207CFF04217EFF042181FF042283FF
                  042285FF042287FF042189FF04218AFF04208CFF031F8DFF031D8EFF031C8FFF
                  031A90FF031891FF031696FF03139CFE172FAFE166A6E3899CD7F655CAEBFB2A
                  767D810700000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000002A2B2C01C9D1DA12
                  BBCAE02B9CADD0448192C05D6778B076505FA08F3C4891A8293281C0171C6EDB
                  05044FF9020049FF010049FE010149FE02014AFE02024CFF02044DFE02054EFE
                  020650FE030852FF030A53FE030C56FE030D5AFE040F5EFF041162FE041267FE
                  04146AFE04166DFF041771FE041874FE041A77FE041B79FF041B7CFE041B7EFE
                  041B80FE041B82FF041B84FE041A85FE031A87FE041988FF03178AFE03168BFE
                  03148CFE03128EFF021193FE02109AFE020DA1FE0917ACF4508CDDA194D6F85D
                  C7ECFD2E767D8106000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000CED4DD0FBFCCE129
                  9EAED0438193C05D6778B0764F5D9F913A468FA9272F7EC314186ADF03024CFB
                  010048FE020049FF010048FE010049FE010049FE02014AFF02024BFE02034CFE
                  02044EFE03054FFF020750FE020853FE030A57FE030B5AFF030D5EFE030E62FE
                  030F65FE041169FF04126CFE03136FFE031372FE031474FF031577FE031679FE
                  03167CFE04157EFF031580FE031481FE031383FE031385FF031286FE031188FE
                  030F89FE030E8BFF020D91FE020B98FE01099FFE0208A6FF040AAFFB4782DEAC
                  91D8FA60C8EDFD2C515658040000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000B2B7BD09C6D2E523A3B3D33E
                  8596C2596A7BB1735160A18E3B4790A827307FC2131869DF03024CFC010048FE
                  010048FE020049FF010048FE010048FE010049FE020049FF01014AFE02014AFE
                  02024BFE02034CFF02044EFE020550FE020653FE030757FF02095BFE030961FE
                  030A67FE030A6DFF030B70FE030B73FE030C75FE020E76FF030F76FE031076FE
                  031077FE03107AFF03107CFE020F7EFE020F7FFE030E81FF020D83FE020C85FE
                  020B86FE030988FF02088EFE010796FE01069DFE0205A5FF0104ADFE0307B5FB
                  4585E3AF94DCFD5FCBEAF7242B2D2E0100000000000000000000000000000000
                  0000000000000000000000000000000066696C03D2DDEB1BADBCD8368D9EC751
                  7181B56C5766A488404C94A32B3382BE171C6EDA04034DFA020049FF020049FF
                  020049FF020049FF020049FF020049FF020049FF020049FF020049FF020049FF
                  02014AFF02014AFF020253FF020362FF02036FFF02027AFF020282FF020286FF
                  02028BFF02038DFF02038FFF020391FF020493FF020494FF020393FF020393FF
                  020491FF02068DFF020887FF020981FF020A7DFF03097EFF030980FF030882FF
                  030784FF020686FF02058DFF020594FF02049CFF0203A4FF0202ACFF0201B3FF
                  0508BEFA529DEFA2A0E0FE53AFC2CB1400000000000000000000000000000000
                  00000000000000000000000000000000CBD2DB10BBC9DF2B98A9CD477B8CBC62
                  5F6FAA7E4754989A313A87B51C2375D2060653F5020049FF010048FE010048FE
                  010048FE020049FF010048FE010048FE010048FE020049FF010049FE010052FE
                  010164FE020176FF010281FE010287FE03068EFE090F98FF121DA3FE1827ABFE
                  1C2FB0FE1E33B3FF1F36B6FE1F37B7FE1C36B7FE1933B7FF142FB5FE0E27B2FE
                  071CACFE0314A8FF020DA3FE02069FFE02039BFE020492FF020587FE020581FE
                  020482FE020384FF01038BFE010293FE01029AFE0201A3FF0100ABFE0100B3FE
                  0100BCFE0A15CAF367BFF98CB4E7FE3F545A5C05000000000000000000000000
                  000000000000000000000000696C6F04CFD9E91DA9B9D63A8899C4566B7CB272
                  5160A08E3A458EAA252C7CC60D0F5FEA020049FE020049FF010048FE010048FE
                  010048FE020049FF010048FE010048FE010049FE020058FF01016EFE01027DFE
                  020386FE0D1297FF1E29A8FE2B3CB4FE3248BCFE334CBFFF2F49BFFE2C47BFFE
                  2946BFFE2744BFFF2645C0FE2545C1FE2446C2FE2448C3FF244AC4FE244CC6FE
                  244EC7FE214CC6FF1B45C4FE123BC0FE092BB8FE0218AFFF020DA7FE02099FFE
                  020891FE020284FF010189FE010192FE010099FE0200A2FF0100ABFE0100B3FE
                  0100BCFE0201C4FF1E50DCDC83D5FD6FB1CAD61D000000000000000000000000
                  000000000000000000000000CAD0D80DBECBE12A9AABCE467B8CBC625F6EA97F
                  4653979B303885B8191F70D603014BFC010048FE020049FF010048FE010048FE
                  010048FE020049FF010049FE010056FE01016EFE02027EFF080A8EFE1F29A7FE
                  3243B8FE3448BDFF2E43BBFE283EB9FE2339B9FE1F36B9FF1C35B8FE1A33B9FE
                  1833BAFE1733BAFF1635BBFE1636BCFE1538BEFE153ABFFF173DC1FE1740C3FE
                  1843C5FE1946C6FF1A49C7FE1B4DC8FE1B4FCAFE194DCAFF0F42C6FE0630BDFE
                  031FB2FE0216A8FF020C99FE020092FE010099FE0200A2FF0100ABFE0100B3FE
                  0100BCFE0201C4FF021DCDFE449EF1B1ACE4FE47393E40030000000000000000
                  000000000000000054555601D8E1ED17B1C0DA348E9FC8507081B56D5564A38A
                  3D4890A6272E7EC30B0D5AED020049FF020049FF020049FF020049FF020049FF
                  020049FF02004EFF020167FF02017CFF0B0E91FF2733ADFF3648BCFF2E40B9FF
                  2638B7FF1F31B5FF192CB3FF1528B2FF1125B2FF0E24B2FF0B22B2FF0923B3FF
                  0823B5FF0725B6FF0726B7FF0829B9FF082CBBFF082FBDFF0A32BFFF0B36C0FF
                  0D3AC3FF0E3EC5FF1041C6FF1145C7FF1249C9FF134CCBFF144FCCFF1551CEFF
                  0E4CCCFF063EC6FF022CB9FF021FADFF0209A0FF0200A2FF0200ABFF0200B3FF
                  0200BCFF0201C4FF021CCDFF0F57DCEE7DD4FD757A8B93130000000000000000
                  00000000000000008D909304CED9E81EA7B7D53B8697C3586878AF754E5C9D92
                  36408BAF1E2475CF03014BFC010048FE010048FE020049FF010048FE010049FE
                  010057FE020172FF050687FE242EA9FE3547BBFE2B3CB8FF2231B3FE1A29B1FE
                  1323AFFE0D1DADFF0918ADFE0616ADFE0416ADFE0218AFFF021AB0FE011CB2FE
                  021EB4FE0221B5FF0223B7FE0227B9FE0229BBFE032BBCFF032EBEFE0331C0FE
                  0534C1FE0638C3FF073CC5FE0940C7FE0A44C9FE0C48CBFF0D4BCDFE0E4FCEFE
                  0F52CFFE0F54D1FF0950D0FE0443C9FE0333BBFE021AAFFF0200ABFE0100B3FE
                  0100BCFE0201C4FF011CCDFE0242D6FE45A9F3B1A3C9DA2E0000000000000000
                  0000000000000000B5B9BD08C6D2E524A0B0D1417F90BF5E6272AC7B48559A99
                  313A87B6121563E2010048FE010048FE010048FE020049FF010049FE01005EFE
                  02027AFE121798FF3243B8FE2D3DB8FE212FB2FE1724AEFF0F1CACFE0814AAFE
                  0510A9FE0310AAFF0312ACFE0215ADFE0218AFFE021AB1FF011DB3FE021FB4FE
                  0221B6FE0325B8FF0228BAFE022ABBFE022CBDFE032FBFFF0332C0FE0434C2FE
                  0437C3FE043AC5FF043CC6FE043FC8FE0542CAFE0746CCFF0849CEFE0A4DD0FE
                  0B50D1FE0B53D3FF0A54D4FE0855D5FE0452D3FE0345C6FF032CBAFE0203B4FE
                  0100BCFE0201C4FF011CCDFE0242D6FE187EE7E4A1E1FE500000000000000000
                  0000000000000000D4D9DF0AC1CEE2279BACCF457C8DBC625E6EAA804452979D
                  2D3684BB080853F3010048FE010048FE010048FE020049FF010161FE02027EFE
                  1F28A5FE3244BAFF2433B4FE1924AEFE0F19AAFE0610A8FF020DA7FE020DA9FE
                  0210AAFE0213ACFF0216AEFE0219B0FE011BB2FE021EB3FF0220B5FE0222B6FE
                  0226B8FE0328BAFF022BBCFE022DBEFE0330BFFE0433C1FF0435C2FE0438C3FE
                  043AC5FE043DC7FF0440C8FE0442CAFE0545CCFE0648CEFF074BCFFE084ED1FE
                  0951D2FE0954D4FF0856D5FE0757D7FE0558D7FE0458D8FF0351CFFE043AC2FE
                  0205BDFE0201C4FF011CCDFE0242D6FE056BE1FC79CEFB7AE4E7E90200000000
                  0000000000000000E7EDF40BBFCDE12999AACD477B8CBC635C6CA8824350969F
                  28307DC2020049FE020049FF020049FF020049FF020160FF030381FF2530ABFF
                  2D3EB8FF1E2BB0FF111BABFF070FA7FF020BA6FF020CA7FF020EA9FF0311ABFF
                  0214ADFF0217AFFF021AB1FF021CB2FF021FB4FF0221B5FF0223B7FF0327B9FF
                  0329BBFF032CBDFF032EBEFF0331C0FF0434C1FF0436C3FF0539C4FF043BC6FF
                  043EC7FF0440C9FF0543CBFF0546CDFF0649CEFF074CD0FF074ED1FF0851D3FF
                  0854D4FF0957D6FF0959D7FF085AD8FF065CDAFF055DDBFF045FDBFF035BD6FF
                  0443C8FF0205C5FF021CCDFF0242D6FF0369E0FF51B8F5A5F5FBFE0400000000
                  0000000000000000E1E6ED0BC0CDE2289AABCE477B8CBC635C6CA8824351969F
                  202672CE020049FF010048FE010049FE01005BFE030380FF2430ACFE2939B6FE
                  1A25AEFE0D15A9FF030BA6FE020BA6FE020DA8FE020FAAFF0212ACFE0215ADFE
                  0218AFFE021AB1FF011DB3FE0220B4FE0222B6FE0325B8FF0228BAFE022ABBFE
                  022CBDFE032FBFFF0331C0FE0435C2FE0437C3FE043AC5FF043CC6FE043FC8FE
                  0441CAFE0544CCFF0647CDFE064ACFFE074DD0FE074FD2FF0852D3FE0956D5FE
                  0958D6FE0A5BD8FF0A5EDAFE0B61DAFE0A62DCFE0863DDFF0664DEFE0464DFFE
                  0362D9FE0343CDFF021DCDFE0242D6FE0369E0FE34A8F0C5F4FBFE0500000000
                  0000000000000000B4B8BD09C3D0E3269DAED0447D8EBE615F6FAA7F4452989D
                  1B206AD7020049FF010048FE010053FE01017AFE1F2AA7FF2837B6FE1823ADFE
                  0911A8FE020AA6FF020CA7FE020EA9FE0210ABFE0213ACFF0216AEFE0219B0FE
                  011BB2FE021EB3FF0220B5FE0222B7FE0226B8FE0328BAFF022BBCFE022DBEFE
                  0330BFFE0333C1FF0435C2FE0438C4FE043BC5FE043DC7FF0440C9FE0442CAFE
                  0545CCFE0648CEFF064BCFFE074DD1FE0750D2FE0853D4FF0957D5FE0959D7FE
                  0A5CD9FE0B5FDAFF0D64DBFE0E67DCFE0F69DDFE0D69DFFF0A69E0FE0769E1FE
                  0569E1FE0468DBFF0344D1FE0242D6FE0369E0FE239FEDD6D1D5D70300000000
                  0000000000000000A6A9AD05CAD5E721A3B4D33F8193C15D6374AE7A48579B99
                  161A63DE020049FF01004AFE010170FE141B9DFE2838B6FF1722AEFE0810A7FE
                  020AA6FE020CA8FF020EA9FE0212ABFE0214ADFE0217AFFF011AB1FE011CB2FE
                  021FB4FE0221B6FF0224B7FE0227B9FE0229BBFE0332BFFF0347C7FE0359CEFE
                  0462D2FE0464D2FF0563D1FE045BCEFE0454CCFE044BCAFF0546CBFE0546CDFE
                  0649CFFE074CD0FF074ED1FE0851D3FE0854D4FE0957D6FF095AD7FE0A5DD9FE
                  0B60DAFE0D65DBFF0F68DCFE106BDEFE126EE0FE1371E1FF1071E2FE0C70E3FE
                  096FE4FE056EE4FF046FDBFE034DD7FE0369E0FE0E95EADBBBC1C40200000000
                  00000000000000006D6F7002D3DDEB1AABBBD838899BC556697BB2744E5DA092
                  151861E0020049FF02005DFF07098DFF2838B5FF1826AFFF0812A8FF020BA6FF
                  020DA8FF020FAAFF0313ACFF0215AEFF0218AFFF021AB1FF021DB3FF0220B4FF
                  0222B6FF0325B8FF032EBCFF035ED0FF068CE2FF28A9E4FF54B3DCFF77B6D5FF
                  90BAD1FF9EBDD0FFA4BED0FF9AB8D1FF88AED1FF6A9CD0FF3F7FCCFF115BC7FF
                  064CC7FF074DCFFF0852D4FF0856D5FF0958D6FF0A5BD8FF0A5EDAFF0C61DBFF
                  0E66DCFF0F69DDFF106BDEFF126FE0FF1573E2FF1877E3FF1879E4FF1478E5FF
                  0E76E5FF0974E7FF0373E6FF0370DCFF0369E0FF0492E9E6B8C0C40500000000
                  000000000000000000000000D5DDE611B6C5DE2F93A5CB4D7285B86B5666A689
                  161961DF02004CFF020179FE1D29AAFE1C2CB2FE0A15AAFF020CA7FE020EA9FE
                  0211ABFE0214ACFF0216AEFE0219B0FE011BB2FE021EB3FF0220B5FE0223B7FE
                  022BBBFE036FD7FF1AB4EDFE68C2DDFEADC4CCFEC6C7C8FFC9C9C9FECBCBCBFE
                  CCCCCCFECECECEFFD0D0D0FED2D2D2FED3D3D3FED5D5D5FFD7D7D7FECFD2D8FE
                  95ACD2FE3E6CC4FF0845C0FE0853D1FE0A5CD8FE0A5FDAFF0D63DBFE0E67DCFE
                  0F69DDFE116DDFFF1371E1FE1574E2FE1878E3FE1B7BE5FF1D7FE6FE1D81E7FE
                  167EE7FE0E7BE8FF0777E9FE037DE5FE0374E1FE0492E9E8B8C0C40600000000
                  00000000000000000000000095999E07C6D2E624A0B1D2427E91C05F6073AD7D
                  181C63DB02005CFF090D93FE2335B6FE0F1DADFE020DA8FF020FAAFE0212ABFE
                  0215ADFE0217AFFF011AB1FE011CB2FE021FB4FE0221B6FF0224B7FE0246C6FE
                  0EAFEEFE6CC8DFFFBFC6C8FEC7C7C7FEC8C8C8FECACACAFFCCCCCCFECDCDCDFE
                  CFCFCFFED1D1D1FFD3D3D3FED4D4D4FED6D6D6FED8D8D8FFDADADAFEDBDBDBFE
                  DDDDDDFEDFDFDFFFAFBAD7FE3559BCFE0745C4FE0D63DAFF0E68DCFE106ADEFE
                  116EDFFE1472E1FF1675E3FE1979E4FE1B7CE5FE1E80E6FF2084E8FE2388EAFE
                  2188EAFE1783EAFF0D7EEAFE047BEBFE0486E4FE0492E9E8B8C0C40600000000
                  0000000000000000000000002D2E2F01D9E2EE16B1C0DB348DA0C8526E81B670
                  1C2066D7020274FF1826A9FE1729B1FE0612AAFE0210AAFF0213ACFE0215AEFE
                  0218B0FE021BB1FF011DB3FE0220B5FE0222B6FE0325B8FF0358CDFE26C2EFFE
                  A8C8CFFEC7C7C7FFC8C8C8FEC9C9C9FECBCBCBFECDCDCDFFCECECEFED0D0D0FE
                  D2D2D2FED4D4D4FFD5D5D5FED7D7D7FED9D9D9FEDBDBDBFFDCDCDCFEDEDEDEFE
                  E0E0E0FEE1E1E1FFE3E3E3FEDFE0E4FE7788C9FE0836B7FF0F67DBFE126FE0FE
                  1473E2FE1776E3FF197AE4FE1B7DE6FE1E81E7FE2185E9FF2489EAFE278DEBFE
                  2A90ECFE228CEDFF1586ECFE087FEDFE038AEAFE0494E9E8B8C0C40600000000
                  000000000000000000000000000000009CA0A507C7D4E623A0B2D3427F93C15F
                  20256ED203078AFF1F32B4FF0C1CAEFF0311ABFF0214ADFF0216AEFF0219B0FF
                  021BB2FF021EB4FF0220B5FF0323B7FF0326B9FF0353CBFF30C0EBFFBCC7C9FF
                  C7C7C7FFC9C9C9FFCACACAFFCCCCCCFFCECECEFFCDCFD0FFACC9D5FF7ABADBFF
                  57ADDDFF42A0DCFF4099D9FF4B99D7FF6AA3D6FF99B8D8FFD0D6DDFFE1E1E1FF
                  E3E3E3FFE4E4E4FFE6E6E6FFE8E8E8FFE9E9E9FF99A2D2FF0C31B2FF1470E0FF
                  1778E4FF1A7BE5FF1C7FE6FF1F82E7FF2186E9FF248AEBFF288EECFF2C92EDFF
                  3197EEFF2F98EFFF1F8FEEFF1086EEFF0386EEFF049BEAE8B8C0C40600000000
                  0000000000000000000000000000000000000000CDD4DE11B8C7DF2F94A7CD4C
                  262B7BCC0A159CFF192EB5FE0516ADFE0215ADFE0217AFFF011AB1FE011CB2FE
                  021FB4FE0221B6FF0224B7FE0227B9FE033BC2FE1FB1E9FFB6C6CBFEC8C8C8FE
                  C9C9C9FECBCBCBFFCDCDCDFECCCECFFE83C3DCFE2BABE5FF0582DFFE0566D7FE
                  0557D3FE0653D2FF0654D3FE0756D4FE075CD4FE075FD2FF1263CCFE598ACFFE
                  C5CFE0FEE7E7E7FFE9E9E9FEEAEAEAFEECECECFEEEEEEEFF8E94CEFE0C39B9FE
                  1A7CE5FE1C7FE6FF1F83E8FE2287EAFE258BEBFE298FECFF2D93EDFE3298EEFE
                  369DF0FE3BA0F1FF2C99F0FE188EF0FE0686F0FE049FEDE8B8C0C40600000000
                  000000000000000000000000000000000000000050525402D3DDEA19AEBFDB37
                  2C338CC51122A8FF1127B3FE0216AEFE0218B0FE021BB1FF021DB3FE0220B5FE
                  0222B6FE0325B8FF0228BAFE022BBCFE0686DFFE98C3D2FFC9C9C9FECBCBCBFE
                  CCCCCCFECECECEFFB6CCD4FE35B3E7FE057ADDFE054CCEFF0547CDFE064ACFFE
                  064CD1FE074FD2FF0752D4FE0855D5FE0858D6FE095BD8FF0A5DD9FE0A5DD5FE
                  0F54C5FE809BD3FFE8E9EBFEEDEDEDFEEFEFEFFEF0F0F0FFF1F1F2FE5257B7FE
                  165ED1FE2084E8FF2388EAFE268CEBFE2A90ECFE2E95EEFF3399EFFE389EF0FE
                  3DA2F2FE44A7F2FF3CA4F2FE2195F1FE0A8AF2FE049FF0E8B8C0C40600000000
                  0000000000000000000000000000000000000000000000007B7E8104CFDBEA1E
                  333C9CBF1328AEFF0A22B2FE0119B0FE011CB2FE021EB4FF0221B5FE0223B7FE
                  0226B9FE0329BBFF022BBCFE0345C6FE42B1E1FECACACAFFCCCCCCFECDCDCDFE
                  CFCFCFFEB3CBD5FF1BA7E8FE045BD3FE0545CCFE0548CEFF064BD0FE064DD1FE
                  0750D3FE0853D4FF0856D5FE0959D7FE095BD8FE0A5FDAFF0B62DCFE0D66DDFE
                  0E68DDFE0A52C9FF6481CBFEEDEEEFFEF1F1F1FEF3F3F3FFF5F5F5FED8D8EAFE
                  0F26AAFE2388EAFF278DECFE2B91EDFE2F96EEFE349BEFFF399FF1FE3FA3F2FE
                  45A8F2FE4CADF4FF4BADF4FE2C9EF3FE108FF3FE039FF2E8B8C0C40600000000
                  0000000000000000000000000000000000000000000000000000000083878B06
                  3B43A5C1132BB3FF0620B3FF021CB3FF021FB4FF0221B6FF0324B8FF0327BAFF
                  032ABBFF032CBDFF032FBEFF046CD6FF93BFD4FFCDCDCDFFCECECEFFD0D0D0FF
                  CBD0D3FF2CACE6FF0557D1FF0546CCFF0549CFFF064CD0FF064ED2FF0751D3FF
                  0754D5FF0857D6FF0959D7FF095CD9FF0A60DAFF0C63DCFF0D67DDFF0E6ADEFF
                  106DDFFF1271E1FF0B4FC7FF8697D3FFF4F4F4FFF6F6F6FFF7F7F7FFF9F9F9FF
                  5353B6FF2176DDFF2C93EDFF3097EEFF359BEFFF3AA0F1FF40A4F2FF46A9F3FF
                  4DAEF4FF54B3F5FF59B7F6FF37A5F5FF1594F4FF03A1F5E8B8C1C40600000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0D1574BC122CB4FF0421B4FE0220B5FE0222B6FE0326B8FF0228BAFE022BBCFE
                  022DBDFE032FBFFF0332C1FE0E85DCFEC3CBCFFECFCFCFFFD1D1D1FED3D3D3FE
                  7DBEDDFE0570DAFF0547CDFE054ACFFE064DD1FE074FD2FF0752D4FE0855D5FE
                  0858D7FE095AD8FF095DD9FE0A61DBFE0C65DCFE0E68DDFF0F6ADEFE116EE0FE
                  1372E1FE1575E3FF1777E3FE133FB8FEDDE0EEFEF8F8F8FFFAFAFAFEFCFCFCFE
                  9F9ED5FE1A54C7FF3198EFFE369DF0FE3BA1F1FE42A6F2FF48ABF3FE4FAFF4FE
                  56B5F6FE5FBAF6FF66BEF6FE43AEF6FE1998F5FE04A4F6E8B8C1C40600000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  010968AC102CB6FF0424B6FE0223B7FE0227B9FE0329BBFF022BBCFE022EBEFE
                  0330C0FE0332C1FF0438C3FE2390DBFECFD0D0FED2D2D2FFD4D4D4FED5D5D6FE
                  30A2E1FE054ED0FF054BD0FE064DD1FE0750D3FE0753D4FF0856D6FE0859D7FE
                  085ED8FE0766D6FF0765D4FE0A64D7FE0E69DDFE0F6BDFFF116FE0FE1373E2FE
                  1676E4FE187AE5FF1A7DE6FE125BCEFE8A95D3FEFBFBFBFFFDFDFDFEFEFEFEFE
                  CBCBE9FE163FB9FF379EF0FE3DA2F2FE43A7F2FE49ACF3FF50B0F5FE58B6F6FE
                  61BBF6FE6AC0F7FF72C4F7FE4EB4F7FE1B9CF6FE03A0EEE0B8BFC20400000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  01085E8E0D2CB5FF0527B9FE0227BAFE022ABBFE032CBDFF032FBFFE0331C0FE
                  0334C2FE0437C3FF043DC6FE2D90D9FED3D3D3FED5D5D5FFD7D7D7FECED5D9FE
                  1086DDFE064CD0FF064ED2FE0751D3FE0754D5FE0857D6FF0959D7FE0860D8FE
                  2482D7FE96BDE1FFABC7E3FE5F96D7FE0A61D1FE1170E1FF1474E2FE1677E4FE
                  187BE5FE1A7EE7FF1D82E8FE1C77E0FE5462BFFEFEFEFEFFFEFEFEFEFEFEFEFE
                  DEDEF1FE1538B5FF3EA3F2FE44A8F3FE4BADF4FE52B2F5FF5AB7F6FE63BCF6FE
                  6CC1F7FE75C6F8FF7ECBF9FE54B8F8FE199DF7FE028DCDBF0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  010540610A2AB4FF052CBBFF032BBCFF032DBEFF032FBFFF0332C1FF0434C2FF
                  0438C4FF043BC5FF043EC7FF2083D7FFD3D5D6FFD8D8D8FFD9D9D9FFCED6DBFF
                  0C7CDAFF064FD2FF0752D4FF0755D5FF0858D7FF095AD8FF095DD9FF0768D6FF
                  AAC7E3FFECECECFFEEEEEEFFEEEEEFFF3E78CEFF1370DFFF1778E5FF197CE6FF
                  1B7FE7FF1E83E8FF2187EAFF2181E5FF4553BAFFFFFFFFFFFFFFFFFFFFFFFFFF
                  CDCDEAFF1B42B9FF46A9F3FF4DAEF4FF53B3F6FF5CB8F6FF65BDF7FF6EC2F7FF
                  77C7F8FF82CDF9FF8BD1FAFF55BAF9FF149CF8FF027CAB900000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00011C250624ADFE0831BEFE022EBEFE0330C0FE0333C1FF0435C3FE0439C4FE
                  043BC6FE043EC7FF0440C9FE096BD2FEC5D0D8FEDADADAFFDCDCDCFEDADCDEFE
                  2085D9FE0754D4FF0856D6FE0858D7FE095BD8FE095EDAFF0A62DBFE0966D6FE
                  8EB5E0FEEFEFEFFFF1F1F1FEF2F2F2FE98B3DFFE0F61D2FF197DE6FE1C80E7FE
                  1E84E9FE2188EAFF248CECFE2077DEFE636AC2FEFFFFFFFFFEFEFEFEFEFEFEFE
                  A3A2D8FE295EC8FF4EAFF5FE55B4F6FE5EBAF6FE67BFF7FF70C4F7FE79C9F8FE
                  84CEFAFE90D3FBFF95D6FBFE50B9F9FE0C9DF9FE01556E530000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000202021992D20935C0FE0331C0FE0334C2FE0436C3FF043AC5FE043CC6FE
                  043FC8FE0441CAFF0443CBFE0559CEFE88B1D8FEDDDDDDFFDFDFDFFEE1E1E1FE
                  62A3DAFE075FD5FF0859D8FE095CD9FE095FDAFE0B63DCFF0C66DDFE0D69DDFE
                  2C75D0FEF0F1F1FFF3F3F3FEF5F5F5FEE7EBF3FE1854C3FF1C81E7FE1F85E9FE
                  2289EAFE258DECFF2991EDFE164EC3FEABAFDEFEFFFFFFFFFEFEFEFEFEFEFEFE
                  5A59B9FE4290E3FF57B6F6FE60BBF7FE69C0F7FE72C5F8FF7CCAF9FE87CFFAFE
                  93D5FBFEA1DAFBFF98D7FBFE40B3F9FE04A5F8F100242C110000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000010C58770834BEFE0435C2FE0437C4FE043BC5FF043DC7FE0440C9FE
                  0442CAFE0544CBFF0447CDFE054DCFFE2E7CD1FEDDDEE0FFE2E2E2FEE3E3E3FE
                  C6D5E2FE106DD2FF085ED9FE0A60DBFE0B64DDFE0D67DEFF0E6ADFFE0F6DE0FE
                  0A60D0FEB4C8E7FFF6F6F6FEF8F8F8FEF9F9F9FE6180CEFF1A74DDFE238AEBFE
                  268EECFE2A92EEFF2785E4FE303EB1FEF7F7FBFEFFFFFFFFFEFEFEFEE3E3F3FE
                  1C2FACFE58B5F5FF62BCF7FE6AC1F7FE74C6F8FE7ECBF9FF89D0FAFE96D6FBFE
                  A4DCFBFEB2E2FCFF8AD2FBFE25A9FAFE028AC1A6000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000115150429AEEE073BC5FF043BC6FF043EC8FF0440C9FF0443CBFF
                  0545CCFF0548CEFF054BD0FF064DD1FF0658CEFF87ACD8FFE4E4E4FFE6E6E6FF
                  E8E8E8FF92B6DEFF0861D0FF0B64DCFF0D68DEFF0E6BDFFF106FE0FF1272E2FF
                  126FDDFF4B7BCEFFF8F8F9FFFAFAFAFFFCFCFCFFBFCAEAFF1051C6FF278FEDFF
                  2B94EEFF2A8BE7FF1631AFFFCACCEAFFFFFFFFFFFFFFFFFFFEFEFEFF5F5EBBFF
                  4283D9FF64BDF7FF6DC2F7FF76C7F8FF80CCF9FF8CD2FAFF98D7FBFFA7DDFCFF
                  B5E3FCFFBFE7FCFF66C4FBFF0BA3FBFE01435537000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000001126681063CC4FE043FC8FE0441CAFF0444CBFE0446CDFE
                  0549CEFE054CD0FF064ED2FE0651D4FE0754D4FE105FCAFFB7C8E0FEE9E9E9FE
                  EAEAEAFEECECECFF8CB0DDFE0E5ECBFE0D68DBFE1070E1FF1273E2FE1576E3FE
                  167AE5FE0F55C7FFD3DCF0FEFDFDFDFEFEFEFEFEFDFDFEFF294BBAFE298EEBFE
                  2F97EFFE1739B4FFB9BCE3FEFEFEFEFEFEFEFEFEFFFFFFFFA2A1D7FE2646B9FE
                  65BEF7FE6EC3F8FF78C8F8FE83CDF9FE8FD3FAFE9BD8FBFFAADFFCFEB9E5FCFE
                  C9EBFDFEABE0FCFF32B1FBFE0295D2B100000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000C0B032BAADD0643CAFE0545CCFF0447CDFE054ACFFE
                  054DD1FE064FD3FF0752D4FE0755D5FE0857D7FE0759D5FF1B60C8FEBECCE3FE
                  EDEDEDFEEFEFEFFFF0F0F0FEC0D0E8FE3871CCFE0B58CBFF126CDBFE167AE5FE
                  197EE7FE156DD9FF6F8AD2FEFEFEFEFEFEFEFEFEFFFFFFFF828ED2FE216CD4FE
                  3396ECFE3B43B1FFFEFEFEFEFEFEFEFEFEFEFEFEB1B1DEFF2134AEFE62B6F2FE
                  70C4F8FE7AC9F8FF85CFFAFE91D4FBFE9EDAFBFEADE0FCFFBCE6FCFECCEDFDFE
                  CDEDFDFE68C7FCFF08A8FBF3002E3A2600000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000093741043DC3F90548CEFF054BCFFE054DD1FE
                  0650D3FE0753D5FF0756D6FE0758D7FE085BD9FE085EDAFF095ED7FE1255C5FE
                  9AB1DCFEF0F0F1FFF3F3F3FEF5F5F5FEF5F5F6FEB9C9E8FF6185D1FE2155C2FE
                  1261D1FE1F85E9FF1747BCFEEDEFF9FEFEFEFEFEFFFFFFFFDCDEF1FE173CB6FE
                  3CA2F1FE1B3FB7FF706FC2FEA6A5D9FE6F6EC2FE2239B1FF63B4F1FE72C6F8FE
                  7DCBF9FE88D0FAFF94D5FBFEA2DBFCFEB0E2FCFEC0E8FDFFCFEEFDFED6F1FEFE
                  94D8FCFE1BAAFCFE016E956D0000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000011665780547CCFE064ED2FF0651D4FF
                  0754D5FF0757D7FF0859D8FF085CD9FF095FDAFF0A62DCFF0B66DDFF0C66DCFF
                  0952C8FF4D74C9FFCED6EBFFF7F7F7FFF9F9F9FFFBFBFBFFFCFCFCFFF4F6FBFF
                  4D6AC6FF1D79DFFF1761D0FF909CD7FFFFFFFFFFFFFFFFFFFEFEFEFF464CB5FF
                  3C95E8FF49AAF2FF3A7ED8FF3366CAFF4888DAFF69BEF5FF75C7F8FF7FCCF9FF
                  8BD1FAFF96D7FBFFA5DDFCFFB3E3FCFFC3E9FDFFD2EFFDFFD7F1FEFFAFE2FDFF
                  31B2FCFF0294CFA6000405020000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000060102208798054ED1FE0755D5FE
                  0758D7FE085AD8FF085DDAFE0960DBFE0A63DCFE0C66DEFF0D69DFFE0E6DE0FE
                  1070E1FE0F67D8FF0D49C1FE4E6EC7FEAEBBE3FEEFF1F9FFFEFEFEFEFAFBFDFE
                  5D71C7FE1F79DEFF288FEBFE2940B4FEF8F8FCFEFFFFFFFFFEFEFEFE6766BFFE
                  3B87DEFE53B4F6FF5BB9F6FE64BEF7FE6DC3F8FE77C8F8FF82CDF9FE8DD2FBFE
                  9AD8FBFEA8DEFCFFB7E4FCFEC7EBFDFED4F0FEFED7F1FFFFB8E6FDFE3DB7FBFE
                  038FCFBE0011160B000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000080402248A9A0653D3FE
                  075BD9FE085EDAFF0961DBFE0A64DDFE0C67DEFE0D6BDFFF0E6EE0FE1072E2FE
                  1375E3FE1578E4FF167BE6FE1571DEFE0F54C9FE1643BAFF3B55BCFE2947B8FE
                  1657C9FE2C96EFFF309AF0FE2064CFFE3F47B3FE8182CAFF6B6AC0FE11109AFE
                  2B5BC5FE5BB5F4FF66BFF7FE6FC4F8FE79C9F8FE84CEFAFF90D4FBFE9CD9FBFE
                  ABDFFCFEBAE6FDFFCAECFDFED5F0FEFED7F1FEFEB5E5FDFF3EB7FBFE038DCFBE
                  0011171000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000802011E6F81
                  0556D4FC0961DCFF0B65DDFE0C68DFFE0E6CE0FE0F6FE1FF1172E2FE1376E3FE
                  1579E5FE177CE6FF1A80E8FE1C84E9FE1F87EAFE228AEBFF2489E9FE278FECFE
                  2D97F0FE319BF1FF369FF2FE3CA3F2FE1735B2FE9A9AD4FFF2F2F9FEF0F0F8FE
                  7D7DC8FE3763C7FF71C5F8FE7BCAF9FE87CFFAFE92D5FBFF9FDAFCFEAEE1FCFE
                  BEE7FCFECDEDFDFFD6F1FEFED6F1FEFEA5DEFDFE2DB1FBFE038DCDA70010150B
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  01115251044DC7E90A66DEFF0E6DE0FF0F70E2FF1174E3FF1477E4FF157AE5FF
                  177DE7FF1A81E9FF1D85EAFF2088EBFF238CECFF2690EDFF2994EFFF2E98F0FF
                  329CF1FF38A0F2FF3DA4F3FF43A8F3FF1F2EABFFF1F1F9FFFFFFFFFFFFFFFFFF
                  C7C7E7FF2E4BB9FF7ECBF9FF89D1FBFF95D6FBFFA3DCFCFFB1E2FCFFC1E9FDFF
                  D0EEFDFFD7F1FFFFCCEDFEFF7ACEFCFF15A7F8F6026491720003050200000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000004211D02349AAF0765DDFE1073E2FE1478E4FF167BE6FE187EE7FE
                  1B82E9FE1D86EAFF2089EBFE248DECFE2691EDFE2A95EFFF2F99F0FE339EF1FE
                  39A1F2FE3FA5F3FF44AAF4FE4BAFF5FE336FD0FE3B3CADFF8786CCFE7776C5FE
                  272EA9FE6CABE9FF8CD2FBFE98D7FBFEA6DDFCFEB4E4FCFFC4EAFDFED2EFFEFE
                  D4F0FEFEA4DEFCFF3BB3F9FE058DD8C801304530000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000F48480344B4CD0B6EE1FE157CE7FE1B83E9FE
                  1E87EAFE218AECFF248EEDFE2792EEFE2B96EFFE309AF1FF349FF2FE3AA2F3FE
                  40A7F3FE46ACF4FF4DB0F5FE54B5F6FE5CBAF7FE5BAAECFF4C85D7FE5992DDFE
                  7EC6F6FE8ED3FBFF9BD8FBFEA9DFFCFEB8E5FCFEC8EBFDFFCEEEFEFEA4DDFCFE
                  48B6F8FE0A97EBDF02507B6100070A0300000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000050401124A4F033FB1BD0B6CE0FC
                  1780E9FE238DEDFF2893EEFE2C97F0FE319CF1FE35A0F2FF3BA3F3FE41A8F4FE
                  47ADF5FE4EB2F6FF55B7F7FE5EBBF7FE67C0F7FE70C5F8FF7ACAF9FE85CFFAFE
                  91D4FBFE9EDAFCFFACE0FCFEB8E5FCFEB0E1FCFE7CC9F9FF35A9F5FE0887DBD0
                  024D7C630010190B000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000030100062928
                  01267680044ABDD30E72E2FB1B87EBFF2994EFFF38A0F2FF41A8F4FF48AEF5FF
                  4FB3F6FF57B8F7FF60BCF7FF69C2F8FF72C6F8FF7CCBF9FF86D0FAFF8DD3FBFF
                  8CD2FAFF79C7F8FF5AB6F6FF2FA1F2FD0C87E3DF025B9E91012C4C3800040603
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000002241F0116585B013087930347B6C20A5FD2E41273E1F5
                  1A81E7FE238BEBFF2790ECFE2A92EDFE2B94EDFE2691ECFF1D89E9F8117CE0E7
                  0568C6CA02529B9C02396D6701203E2A00020401000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000ACADB804ACAEBD11
                  ACB4D01FACBDE92EACBEEA36ADC0EB36ADC2EC31ADBFE122ACB3BF14ACB2BB07
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFC0000FFFFFFFFFFC000000FFFFFFFFF00000001FFFFFFFC0000
                  00007FFFFFF0000000001FFFFFC0000000000FFFFF800000000003FFFE000000
                  000001FFFC000000000000FFF80000000000007FF80000000000003FF0000000
                  0000001FE00000000000001FE00000000000000FC00000000000000FC0000000
                  0000000780000000000000078000000000000007800000000000000780000000
                  0000000380000000000000038000000000000003800000000000000380000000
                  000000038000000000000003C000000000000003C000000000000003C0000000
                  00000003E000000000000003F000000000000003F000000000000003F8000000
                  00000003FC00000000000003FE00000000000003FE00000000000003FE000000
                  00000007FE00000000000007FE00000000000007FE00000000000007FF000000
                  0000000FFF0000000000000FFF8000000000001FFF8000000000001FFFC00000
                  0000003FFFE000000000003FFFE000000000007FFFF00000000000FFFFF80000
                  000001FFFFFE0000000003FFFFFF000000000FFFFFFFC00000001FFFFFFFE000
                  00007FFFFFFFF8000001FFFFFFFFFF80000FFFFFFFFFFFF801FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF28000000800000000001000001002000000000000008010000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000595B5D02595B5D037E818404
                  C1C7CC07C0C6CC09BFC5CB0BBFC5CB0CBEC5CB0ED0D7DE0EE5EDF50FE2EBF411
                  E1EBF411E1EBF411E1ECF411E2ECF511DEE7EE0FBEC6CC0EBEC6CC0DBFC6CC0C
                  C0C7CD0AC1C8CD08C3C9CE066B6E7004595B5D03595B5D010000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000006B6E7001
                  6E717303B9BDC206D5DBE20AD3D9E10EE2EAF311DBE5F015D7E3EF18D4E1EE1B
                  D1DEED1DCDDBEC20C9D9EA23C7D7EA25C5D7E926C4D6E929C4D6E929C4D6EA29
                  C2D5E92AC1D4E92AC2D5E92AC4D7EB29C4D7EB29C5D8EB29C7DAEC26C8DBEC25
                  CCDEEE22CEE0EF20D3E3F01ED7E6F21BD9E7F318DEEBF414D8E2EA10D5DDE40D
                  D7DFE508767A7D056F7275020000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000005A5C5D0183868905D3D9DE09E3EBF30FDFE8F114
                  D7E1EE18D1DDEC1DCBD9EA21C4D4E726BFD0E62BBBCDE42EB6C9E132B2C6E035
                  AFC4DF38ACC1DE3AA9BFDD3DA6BEDC3FA4BCDB41A3BCDB42A1BBDB44A1BCDB45
                  A1BCDC45A2BCDC45A2BDDD45A2BDDD45A2BEDD45A3BFDE44A5C1DF42A7C2E041
                  A9C5E23EACC7E33CAFCAE53AB4CDE737B7D0E833BDD4EA30C2D9EC2CC7DCEE27
                  CDE1F022D4E5F21EDAE9F418E2EEF713E6F0F70D93989C078185880300000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  82858803BABFC308E4ECF40DDEE7F114D5E0ED19CDDAEA20C6D5E724BECEE42B
                  B8CAE230B1C4DE35ACC0DC3AA6BCDA3EA1B7D7439DB4D64799B1D44A95ADD24E
                  92ABD15190A9D1538CA7CF568AA5CE5888A4CE5A86A3CE5C85A2CE5D84A2CE5F
                  84A2CE5F84A3CF5F85A4CF5F85A5D05F86A5D15F86A7D25E88A9D35C89AAD45B
                  8CADD6598FB0D75792B3D95495B6DB5199BADD4E9DBDDF4AA2C2E246A6C6E342
                  ACCBE63DB2CFE839B9D4EB33C1D9EE2DC8DEF027D0E4F221D8E9F41AE1EEF713
                  D6E0E70B999FA3063F4143020000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000007B7D8003B5BABF08E4EBF30E
                  DBE4EF16D1DDEC1CC8D6E823BECEE42AB7C8E030AFC1DD36A8BBD93CA0B5D642
                  9AB0D44895ACD14C8FA7CE528BA3CC56869FCA5A819BC85F7E98C7627A95C566
                  7792C3697490C36D718EC26F6F8CC1726D8BC0736B89C0766B8AC0766989C079
                  6989C079698AC1796A8BC2796A8CC3796A8DC3796A8EC4796C91C6766D92C776
                  7095C9737298CA71759BCC6F799FCF6C7CA2D16980A7D36585ABD6618AB0D95D
                  8FB5DB5894BADE539ABFE14DA1C4E448A8C9E642B0CFE93CB8D5EC34C1DBEF2D
                  CBE2F225D4E7F41DDFEDF715CAD4DB0DA1A8AC06454749010000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000005A5C5E01ACB0B406E0E7EE0DDCE4EF14D1DDEB1CC6D4E724
                  BDCDE32BB4C5DF32ABBDDA39A3B7D6409BB0D24794AAD04D8DA3CC53879ECA59
                  8198C65F7C94C464768FC169728ABE6E6D87BC726883BA77657FB97B627CB77F
                  5E79B5835B77B4865975B3895673B28C5472B28E5270B1915271B291506FB194
                  5170B2944E6EB0964A68AC9A4562A89F4461A7A04462A8A0415EA5A3435FA6A2
                  4765AB9E4B6CAF994D6FB2965378B8905A80BD89648FC7806994CA7C6D99CD78
                  729DD07378A3D36E7DA8D66884AEDA638BB4DD5D92BAE0569AC1E34FA2C7E648
                  ABCEEA40B4D4EC38BEDBF030CAE2F327D5E9F61DE0EFF814CBD5DB0B6A6E7003
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  6F717402DBE0E608E1E9F211D6DFED19CAD7E821BFCEE42AB4C5DE32ABBDDA39
                  A2B5D54199ADD04891A6CD4F899FC9568299C65D7B92C264758CBE696E86BB70
                  6880B876647CB57C5F77B2815972AF87566EAE8C516AAB904E66A9954B63A899
                  4760A69D445EA4A1415BA2A5384F98AE2E418CBB263783C71E2B7ACF172576DA
                  122376E20F2477E70E277BE90E2B7FEC0D2E82ED0E2F83EC0D2F84EC0D3086EB
                  0E3288EA0F358BE910358CE712348CE314338CDF17328DD91E358ECD273D93BF
                  334D9FB34160ABA54D72B695628EC8836D9DD07975A4D5727DABD96A85B2DD63
                  8DB9E15B96C0E453A0C7E74BAACFEB42B5D6EE38C1DEF12ECDE5F424DAECF81A
                  DDE9F1109DA2A706000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000006C6E7103D9DFE60A
                  DEE6F013D1DCEB1CC5D2E625B9C9E02EAEBFDB37A3B6D53F9AAED14791A6CC4F
                  889EC8568196C45E788EC0667288BB6C6A81B774647AB37B5E75B082576EAC89
                  5269A98F4D63A695495FA49A445AA0A040579EA53B519BAB344994B3293A86C1
                  1E2B78D2121D6CE1091766F0071B6AF6072272F9072979FB07307FFE073484FF
                  073686FF073888FF073A8BFF073C8DFF073E8FFF084092FF084294FF084495FF
                  084597FF084799FF08479BFF08499CFF084A9DFF084A9FFF084BA0FF084BA0FD
                  09459DF80B3F99F30D3694EB103090E31A3392D02C499FBC4264B0A35B88C58A
                  6C9DD17B78ABDA6F82B3DF668CBBE35D96C3E654A1CBEA4AADD2ED40BADAF036
                  C7E2F42AD5EAF71EE3F1FA13CBD4D9085B5E6001000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000006E707303CDD2D90ADDE5F013D0DBEA1D
                  C3D0E526B6C6DF30ABBCD939A0B2D34296AACE4A8CA1C9538397C45B7B90C063
                  7388BB6B6B80B6736378B27B5C71AE83556AA98B5064A692495DA29943579F9F
                  3E529BA6394D98AC344793B42C3C89BF1E2976D3121C68E4081460F3051763FA
                  061E6BFD062471FE062674FF062876FF062A79FF062C7BFF062E7EFF063081FF
                  073283FF073585FF073688FF07388AFF07398CFF073B8EFF073D90FF073F92FF
                  084194FF074296FF074497FF074599FF07459AFF07469CFF07479DFF07479EFF
                  08479FFF0847A0FF0747A0FF0747A1FF0746A1FE08419EFA0A3999F30D3093E8
                  1B3798D13151A7B74E78BE986698D0807AB0DE6F85B8E2658FC0E65A9CC9E950
                  A8D1ED45B6DAF139C4E2F42DD4EAF720E2F1FA14C3CCD10856595B0100000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000066686A01CACFD508DEE6F012D1DCEB1CC3D1E526B6C5DE30
                  AABBD8399FB1D24394A7CC4C8A9EC7558094C25E778BBD676E83B86F667BB378
                  5E72AD81566AA9894F62A491485BA09942559CA03C4F98A8364894AF314290B7
                  283785C31B2573D60F1763EA07115DF7051560FD051A64FE051C67FF051E6AFF
                  05206CFF05226FFF052471FF062674FF052777FF052979FF062B7BFF062D7EFF
                  062F80FF073082FF073385FF063487FF063689FF07378BFF06398DFF073A8FFF
                  073C91FF073D92FF073E94FF073F95FF074097FF064198FF074299FF07429AFF
                  07429BFF07429CFF07439DFF07429EFF07429EFF06419EFF06419EFF06409FFF
                  063D9EFD07379BF80A2E95F0153196DB2F4EA7BA517EC3966FA6D9797FB7E26B
                  8BBFE65F98C8EA53A6D1EE47B5DAF13AC4E3F52DD5EBF81FDBEAF212989FA306
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000ABAFB406DDE3EC0FD4DEEC1AC6D3E524B8C7DF2EABBCD9389FB1D242
                  94A7CC4C899CC6567E92C15F7589BB686C80B6716377B07B5A6EAA845366A68D
                  4B5EA09644569C9E3D4F97A7374893AF31408EB72B3989BF1F2A79CF101663E7
                  070D58F7040F5AFD04135DFE05155FFF051761FF051864FF051A65FF051C67FF
                  051E6AFF051F6DFF05216FFF052371FF062574FF052676FF052879FF052A7BFF
                  062B7DFF062D7FFF062E82FF063084FF063286FF063388FF06358AFF06368BFF
                  06378DFF07388FFF063990FF073A92FF073B93FF073C94FF063C96FF073D97FF
                  063D98FF063D98FF063D99FF063D9AFF063C9AFF063C9BFF063B9BFF053B9CFF
                  063A9CFF053A9CFF05399CFF05379CFE063199FA0A2A95ED1A349AD53E63B5AB
                  679ED7817CB7E36E89C0E86297CAEC55A6D3F048B6DCF33AC7E5F62BD8EDF91D
                  DBE8EF0E6B6F7103000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000007E808402
                  E1E7EE0BD9E2EE15CBD7E820BCCAE12BAEBEDA36A2B3D34095A8CC4A8A9DC754
                  8093C15E7589BB686B7EB5726275AF7C5A6CA9865163A38F495A9E99415199A2
                  3A4993AB34428EB32D3A89BC263283C6192171D80A0E5AEF040A54FC030E57FE
                  031059FE03115BFF04125CFF04135EFF04155FFF051761FF051863FF051A66FF
                  051C68FF051D6BFF041E6DFF05206FFF052271FF052374FF052576FF052778FF
                  05287AFF062A7DFF062B7FFF062C81FF062E83FF063085FF063186FF063288FF
                  06338AFF06348CFF06368DFF06368FFF063790FF063891FF063892FF063893FF
                  063994FF063995FF063996FF063997FF053898FF053898FF053798FF053799FF
                  053699FF053599FF053499FF04339AFF04329AFF04309AFE042E99FE062796F7
                  0F2695E43151ADB9629BD6877BB8E57089C2EA6298CCED54A9D6F246B9DFF537
                  CBE8F728DEF1FB18D7E2E7080000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000AFB3B806E0E7F111
                  D1DBEB1CC1CFE426B4C2DC32A6B6D53D99ABCE478D9FC8528194C15C778ABC67
                  6D80B5716274AE7B596BA9865062A39048589D99404F97A3384791AD313E8BB6
                  2B3686BF232E7FCA171E6EDC080B57F3020751FE030B54FE030C55FF030D56FF
                  030F58FF031059FF03115AFF04125CFF04135DFF04145EFF041660FF051763FF
                  051966FF051B68FF051C6AFF051D6DFF041F6FFF042071FF052273FF052376FF
                  052578FF05277AFF05287CFF05297EFF062A80FF052B82FF052C84FF052E85FF
                  062F87FF052F89FF05308AFF06328BFF05328CFF06338EFF05338FFF053390FF
                  053491FF063492FF053493FF063494FF053494FF053395FF053395FF053296FF
                  053196FF043196FF043097FF042F97FF042D97FF042D98FF032C98FF032B98FF
                  032998FE042496FA0B1F93EB2F51AFBD6099D68A7CBBE8708BC6EC619CD0F052
                  ADDAF443BFE3F633D3ECFA21E7F5FC108E949603000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000045464801DBE1E709DBE3EE15CAD6E820
                  BAC9E02CADBCD9379FB1D14293A5CB4D8699C4587B8DBD637082B76D6577B078
                  5B6DA9835162A38E49589D98404F96A2394791AC313E8AB6293584C1222C7ECB
                  171E6FDB090C59F102054EFD020751FE020852FF020953FF030A54FF030C55FF
                  030D56FF030E57FF041059FF04105AFF04115BFF04135DFF04145EFF041560FF
                  041764FF051866FF051A68FF051C6AFF051C6DFF051E6FFF041F71FF052073FF
                  052275FF052377FF052479FF05267BFF05277DFF05287FFF052980FF062A82FF
                  052B84FF052C85FF052D87FF052D88FF052E89FF052E8BFF052F8CFF052F8DFF
                  05308EFF05308FFF052F90FF052F91FF052F91FF052F92FF052E92FF042E93FF
                  042D93FF042D94FF042C94FF042C95FF042A95FF042995FF032896FF032796FF
                  032696FF032496FF032396FE031E95FB0C1F96EA385FBAB568A8E08380C1EA6C
                  91CCEF5DA2D5F34DB5E0F63CCAE9F92ADFF2FC17AEB7BB070000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000008D919403D7DDE40DD6DFEC18C5D2E524B5C4DD30
                  A7B8D63B99ABCE478D9FC8528194C15D7587B9686A7CB2735F70AC7E5565A58A
                  4C5B9F954251989F3B4891AA323E8BB42A3584BF232D7EC91A2274D70C0F5DED
                  03044EFC02054EFE03054FFF030650FF020751FF020852FF030953FF030A54FF
                  030C55FF030C56FF040E57FF040F58FF03105AFF03115BFF04125CFF04135EFF
                  041460FF041663FF051766FF051968FF051A6AFF051B6CFF051D6EFF051E70FF
                  041F72FF042074FF052176FF052278FF04237AFF04257CFF05267EFF052780FF
                  052881FF052882FF052984FF052A85FF052A86FF052B88FF042B89FF042B8AFF
                  042C8BFF042C8CFF052B8DFF052B8EFF042B8EFF042B8FFF042B90FF042A90FF
                  042A91FF042991FF042992FF042892FF032792FF032693FF032593FF032493FF
                  032293FF022194FF032094FF031F95FF031E96FE041996FA152BA2DF4778CAA5
                  74B9E87987C7EE6799D2F355ADDDF643C2E6F831D8EFFB1ED1DDE30B26272801
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000009DA0A504E2E9F20FD2DCEB1AC1CFE327B1C1DB33A2B3D33F
                  95A6CC4A889AC5567C8FBE617183B76D6576AF785A6BA8845060A28F46559B9A
                  3D4C93A635418CB02D3786BB252E7FC61D2678D1111666E404054FF902024BFE
                  02034CFF02044DFF02054EFF03064FFF02064FFF020751FF020852FF020952FF
                  030A53FF030B54FF040C55FF040D57FF030E58FF041059FF03105AFF03115CFF
                  04125EFF041361FF041464FF051666FF041868FF05196AFF051A6CFF051B6EFF
                  041C70FF041D71FF051E74FF041F75FF042077FF042179FF04227BFF04237CFF
                  05247EFF04257FFF042581FF052682FF052683FF052785FF042786FF042887FF
                  042888FF042889FF04288AFF05288BFF04278CFF04278CFF04278DFF04268EFF
                  04268EFF03258FFF04258FFF032490FF032390FF032291FF032191FF022092FF
                  032092FF031F92FF031E92FF031D93FF031B94FF021A97FF031999FE06179CF5
                  2645B4CA61A5E18A7FC4EE6F92D0F35DA5DAF64BBBE4F938D2EEFC24D5E3EA0F
                  7B7F820100000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000009EA1A505E0E7F111CFDAE91DBECCE129AEBEDA369FB1D24291A3CA4E
                  8596C359798ABB656C7EB4706071AC7C5666A5894C5B9E94425197A0394690AB
                  313B88B6283181C220287ACD171E71DA090B59F002014AFE02014AFF02024BFF
                  02024CFF03034CFF03044DFF03054EFF03054EFF03064FFF030650FF030851FF
                  030852FF030953FF030B54FF030C55FF040D56FF040D57FF040F58FF04105AFF
                  04115CFF04115EFF041260FF041363FF041565FF051667FF05186AFF05196BFF
                  051A6DFF051B6FFF051C71FF041C73FF041D75FF041E76FF041F78FF041F7AFF
                  04207BFF04217DFF04227EFF04227FFF042381FF042382FF042383FF042484FF
                  042485FF042486FF042487FF042488FF042489FF04248AFF04238BFF04238BFF
                  04228CFF04218CFF04218DFF03208DFF03208EFF031F8FFF031F8FFF031E90FF
                  031D90FF031C91FF031B91FF031A91FF031892FF031796FF031798FF03159BFF
                  03139EFD0D1DA5EA487FD2A576C0EE788ACDF2659FD8F652B5E2F93ECDEDFB28
                  E3F4FB127A808202000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  9C9FA406DFE7F012CCD8E81FBBCAE02BACBCD8379DAFD0438FA0C9508293C15C
                  7587B968697AB1735E6EAA805362A38C48569B983F4C93A436418CAF2D3685BB
                  242C7EC71C2376D3111768E305044FF9010049FF010049FF01004AFF01014AFF
                  02014AFF02024BFF02034CFF03034DFF02044DFF02054EFF02054FFF020650FF
                  020751FF020852FF020952FF030A53FF030B54FF030C55FF030D56FF030E58FF
                  030F5AFF03105CFF03115EFF041160FF041263FF041365FF041567FF041669FF
                  04176BFF04186DFF04196EFF041A70FF041A72FF041B74FF041C75FF041D77FF
                  041D78FF041E7AFF041F7BFF041F7CFF041F7EFF031F7FFF032080FF032081FF
                  032083FF032084FF032085FF042086FF042086FF042087FF042088FF041F89FF
                  041F89FF041F8AFF041E8BFF041E8BFF041D8CFF031C8CFF031B8DFF031B8EFF
                  031A8EFF03198FFF03188FFF03178FFF021691FF021494FF021497FF02139AFF
                  02129DFF0211A0FE050FA3F82F57C4C16AB5EA8583CBF26C99D6F658B1E2F942
                  C9ECFC2CE2F5FD157A8082030000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000989CA006
                  DFE6F012CDD9E81EBBCADF2BABBBD7389CADD0448E9FC8508192C05D7485B869
                  6778B0765B6CA8825160A18E46549A9B3C4992A7333E8AB32A3282BF22297ACA
                  191F72D70D1060EA03014BFC020049FF010049FF010049FF01004AFF01004AFF
                  01014AFF01014AFF02024BFF03034CFF02034DFF02044DFF02054EFF02054FFF
                  02064FFF020650FF020751FF030852FF020953FF030A54FF030B55FF030C56FF
                  030D58FF030E5AFF040F5CFF04105EFF031060FF031163FF041265FF041367FF
                  041469FF04156AFF05166CFF04176EFF04176FFF041871FF041973FF041974FF
                  041A76FF041B77FF041C79FF041C7AFF041C7BFF041D7DFF041D7EFF041D7FFF
                  041D80FF041D81FF041D82FF041D83FF041D84FF041D85FF041D86FF041C86FF
                  031C87FF031C88FF041B89FF041B89FF031A8AFF03198AFF03188BFF03188CFF
                  03178CFF03168DFF03158DFF03148EFF03138FFF021392FF021295FF021199FF
                  02109CFF020F9FFF020EA3FE030CA6FC1E3ABBD75EA7E6917ECAF37295D6F75B
                  ADE1FA45C7ECFC2EE1F5FE167A80830300000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000999CA005E0E7F111
                  CDD9E81EBCCAE02BAABBD7389CADD0448E9FC8518192C05D7485B86A6677AF76
                  5A6AA7844F5EA0904553989C3B4790A8313B88B5283080C1202779CD161D70DA
                  0A0C5BEF02004AFE020049FF020049FF010049FF010049FF010049FF010049FF
                  01004AFF01014AFF02014AFF02024BFF02024CFF02034CFF02034DFF02054EFF
                  02054EFF02064FFF020650FF030751FF020851FF020952FF020953FF030A55FF
                  030B57FF030C58FF030D5AFF040E5CFF030F5EFF030F60FF031062FF031165FF
                  031166FF041268FF04136AFF04146BFF04156DFF04156FFF031670FF031772FF
                  031773FF031875FF031876FF041978FF031978FF031A7AFF041A7BFF041A7CFF
                  041A7DFF041A7FFF041A80FF041A81FF031A81FF031983FF031984FF031984FF
                  031985FF031886FF031886FF041787FF031788FF031688FF031689FF031589FF
                  03148AFF03138BFF03128CFF03128CFF03118EFF021191FF021094FF020F98FF
                  020E9BFF020D9EFF020CA2FF020BA5FF0209A9FE1224B6E5549BE49C7BCAF575
                  93D6F85EACE2FB47C7ECFD2FE1F5FE157A7F8202000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000009EA1A503E2E9F210D0DAE91C
                  BDCBE129ACBCD8369CADCF448E9FC8508192C05D7485B86A6778B0765A6AA784
                  4F5D9F914452979D3A468FA9303A87B5272F7FC31E2578CF151B6EDD080957F2
                  020049FE010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF01004AFF01014AFF02014AFF02024BFF02024BFF02034CFF02034DFF
                  02044DFF02054EFF02054EFF03064FFF020650FF020751FF020852FF020953FF
                  020955FF030A57FF030B59FF030C5AFF030C5CFF030D5EFF030E60FF030F62FF
                  040F64FF031066FF041167FF041169FF04126BFF04126DFF03136EFF03146FFF
                  031471FF031472FF031574FF041575FF031676FF031778FF031779FF03177AFF
                  04177BFF03177CFF04177DFF04177EFF031780FF041680FF031681FF031682FF
                  031583FF031584FF031485FF041485FF031386FF031387FF031287FF031288FF
                  031289FF03118AFF03108AFF030F8BFF020E8CFF020E8FFF020E93FF020D96FF
                  020C9AFF010B9DFF010AA1FF0209A5FF0108A8FF0107ACFE0A16B5F04F96E4A2
                  79CBF67891D7FA60ABE3FC48C7EEFD2EE2F4FC124F5253010000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000006D6F7202E5EBF30ED2DDEB1BC0CDE228
                  AFBED9359EAFD0428FA0C84F8293C15C7485B8696778B0755B6BA7834F5DA090
                  4451979D3A458FAA303986B6262E7EC31D2476D0141A6DDE070856F3020049FE
                  010049FF010049FF020049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF02014AFF01014AFF02014AFF02024BFF02024CFF
                  02034CFF02034DFF02044DFF03054EFF02054EFF02064FFF020650FF020752FF
                  020853FF020855FF020957FF030A58FF030B5AFF030B5CFF030C5EFF040C5FFF
                  030D61FF030E63FF040E65FF040F67FF041069FF03106AFF03116CFF03116DFF
                  03126FFF031270FF031271FF031373FF031374FF031375FF031376FF041478FF
                  031479FF03147AFF04147BFF04147CFF04137DFF03137EFF03137FFF031380FF
                  031381FF031282FF031282FF031283FF031184FF031185FF031086FF021086FF
                  020F87FF020E88FF020D88FF030D89FF020C8BFF020C8EFF020B92FF010B96FF
                  010A99FF01099CFF0108A0FF0207A4FF0107A8FF0106ACFF0106AFFE0913B7F3
                  4C96E6A576CCF87B91D9FB60ACE4FD47CBEEFE2BCEDDE40F0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000E0E6EC0BD6DFEC18C3D0E325B1C1DA33
                  A0B1D24092A3CA4D8495C15A7687B9676879B1745C6CA881505FA08F4552989C
                  3A468FA9303A86B6272F7EC31D2476D014196BDF070856F3010049FE010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF01004AFF01004AFF01014AFF02014AFF
                  02024BFF02024CFF02034CFF03034DFF02044DFF02054EFF02054FFF020550FF
                  020652FF020753FF020755FF030857FF020959FF02095AFF030A5CFF030B5DFF
                  030B5FFF030C61FF030C63FF040D65FF030D67FF030E68FF030F6AFF030F6BFF
                  030F6CFF03106EFF03116FFF031170FF031172FF031173FF031174FF031175FF
                  031277FF031278FF031279FF03127AFF03127BFF03117CFF03117DFF02117EFF
                  02117FFF021080FF021080FF030F81FF020F82FF020E83FF020E84FF020D85FF
                  020D86FF020C87FF020B87FF030B88FF020A89FF02098DFF010991FF010894FF
                  010898FF01079BFF01079FFF0206A3FF0106A7FF0105ABFF0104AFFF0104B2FE
                  0913BBF34993E7A976CEF97B92DBFD60AFE6FE44D0F0FE26D1DEE40A00000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000CBCFD507DCE4EF14C8D5E622B6C5DD2FA5B5D43D
                  95A6CB4A8798C3577889BA656B7CB2725E6FAA7F5261A28D4754999A3C4890A8
                  323B88B428307FC11E2577CF151B6DDD080957F2010049FE020049FF010049FF
                  020049FF010049FF020049FF020049FF020049FF010049FF020049FF010049FF
                  010049FF020049FF010049FF020049FF010049FF020049FF01004AFF02014AFF
                  01014AFF02024BFF02024BFF02024CFF03034CFF02034DFF02044DFF02054FFF
                  020550FF020552FF020653FF030655FF020757FF02075AFF02085EFF020862FF
                  020766FF02086AFF02086FFF030773FF030776FF030777FF030778FF03087AFF
                  03087BFF03097CFF02097DFF020A7BFF020B7AFF020C79FF020D78FF020E77FF
                  020F76FF020F76FF020F77FF030F78FF020F79FF020F7AFF020F7BFF020E7CFF
                  030E7DFF020E7EFF020D7FFF030D80FF020D81FF020C82FF020C82FF030B83FF
                  020B84FF020A85FF020986FF030987FF020888FF02088CFF020790FF010793FF
                  010797FF02069BFF01069FFF0205A3FF0104A6FF0203ABFF0103AEFF0203B2FF
                  0102B6FE0A15C0F24D9DECA678D1FB7A96DDFD5CB5E8FE3FD7F2FE208A929505
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000095989C03E2E9F20FCFDAE91DBBCAE02BAABAD6399AABCE46
                  8A9BC6537D8EBD616E7FB46E6171AB7C5564A38A49579B973E4B92A4343E89B2
                  2A3281BF202779CC161C6FDB0A0B5AF0020049FE020049FF020049FF020049FF
                  020049FF020049FF020049FF020049FF020049FF020049FF020049FF020049FF
                  020049FF020049FF020049FF020049FF020049FF020049FF020049FF02014AFF
                  02014AFF02014AFF02014AFF02024BFF02024BFF03034CFF03034CFF02034DFF
                  020451FF020459FF020462FF02036BFF020375FF02037CFF02027FFF020283FF
                  020286FF020288FF020289FF02028AFF02028BFF02028CFF02028DFF02028EFF
                  02028FFF02028FFF020390FF020391FF020392FF020393FF020391FF020491FF
                  02058FFF02058DFF020788FF020983FF020A7FFF020C7BFF020C7AFF030C7AFF
                  030C7BFF030B7CFF030B7DFF030B7EFF030A7FFF030980FF030981FF030982FF
                  030883FF030884FF030785FF030785FF030687FF02068BFF02068FFF020693FF
                  020596FF02059AFF02049EFF0203A2FF0203A6FF0203AAFF0202AEFF0202B2FF
                  0201B6FF0201BAFF0F1FC7EC55ADF39D7DD5FD759CDFFE57BDEAFE38E0F5FE16
                  3C3E400100000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000DFE5EB0BD7E0EC18C2D0E326AFBFD9349FB0D0428FA0C84F
                  8192C05C7384B76A6575AE785968A5864C5A9D93414E95A136418CAE2C3583BC
                  22297ACA181E71D70D0F60EA02004AFE010049FF010049FF010049FF010049FF
                  010049FF010049FF020049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF01004AFF01004AFF02014AFF02014AFF020154FF020261FF02026EFF
                  02027AFF01027FFF010182FF020283FF010184FF010185FF010186FF010187FF
                  010289FF01028BFF02038DFF020490FF010491FF010592FF010593FF010594FF
                  010595FF010696FF010696FF020696FF010596FF010495FF010294FF010395FF
                  010296FF010296FF010397FF020398FF010398FF020396FF020592FF02068AFF
                  020783FF02097DFF02097CFF03087DFF02087EFF02087FFF020780FF020781FF
                  020682FF020683FF020683FF020584FF020586FF02058AFF02058EFF010492FF
                  010496FF010399FF01039EFF0203A1FF0102A5FF0102AAFF0101AEFF0101B1FF
                  0101B5FF0100B9FF0100BEFF152FCFE561C6FB9083D6FE6FA3E1FE50C7EDFE2E
                  DBE9EF0B00000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000969A9E05DEE6F013CAD6E720B7C6DD2EA5B5D43D95A6CB4A8697C358
                  7889BA656A7AB1735D6CA881505E9F8F4552979C3A458EAA2F3885B8252C7CC6
                  1B2174D4101466E503024CFC020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF01004BFF010056FF020166FF010176FF01017DFF01017FFF010180FF
                  010282FF010283FF010286FF02038AFF01048FFF010592FF020696FF02089AFF
                  030A9CFF040C9EFF040EA0FF0510A1FF0A17A5FF0B19A7FF0B1AA8FF0B1AA9FF
                  0B1CAAFF0A1CAAFF0617A9FF0516A9FF0417A9FF0417A9FF0317AAFF0214A8FF
                  0211A6FF020FA3FF010BA0FF02079DFF01049BFF01039BFF01039BFF01029CFF
                  01039CFF02039CFF020493FF020589FF02067FFF02067EFF02067FFF020580FF
                  020581FF020582FF020583FF020483FF010485FF010489FF01038DFF010391FF
                  010395FF010299FF01029DFF0202A1FF0101A5FF0101A9FF0101ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF2451DCD468CCFD8A8AD9FE68ADE5FE46
                  D5F1FE2170757802000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  56585B01E6ECF40DD3DDEB1ABFCDE228ADBCD8379CADCF448C9DC6527E8FBD60
                  6F80B46D6271AB7B5563A28A49569A983E4991A5333C88B329307FC11E2577CF
                  14186BDF050551F8010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF020049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF01004AFF010052FF
                  010064FF010175FF01017CFF02027DFF01017EFF010281FF010285FF01028BFF
                  01038FFF030695FF080D9BFF0C14A0FF1521A7FF1F2EAEFF2739B5FF2B40B9FF
                  3048BDFF334DC0FF3653C3FF3654C4FF3553C4FF3453C4FF3353C4FF3353C5FF
                  3253C5FF3153C5FF3053C5FF2F53C6FF2B4EC3FF274AC2FF2345C0FF1E3FBEFF
                  1838BBFF102FB8FF0927B5FF0623B4FF0320B2FF021AAEFF0214AAFF020CA4FF
                  0207A0FF01049FFF01029FFF0203A0FF01039FFF020495FF020589FF010582FF
                  010480FF010481FF020482FF020383FF010384FF010288FF01028CFF010290FF
                  010294FF010198FF01019CFF0201A0FF0100A4FF0100A9FF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0306C7FD3985EBBC71D0FE8194DCFE5E
                  BBEAFE39D5E6ED10000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  9A9DA106DDE5F013C9D6E621B6C5DD30A4B4D33D93A4CA4C8495C2597687B867
                  6878AF755B6AA6834E5C9E92424F95A037428CAD2D3583BB23297AC9181E71D8
                  0A0B5AEF020049FE010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF01004CFF010059FF01016CFF010179FF
                  01017BFF01017CFF010280FF020286FF01028CFF030593FF0B0F9BFF151EA3FF
                  2433AFFF2E41B7FF364CBEFF3A52C2FF3851C1FF354EC1FF334DC1FF324CC1FF
                  304BC1FF2E4BC0FF2D4AC0FF2C49C0FF2B49C1FF2A49C1FF2A4AC2FF294BC2FF
                  284AC2FF284AC2FF284BC3FF274CC4FF274DC4FF274DC4FF274EC5FF274FC6FF
                  2751C7FF2851C8FF2752C8FF244EC7FF1E48C4FF1840C1FF0F34BDFF082CBAFF
                  0425B8FF021EB2FF0216ADFF020BA6FF0104A2FF0104A2FF0106A3FF01089EFF
                  010792FF010486FF010281FF020282FF010183FF010188FF01018CFF010190FF
                  010194FF010197FF01009CFF0200A0FF0100A4FF0100A9FF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0A25D0F34EAFF6A47CD4FE76
                  A3E1FE50D0F0FE2572787A040000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  E7EDF40CD4DEEB1AC0CEE228ADBDD8369CADCF448C9DC6527D8EBD606E7FB46E
                  6171AB7C5463A28A485599993C4890A7323A87B5272E7EC31D2375D1101465E4
                  02014BFD010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF01004CFF02005DFF010170FF010178FF010179FF01017DFF
                  010284FF01028CFF040592FF11179DFF222DABFF3243B7FF384CBDFF3A50C0FF
                  374EC0FF344BBFFF3149BEFF2F47BEFF2C45BDFF2B44BDFF2943BDFF2843BDFF
                  2642BDFF2541BDFF2441BDFF2340BDFF2240BEFF2240BEFF2141BFFF2140C0FF
                  2041C0FF2042C0FF2043C1FF2043C2FF2045C2FF2046C3FF2047C4FF2048C5FF
                  2149C5FF214AC6FF214CC7FF214DC8FF224FC8FF2250C8FF2251C9FF204FC9FF
                  1C4BC7FF1441C4FF0B35BFFF042CBCFF0225B7FF021AB0FF020FA8FF010AA5FF
                  020CA6FF020DA4FF020B99FF020589FF010183FF010187FF01018BFF01008FFF
                  010093FF010097FF01009CFF0200A0FF0100A4FF0100A9FF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0212CBFE1C59DEDD62C7FC91
                  8BD9FE67B8E8FE3CC8D9E1100000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000999CA004
                  E0E8F111CCD7E71FB8C6DE2EA5B6D43C95A6CB4A8596C2587788B9666879B074
                  5B6AA7834F5C9E91424F94A037418CAE2D3483BB22297AC9181D70D9060551F7
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF020049FF020049FF010049FF010049FF010049FF010049FF
                  01004BFF01005CFF010170FF020177FF010178FF01017EFF010188FF02028EFF
                  0D1199FF242EABFF3647BAFF3B4EBEFF394EBFFF354ABEFF3247BDFF2F44BCFF
                  2C42BBFF2A40BBFF273EBAFF243CBAFF233BBAFF213ABAFF203ABAFF1F39BBFF
                  1E38BAFF1C37BBFF1C37BBFF1B37BBFF1B37BCFF1A38BCFF1A38BDFF1A39BDFF
                  193ABEFF193BBEFF193BBFFF193CC0FF193EC0FF1A3FC2FF1A40C2FF1B42C4FF
                  1B43C4FF1B44C5FF1C46C6FF1C47C7FF1C49C7FF1C4BC8FF1D4DC8FF1D4EC9FF
                  1E4FC9FF1E50CAFF1D51CBFF1B4FCAFF1244C6FF0939C2FF0330BFFF0329BAFF
                  021BB0FF0211A8FF0213A9FF0215A8FF020F9DFF02048CFF01008BFF01008FFF
                  010093FF010097FF01009CFF0200A0FF0100A4FF0100A9FF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0329D0FC3A96EFBB
                  73D1FE7FA0E0FE53D1F0FE244246480200000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000D7DCE208
                  D8E1ED17C4D1E425B0BFDA349FAFD0428FA0C8507F90BE5E7081B56C6272AC7A
                  5564A38949579A973D4991A5323B88B4282F7FC21D2376D00F1261E7020049FE
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF01004AFF010058FF
                  01016EFF010176FF010178FF02027FFF02028AFF050792FF1820A2FF3342B7FF
                  3D50BFFF394DBEFF3548BCFF3144BBFF2D41BAFF293EB9FF263BB8FF2439B8FF
                  2237B7FF1F34B7FF1D32B7FF1B31B7FF1A31B7FF1930B7FF172FB7FF162EB7FF
                  152EB7FF142FB8FF132FB8FF132FB9FF1330B9FF1231BAFF1232BBFF1233BBFF
                  1233BCFF1234BDFF1235BEFF1237BEFF1237BFFF1338C0FF133BC1FF143CC2FF
                  143EC3FF143FC3FF1541C4FF1643C5FF1745C6FF1746C7FF1748C8FF184AC8FF
                  184CC8FF194DC9FF194ECAFF1A50CBFF1A51CCFF1A52CCFF164ECBFF0D43C8FF
                  053AC5FF0334C1FF0325B6FF031AADFF031AADFF021CACFF02119FFF020393FF
                  010093FF010097FF01009CFF0200A0FF0100A4FF0100A9FF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0F50DBEE
                  57C1FB9C88D8FE6ABAE9FE3AA5B1B70B00000000000000000000000000000000
                  00000000000000000000000000000000000000000000000056585A01E6EBF30D
                  D1DCEA1CBDCBE12AAABAD73999AACE47899AC5557A8BBB636B7BB2725E6DA980
                  515FA08E4552979D39438DAB2E3684BA242A7BC8181E70D804044EF9020049FF
                  020049FF020049FF020049FF020049FF020049FF020049FF020049FF020049FF
                  020049FF020049FF020049FF020049FF020049FF020050FF020168FF020174FF
                  020277FF02027EFF02028BFF080B95FF202AA7FF3849BAFF3C4FBFFF3749BDFF
                  3244BBFF2D3FB9FF293BB8FF2538B7FF2235B6FF1F33B5FF1D30B5FF1A2EB5FF
                  182CB4FF162AB4FF1429B4FF1329B3FF1228B3FF1027B3FF0F26B4FF0E26B4FF
                  0D27B5FF0C27B5FF0C27B6FF0B27B6FF0B29B7FF0A29B8FF0A2BB8FF0B2CB9FF
                  0B2DBAFF0B2EBBFF0B31BCFF0B31BDFF0C32BDFF0D34BFFF0D35C0FF0D37C0FF
                  0E39C2FF0F3BC3FF103DC3FF113FC5FF1241C6FF1242C7FF1244C7FF1346C7FF
                  1448C8FF144AC9FF154BCAFF154CCBFF154ECBFF1650CCFF1751CDFF1752CEFF
                  1551CEFF0D48CBFF0541C9FF033BC5FF032CB9FF0222B1FF0221B0FF0220AEFF
                  020EA0FF020198FF02009CFF0200A0FF0200A4FF0200A9FF0200ADFF0200B1FF
                  0200B5FF0200B9FF0200BEFF0200C2FF0202C6FF0212CBFF0225D0FF0239D4FF
                  2E8FEDC970D0FE82A2E1FE50C1D9E41A00000000000000000000000000000000
                  00000000000000000000000000000000000000000000000070727504E0E7F111
                  CBD7E720B7C5DD2FA4B5D43D94A5CB4B8495C2597586B8686677AF765968A585
                  4C5A9D93404D93A2353F8AB02A3281BE202678CD0E1161E7020049FE010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF02004BFF01005CFF010170FF010174FF01017CFF
                  010188FF080A93FF212BA8FF3849BBFF3B4DBEFF3547BCFF3041BAFF2B3CB8FF
                  2638B6FF2234B5FF1F30B4FF1C2DB3FF192BB3FF1628B2FF1426B1FF1124B0FF
                  0F22B0FF0E21B0FF0C20B0FF0A20B0FF091FB1FF081EB1FF061EB1FF061FB2FF
                  051FB2FF051FB3FF0520B4FF0421B4FF0421B5FF0422B6FF0423B6FF0425B7FF
                  0427B8FF0529B9FF052ABAFF052BBBFF062DBDFF0730BEFF0731BEFF0833C0FF
                  0934C0FF0A36C1FF0B39C3FF0B3BC4FF0C3DC4FF0D3FC5FF0E41C6FF0E43C7FF
                  0F45C8FF1047C8FF1048C9FF1149CAFF124BCBFF124DCCFF124FCDFF1350CEFF
                  1352CEFF1353CFFF1252CFFF0C4CCDFF0545CCFF033FC7FF0330BBFF0227B4FF
                  0328B4FF021EACFF0207A0FF0200A0FF0100A4FF0100A9FF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0239D4FF
                  0B59DDF357C4FC9C8CD9FE66C6EDFE2E454A4C03000000000000000000000000
                  000000000000000000000000000000000000000000000000C1C5CA07DBE3EE15
                  C5D2E524B2C1DB33A0B0D1418FA0C84F8091BF5D7181B56C6372AC7A5564A389
                  49569A983D4991A6323B87B4272E7EC31B2173D3050550F7010049FF010049FF
                  010049FF010049FF020049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF02004FFF020166FF010172FF010177FF010184FF04058FFF
                  1D25A4FF3748BAFF3A4DBFFF3446BCFF2E3FB9FF2939B7FF2435B5FF2031B3FF
                  1D2DB2FF1929B1FF1627B0FF1323B0FF1021AEFF0D1EADFF0B1CAEFF0A1AAEFF
                  0719AEFF0618AEFF0518AEFF0317AEFF0218AFFF0219B0FF0219B0FF011AB1FF
                  011BB2FF011DB3FF021EB4FF0220B4FF0220B5FF0221B6FF0223B7FF0224B8FF
                  0227B9FF0228BAFF0229BAFF032ABCFF022BBCFF032CBDFF032EBEFF0330BFFF
                  0431C0FF0533C0FF0636C2FF0838C3FF073AC4FF083CC5FF093EC6FF0A40C7FF
                  0B42C8FF0C43C9FF0C46CAFF0D48CAFF0E49CBFF0F4BCCFF0F4DCDFF104ECDFF
                  1050CEFF1051CFFF1053D0FF1154D1FF0E53D1FF094ECFFF0448CEFF0341C7FF
                  0332BBFF032EB7FF032BB5FF0212A9FF0100A5FF0100A9FF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0239D4FF
                  024BD8FF309AF0C775D2FE7CB1E6FE42939EA40A000000000000000000000000
                  000000000000000000000000000000000000000000000000D1D5DC0AD6DFEC18
                  C0CEE227AEBDD8369CADCF448C9DC6527C8DBD616D7DB3705F6FAA7E5261A18D
                  4653989B3A458FAA2F3785B9242B7CC7131666E1020049FE010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  010049FF010055FF01016DFF020273FF01017DFF02028AFF101599FF3341B5FF
                  3B4EBEFF3447BCFF2E3FB9FF2838B6FF2332B4FF1F2EB2FF1B2AB0FF1726AFFF
                  1322AEFF101FADFF0E1DADFF0B19ACFF0816ABFF0614ACFF0413ABFF0312ABFF
                  0314ACFF0314ADFF0215AEFF0217AFFF0118B0FF011AB1FF011BB1FF011CB2FF
                  011DB3FF011FB4FF0220B5FF0221B6FF0222B6FF0224B7FF0225B8FF0227B9FF
                  0228BAFF0229BBFF022BBCFF032CBDFF022DBDFF022EBEFF022FBFFF0331C0FF
                  0332C1FF0434C1FF0435C2FF0537C3FF0538C3FF0539C4FF053CC5FF063EC7FF
                  0740C8FF0842C9FF0944CAFF0A47CBFF0B48CCFF0C49CCFF0C4BCDFF0D4ECEFF
                  0D4FCEFF0E50CFFF0E52D0FF0E53D1FF0E54D1FF0D55D2FF0B53D2FF064ED1FF
                  034BD0FF033FC5FF0333BAFF0334BAFF0221B2FF0202AAFF0100ADFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0239D4FF
                  024BD8FF0E6FE3EF5FC9FD939CDFFE57ADC1CA15000000000000000000000000
                  000000000000000000000000000000000000000085878801E5EBF30DD2DCEA1B
                  BDCBE12AAABAD63998A9CD478899C456798ABB646A7BB1735C6CA8814F5D9F90
                  4350969F37428DAD2C3583BC212879CB090A56F1010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF010049FF010049FF
                  01005CFF010170FF020275FF020284FF05068FFF232EA9FF3C4FBEFF3649BDFF
                  2F41B9FF2838B6FF2331B3FF1E2CB1FF1A27AFFF1623AEFF121FADFF0E1BABFF
                  0B18ABFF0815AAFF0511AAFF030FAAFF030FAAFF0311ABFF0212ACFF0213ACFF
                  0215ADFF0216AEFF0218AFFF0219B0FF011AB1FF011BB2FF011CB2FF011EB3FF
                  021FB4FF0220B5FF0221B6FF0323B7FF0224B7FF0226B9FF0228BAFF0228BAFF
                  022ABBFF022BBCFF022CBDFF032DBEFF022FBEFF0330BFFF0331C0FF0433C1FF
                  0434C1FF0436C2FF0437C3FF0538C4FF0439C5FF043BC5FF043CC6FF043DC7FF
                  043FC8FF0440C9FF0642CAFF0846CCFF0948CCFF0949CDFF0A4BCEFF0A4DCFFF
                  0B4ED0FF0B4FD0FF0C51D1FF0C52D1FF0C53D2FF0B54D3FF0B55D4FF0A55D4FF
                  0753D4FF0451D3FF044BCFFF043DC0FF033BBDFF032EB9FF0208AFFF0100B1FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0239D4FF
                  024BD8FF0461DEFC3CACF5B986D8FE6CCFF0FE23000000000000000000000000
                  000000000000000000000000000000000000000085878802E4EAF20FCFDAE91D
                  BAC8DF2DA7B7D53B96A7CB4A8697C3587788B9666878B0755A69A6844D5B9E93
                  414D95A135408BB02A3281BF1C2171D303024CFB010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF010049FF01004BFF010161FF
                  010170FF010179FF020289FF0F1398FF3342B6FF394CBEFF3143BAFF2A3AB7FF
                  2432B4FF1E2BB1FF1A26AFFF1621ADFF111CABFF0D18AAFF0914AAFF0511A9FF
                  030EA8FF020DA8FF020EA9FF0310AAFF0211ABFF0213ACFF0214ADFF0215ADFF
                  0217AFFF0118AFFF0119B0FF021AB1FF011BB2FF011DB3FF011EB3FF0220B4FF
                  0220B5FF0222B6FF0323B7FF0325B8FF0227B9FF0228BAFF0329BBFF022ABBFF
                  022BBCFF022CBDFF022EBEFF032FBFFF0330C0FF0332C0FF0433C1FF0435C2FF
                  0436C2FF0437C3FF0538C4FF053AC5FF043BC6FF043CC6FF043EC7FF033FC8FF
                  0440C9FF0441CAFF0543CBFF0645CCFF0647CDFF0748CDFF084ACEFF094CCFFF
                  094ED0FF0A4FD1FF0A51D2FF0B52D3FF0A53D3FF0A54D4FF0955D5FF0856D5FF
                  0856D6FF0656D6FF0455D6FF0454D5FF0347C8FF0440C0FF043ABFFF020EB4FF
                  0100B5FF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0239D4FF
                  034BD8FF035FDEFF1C8DEBDE72D1FE80BFEAFE33888A8B010000000000000000
                  0000000000000000000000000000000000000000A0A2A403E1E8F111CCD8E81F
                  B7C6DD2EA4B5D43D94A5CA4C8495C15A7586B8686576AF775868A6864B599D95
                  3F4C93A4343E89B229317FC1131664E1010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF010049FF01004CFF010164FF010170FF
                  01017CFF03038CFF1B23A2FF384ABBFF3548BCFF2D3EB8FF2635B5FF202DB1FF
                  1B27AFFF1621ADFF111BABFF0C17AAFF0812A8FF040EA7FF020CA7FF020CA8FF
                  020DA8FF020EAAFF0210AAFF0312ABFF0213ACFF0214ADFF0216AEFF0217AFFF
                  0119B0FF011AB1FF011BB2FF021CB2FF011DB3FF011FB4FF0220B5FF0221B6FF
                  0222B6FF0224B7FF0325B8FF0327B9FF0228BAFF0329BBFF022BBCFF022CBCFF
                  022DBEFF022EBEFF022FBFFF0331C0FF0332C1FF0434C1FF0435C2FF0536C3FF
                  0438C3FF0439C4FF043AC5FF043BC6FF043DC7FF033EC7FF033FC8FF0440C9FF
                  0442CAFF0543CBFF0545CCFF0646CDFF0648CEFF0649CFFF074BCFFF084DD0FF
                  084ED1FF0950D1FF0951D2FF0953D4FF0954D4FF0955D5FF0856D5FF0857D6FF
                  0757D7FF0657D7FF0457D7FF0457D8FF0357D8FF034FCEFF0446C3FF0441C2FF
                  0215BAFF0100B9FF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0239D4FF
                  024BD8FF035FDEFF0B7BE5F459C3FB9AAEE5FE43A2A6A7030000000000000000
                  0000000000000000000000000000000000000000F0F4F804DFE7F012CBD7E720
                  B6C4DC30A3B4D33E92A3CA4D8394C15C7385B8696475AE795666A4894A579C97
                  3E4A92A5333C88B3262E7DC40A0A56F0010049FF010049FF010049FF010049FF
                  010049FF010049FF010049FF020049FF01004CFF010164FF010170FF01017FFF
                  04058EFF242FAAFF384BBDFF3143BAFF2A3AB7FF2230B3FF1C29B0FF1622ADFF
                  121BABFF0D16A9FF0811A8FF040CA7FF020BA6FF010CA7FF020DA8FF020EA9FF
                  020FAAFF0211ABFF0212ABFF0314ACFF0215ADFF0216AEFF0218AFFF0119B0FF
                  011AB1FF011BB2FF011CB3FF021EB3FF011FB4FF0220B5FF0221B6FF0222B7FF
                  0224B7FF0226B9FF0227BAFF0329BAFF022ABBFF022BBCFF022CBDFF022EBEFF
                  022FBFFF0230BFFF0331C0FF0433C1FF0434C1FF0535C2FF0437C3FF0438C4FF
                  0539C4FF043BC5FF043CC6FF043DC7FF043FC8FF0440C9FF0441CAFF0442CAFF
                  0544CBFF0646CCFF0647CDFF0648CEFF064ACFFF064BD0FF074CD0FF074DD1FF
                  084FD2FF0851D2FF0953D3FF0954D4FF0955D5FF0957D5FF0857D6FF0857D7FF
                  0758D7FF0658D7FF0559D8FF055AD9FF045AD9FF035ADAFF0355D3FF044CC7FF
                  0447C5FF0217BEFF0100BEFF0200C2FF0102C6FF0112CBFF0125CFFF0239D4FF
                  024BD8FF035FDEFF0474E2FD3EB2F6B89EE0FE53F2FBFE050000000000000000
                  0000000000000000000000000000000000000000F0F4F804DFE6F013CAD6E721
                  B5C4DC30A1B2D24091A2C94E8394C15C7284B86A6374AD7A5665A48949579B98
                  3D4991A6323B88B5232A79C903024CFB020049FF020049FF020049FF020049FF
                  020049FF020049FF020049FF02004AFF020164FF020170FF020281FF06078FFF
                  2A37AFFF374ABCFF2E40B9FF2636B5FF1F2CB1FF1925AEFF131DABFF0D17A9FF
                  0911A8FF040CA7FF020AA6FF020BA6FF020CA7FF020DA8FF020EA9FF030FAAFF
                  0311ABFF0313ACFF0314ADFF0215AEFF0216AFFF0218B0FF0219B0FF021AB1FF
                  021CB2FF021DB3FF021EB4FF0220B5FF0220B5FF0221B6FF0323B7FF0325B8FF
                  0327B9FF0328BAFF0329BBFF032ABCFF032BBCFF032DBDFF032EBEFF032FBFFF
                  0330C0FF0332C0FF0434C1FF0435C2FF0536C2FF0537C3FF0539C4FF053AC5FF
                  053BC6FF043CC6FF043EC7FF043FC8FF0440C9FF0441CAFF0542CBFF0545CCFF
                  0646CDFF0647CEFF0649CEFF064ACFFF074CD0FF074DD1FF074DD1FF084FD2FF
                  0851D3FF0853D4FF0954D4FF0956D5FF0957D6FF0958D6FF0858D7FF0859D8FF
                  0759D8FF065AD9FF055BD9FF055CDAFF045CDAFF045DDBFF035EDBFF035BD7FF
                  0452CAFF044CC8FF0217C2FF0200C2FF0202C6FF0212CBFF0225D0FF0239D4FF
                  034BD8FF035FDEFF0473E2FF249FF0D58FDAFE62ECF9FF080000000000000000
                  0000000000000000000000000000000000000000F0F4F804DEE6F013C9D6E721
                  B5C4DC30A1B2D24091A2C94F8294C15C7384B76A6272AC7B5564A48A49579B98
                  3D4991A6313A87B61B206ED3020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF01004AFF020162FF010170FF010182FF070991FF2E3CB3FF
                  3547BCFF2C3CB7FF2432B3FF1C29AFFF1621ACFF101AAAFF0A12A8FF050CA6FF
                  0209A5FF020AA6FF010CA7FF020CA8FF020DA9FF020EAAFF0210AAFF0212ABFF
                  0213ACFF0215ADFF0215AEFF0217AFFF0119B0FF011AB1FF011BB2FF011CB2FF
                  011DB3FF021FB4FF0220B5FF0221B6FF0222B6FF0223B7FF0226B8FF0227B9FF
                  0228BAFF0229BBFF032ABCFF032CBDFF022DBDFF022FBEFF022FBFFF0330C0FF
                  0333C1FF0434C1FF0435C2FF0536C3FF0538C4FF0439C4FF043AC5FF043CC6FF
                  043CC7FF043EC8FF043FC8FF0441C9FF0441CAFF0543CBFF0545CCFF0546CDFF
                  0648CEFF0649CFFF064BCFFF074CD0FF074DD1FF084ED1FF0850D2FF0751D3FF
                  0853D4FF0955D5FF0957D5FF0958D6FF0959D7FF095AD8FF095BD8FF085BD9FF
                  075CD9FF075CDAFF075EDBFF065EDBFF055FDBFF0560DCFF0461DCFF0360DDFF
                  035ED9FF0457CDFF0450CBFF0212C5FF0102C6FF0112CBFF0125CFFF0239D4FF
                  024BD8FF035FDEFF0373E2FF1393EBEB7ED3FD73EBF8FE0A0000000000000000
                  0000000000000000000000000000000000000000F0F4F804DEE6F013CAD6E721
                  B5C4DC30A1B2D24091A2CA4E8294C15C7384B76A6273AC7B5565A48A49579B98
                  3D4A91A6313A87B6141763E0020049FF010049FF010049FF010049FF010049FF
                  010049FF010049FF02005EFF02016FFF010182FF070A91FF2C3AB2FF3345BBFF
                  2A3AB7FF222FB2FF1A26AEFF141EABFF0E16A9FF070FA7FF030AA5FF0109A5FF
                  010AA6FF010CA7FF020DA8FF020EA9FF020FAAFF0210ABFF0312ACFF0214ACFF
                  0215ADFF0216AEFF0118AFFF0219B0FF011AB1FF011BB2FF011CB3FF011EB3FF
                  0220B4FF0220B5FF0321B6FF0323B7FF0224B8FF0226B9FF0228BAFF0229BBFF
                  022ABBFF022BBCFF032CBDFF032EBEFF022FBFFF0230BFFF0331C0FF0333C1FF
                  0434C2FF0435C2FF0537C3FF0538C4FF0439C5FF043BC5FF043CC6FF043DC7FF
                  033FC8FF0440C9FF0441C9FF0542CAFF0544CBFF0546CCFF0647CDFF0648CEFF
                  064ACFFF074BD0FF074DD0FF074DD1FF084FD2FF0750D3FF0852D3FF0854D4FF
                  0955D5FF0957D5FF0A58D6FF0A59D7FF0A5BD8FF0A5CD9FF0A5DD9FF0A5EDAFF
                  0A5FDAFF0960DBFF0861DCFF0861DCFF0762DDFF0662DDFF0662DDFF0463DEFF
                  0363DEFF0361DBFF045DCFFF0451CDFF020EC8FF0112CBFF0125CFFF0239D4FF
                  024BD8FF035FDEFF0473E2FF088BE8F86BCBFA86E9F8FE0A0000000000000000
                  0000000000000000000000000000000000000000D5D8DB04E0E7F012CBD7E720
                  B5C4DC30A3B4D33F92A4CB4D8294C15C7385B86A6474AE795665A48949589B98
                  3D4A92A6313B88B60C0D58EC020049FF010049FF010049FF010049FF010049FF
                  010049FF010058FF01016DFF020280FF060891FF2B39B1FF3244BAFF2938B6FF
                  202DB2FF1924AEFF121CABFF0B14A8FF050CA6FF0209A5FF0109A6FF010BA6FF
                  020CA7FF020DA8FF020EA9FF0310AAFF0211ABFF0213ACFF0214ADFF0215AEFF
                  0217AFFF0118B0FF0119B0FF021BB1FF011CB2FF011DB3FF011EB4FF0220B4FF
                  0221B5FF0222B6FF0223B7FF0325B8FF0227B9FF0228BAFF0229BBFF022ABCFF
                  022BBCFF022DBDFF022EBEFF032FBFFF0330C0FF0332C0FF0434C1FF0435C2FF
                  0436C3FF0438C3FF0539C4FF053AC5FF043BC6FF043CC7FF033EC7FF033FC8FF
                  0440C9FF0441CAFF0542CBFF0545CCFF0546CDFF0647CDFF0649CEFF064ACFFF
                  074CD0FF074DD1FF074ED1FF084FD2FF0851D3FF0852D4FF0854D4FF0956D5FF
                  0957D6FF0A58D7FF0A5AD7FF0A5BD8FF0A5CD9FF0A5EDAFF0C60DBFF0C62DBFF
                  0C63DBFF0B63DCFF0A64DCFF0964DDFF0964DEFF0765DEFF0665DFFF0665DFFF
                  0465DFFF0365E0FF0364DBFF0462D1FF044BCFFF0216CBFF0125CFFF0239D4FF
                  024BD8FF035FDEFF0373E2FF0488E7FE5AC2F897E9F8FE0A0000000000000000
                  000000000000000000000000000000000000000085878803E1E9F111CCD8E81F
                  B7C6DD2EA5B6D53D93A5CB4C8495C25B7486B8696576AE785766A5884A589C97
                  3E4B93A5323C88B406054FF6020049FF010049FF010049FF010049FF010049FF
                  010051FF01016BFF01017CFF03038DFF2835AEFF3243BAFF2837B6FF1F2CB1FF
                  1823ADFF111AAAFF0A12A8FF040BA6FF0208A5FF010AA6FF010BA7FF020CA8FF
                  020DA9FF020FAAFF0210ABFF0312ABFF0213ACFF0214ADFF0216AEFF0217AFFF
                  0119B0FF011AB1FF011BB1FF021CB2FF011DB3FF011FB4FF0220B5FF0221B5FF
                  0222B7FF0224B7FF0226B8FF0327B9FF0228BAFF0229BBFF022BBCFF022CBDFF
                  022DBDFF022FBEFF032FBFFF0330C0FF0332C1FF0434C1FF0435C2FF0437C3FF
                  0438C4FF0539C4FF043AC5FF043BC6FF043DC7FF033EC8FF0340C8FF0441C9FF
                  0441CAFF0543CBFF0545CCFF0646CDFF0547CEFF0649CFFF064BD0FF074CD0FF
                  074DD1FF074ED1FF0850D2FF0851D3FF0853D4FF0855D5FF0957D5FF0958D6FF
                  0A58D7FF0A5AD7FF0A5BD9FF0A5DDAFF0A5FDAFF0C60DBFF0D63DBFF0E66DBFF
                  0E67DCFF0E68DCFF0D68DDFF0C68DEFF0B68DEFF0967DFFF0867E0FF0768E0FF
                  0667E0FF0468E1FF0368E1FF0367DCFF0467D3FF0343D0FF0126CFFF0239D4FF
                  024BD8FF035FDEFF0373E2FF0488E7FF47B8F4A9C7D2D6080000000000000000
                  000000000000000000000000000000000000000085878802E4EBF30FCFDAE91D
                  BAC8DF2DA7B8D63C95A7CC4A8597C3597688B9686677AF765868A6864B5A9E95
                  3F4C94A4333D89B4020049FE020049FF010049FF010049FF010049FF01004BFF
                  010166FF010177FF01018AFF202AA8FF3244BAFF2837B6FF1F2CB1FF1822ADFF
                  1019AAFF0811A7FF0309A5FF0209A5FF010AA6FF010CA7FF020DA8FF020EA9FF
                  020FAAFF0211ABFF0212ACFF0314ACFF0215ADFF0216AEFF0218AFFF0119B0FF
                  011AB1FF011BB2FF011CB3FF021EB3FF021FB4FF0220B5FF0221B6FF0223B7FF
                  0224B8FF0226B9FF0228BAFF0328BBFF022ABBFF022BBCFF022CBDFF022EBEFF
                  022FBFFF0230C0FF0331C0FF0333C1FF0434C2FF0436C2FF0437C3FF0438C4FF
                  0539C5FF043BC5FF043CC6FF043DC7FF033FC8FF0440C9FF0441CAFF0442CAFF
                  0543CBFF0546CDFF0647CDFF0648CEFF064ACFFF064BD0FF074CD0FF074DD1FF
                  074FD2FF0850D2FF0852D3FF0853D4FF0855D5FF0957D5FF0958D6FF0A59D7FF
                  0A5AD8FF0A5CD9FF0A5EDAFF0B5FDBFF0C61DBFF0D64DBFF0E66DBFF0E67DCFF
                  0F69DDFF106ADDFF106BDEFF0F6BDFFF0E6BDFFF0C6AE0FF0A6AE1FF096BE1FF
                  086AE2FF076BE2FF056AE2FF046AE3FF046ADBFF046AD5FF023CD2FF0239D4FF
                  024BD8FF035FDEFF0473E2FF0488E7FF3DB2F2B280878B060000000000000000
                  000000000000000000000000000000000000000085878801E6ECF30CD2DCEA1B
                  BDCCE12AAABBD73998AACE488899C556798ABB65697AB1745A6AA8844D5C9F93
                  414E95A12D3681BA010049FF020049FF010049FF010049FF010049FF01005DFF
                  010172FF020289FF151C9FFF3243BAFF2837B6FF1E2CB1FF1722ADFF0F19AAFF
                  070FA7FF0209A5FF0109A6FF020BA7FF020CA7FF020DA8FF020EA9FF0210AAFF
                  0211ABFF0213ACFF0214ADFF0215AEFF0217AFFF0118B0FF011AB1FF011BB1FF
                  011CB2FF011DB3FF011EB4FF0220B5FF0221B5FF0222B6FF0223B7FF0225B8FF
                  0227B9FF0228BAFF0229BBFF032ABCFF022CBCFF022DBDFF022EBEFF0231BFFF
                  0333C1FF0337C3FF043AC4FF043CC4FF0541C6FF0446C8FF0541C7FF043FC6FF
                  043FC7FF043FC7FF0440C8FF0440C8FF0440C9FF0441CAFF0542CBFF0545CBFF
                  0546CDFF0547CEFF0648CEFF064BCFFF064CD0FF074DD1FF074ED1FF084FD2FF
                  0851D3FF0852D4FF0854D4FF0856D5FF0957D6FF0958D7FF0A5AD7FF0A5BD8FF
                  0A5CD9FF0A5EDAFF0B60DBFF0D62DBFF0D65DBFF0E67DCFF0F68DCFF0F69DDFF
                  106ADEFF116CDEFF126EE0FF1270E0FF1070E0FF0F70E1FF0E6FE2FF0B6DE2FF
                  0A6DE3FF086DE3FF076DE4FF056DE4FF046CE4FF046FDAFF0468D7FF0340D4FF
                  024BD8FF035FDEFF0373E2FF0488E7FF2BABEFB67D868A040000000000000000
                  000000000000000000000000000000000000000000000000CFD4DA09D6E0EC18
                  C0CEE327ADBED9369CADD0458B9CC6547B8CBD636B7DB3725D6EAA814F5FA190
                  4352979F2A337CBF010049FF020049FF010049FF020049FF010050FF01016EFF
                  010183FF0B0E96FF2E3FB7FF2939B7FF1F2DB2FF1723AEFF0F19AAFF0710A7FF
                  0209A5FF010AA6FF020BA7FF020DA8FF020DA9FF020FAAFF0210ABFF0212ABFF
                  0213ACFF0314ADFF0216AEFF0217AFFF0119B0FF021AB1FF011BB2FF011CB2FF
                  011EB3FF021FB4FF0220B5FF0221B6FF0222B6FF0324B7FF0226B8FF0227B9FF
                  0228BAFF0229BBFF022BBCFF0332BFFF0340C5FF0355CDFF036CD5FF047BDBFF
                  0484DEFF058AE0FF058EE1FF058CE0FF0488DEFF0484DCFF057FD9FF057AD7FF
                  0474D4FF046CD1FF0464CFFF045BCDFF0553CBFF054BCAFF0548CBFF0547CDFF
                  0547CEFF0649CFFF064BCFFF074CD0FF074DD1FF074ED1FF0850D2FF0851D3FF
                  0853D4FF0855D4FF0957D5FF0958D6FF0958D7FF0A5AD7FF0A5BD8FF0A5DDAFF
                  0A5FDAFF0C60DBFF0D63DBFF0D66DCFF0E67DCFF0F68DDFF1069DDFF106ADEFF
                  116CDFFF126FE0FF1371E1FF1573E2FF1574E2FF1474E2FF1172E2FF0F72E3FF
                  0D71E3FF0B71E4FF0870E5FF0770E5FF046EE5FF0470E3FF0475DAFF035ED8FF
                  024CD8FF035FDEFF0473E2FF0488E7FF049BEBBA728189060000000000000000
                  000000000000000000000000000000000000000000000000C1C5CA06DCE4EF14
                  C5D2E524B1C1DB339FB1D1428FA0C9507F91C05F6F81B66F6071AC7D5362A38D
                  46559A9B29327BC0020049FF020049FF020049FF020049FF020164FF02027AFF
                  04058FFF2532AEFF2B3CB8FF2030B3FF1824AEFF0F1AABFF0710A8FF020AA6FF
                  020BA6FF020CA7FF020DA8FF020EA9FF030FAAFF0311ABFF0312ACFF0314ACFF
                  0215ADFF0216AEFF0218B0FF0219B0FF021AB1FF021BB2FF021DB3FF021EB4FF
                  0220B4FF0220B5FF0321B6FF0323B7FF0324B8FF0326B9FF0328BAFF0329BAFF
                  0333BFFF0351CBFF0378DAFF0494E5FF04A4EBFF05A6ECFF11A5E8FF25A5E2FF
                  37A6DEFF4BA9DBFF61ACD7FF67ACD6FF7AB0D3FF7DB0D2FF77ACD3FF68A4D3FF
                  609FD2FF4D94D2FF3585D1FF257ACFFF0F6ACDFF0560CAFF055BC8FF0554C7FF
                  054FC9FF064CCCFF064CD0FF074DD1FF074ED2FF0850D3FF0852D4FF0853D4FF
                  0856D5FF0957D5FF0958D6FF0A59D7FF0A5BD8FF0A5CD9FF0A5EDAFF0B5FDAFF
                  0C61DBFF0D64DBFF0E66DCFF0E68DCFF0F69DDFF106ADEFF106BDEFF116DDFFF
                  126FE0FF1471E1FF1573E2FF1675E3FF1776E3FF1878E4FF1677E4FF1377E4FF
                  1176E4FF0E74E5FF0C73E6FF0973E6FF0672E6FF0371E6FF0375E2FF0379DBFF
                  0357DAFF035FDEFF0473E2FF0488E7FF049BEBCB7282890A0000000000000000
                  0000000000000000000000000000000000000000000000006B6D7003E1E8F111
                  CBD7E820B7C5DE2FA4B5D43E93A4CB4C8395C25B7385B96A6375AF795666A589
                  49589D97272F77C4010049FF020049FF010049FF010055FF010170FF01028AFF
                  151DA0FF2D3EB8FF2233B4FF1927B0FF101CACFF0712A8FF020BA6FF010BA6FF
                  020CA7FF020DA8FF020EA9FF0310AAFF0211ABFF0213ACFF0214ADFF0215AEFF
                  0217AFFF0118B0FF011AB1FF021BB1FF011CB2FF011DB3FF011FB4FF0220B5FF
                  0221B5FF0222B6FF0223B7FF0325B8FF0227B9FF0229BAFF0242C5FF0378DBFF
                  03A3EBFF04B4F2FF0DB4EFFF34B5E5FF63B9DAFF91BED1FFABC2CCFFBBC5CAFF
                  C7C9C9FFCACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCDCDCDFFCECECEFFCFCFCFFF
                  D0D0D0FFD1D1D1FFCED0D2FFC3CBD2FFB3C2D3FF92AFD1FF6191CEFF3172C9FF
                  0B57C4FF054EC1FF054BC1FF064BC8FF074FD0FF0852D4FF0854D4FF0856D5FF
                  0957D6FF0958D6FF0959D7FF0A5BD8FF0A5CD9FF0A5EDAFF0B60DBFF0C61DBFF
                  0D64DBFF0E67DCFF0E68DCFF0F69DDFF106ADEFF116BDEFF116EDFFF1270E0FF
                  1472E1FF1573E2FF1675E3FF1877E3FF1979E4FF1A7AE4FF1A7CE5FF187BE5FF
                  157AE5FF1178E6FF0E77E6FF0B76E7FF0875E7FF0574E7FF0274E7FF047CDFFF
                  0473DDFF0360DEFF0373E2FF0488E7FF049BEBD17282890C0000000000000000
                  00000000000000000000000000000000000000000000000000000000DEE3EA0C
                  D1DCEA1CBCCBE12AAABAD73998AACE48879AC557778ABB66687AB2755A6BA984
                  4D5CA093293179C1010049FF020049FF01004AFF010165FF010180FF070993FF
                  2A3BB5FF2537B6FF1A2AB1FF121FACFF0813A9FF020BA6FF010CA7FF020DA8FF
                  020EA9FF020FAAFF0210ABFF0312ACFF0213ACFF0215ADFF0216AEFF0218AFFF
                  0119B0FF011AB1FF011BB2FF021CB2FF011EB3FF011FB4FF0220B5FF0221B6FF
                  0222B6FF0224B7FF0226B8FF0328BAFF0346C6FF0390E4FF03B8F4FF05BEF6FF
                  32BEEAFF77C0D9FFAFC4CCFFC1C6C8FFC7C7C7FFC8C8C8FFC9C9C9FFC9C9C9FF
                  CACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCECECEFFCFCFCFFFD0D0D0FFD1D1D1FF
                  D1D1D1FFD2D2D2FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FFD6D6D6FFCFD2D7FF
                  B9C5D5FF789ACEFF2963C3FF0546BCFF0542BCFF0646C3FF0853D0FF0958D6FF
                  0958D7FF0A5AD7FF0A5CD8FF0A5CD9FF0A5FDAFF0C60DBFF0D62DBFF0D65DCFF
                  0E67DCFF0E68DDFF0F69DDFF106ADEFF116CDFFF126EE0FF1371E1FF1472E2FF
                  1574E2FF1775E3FF1877E3FF1979E4FF1A7BE5FF1C7DE5FF1D7FE6FF1C7FE6FF
                  187DE7FF147CE7FF117BE7FF0E7AE7FF0A78E8FF0777E9FF0375E9FF0378E6FF
                  0484E0FF036ADFFF0473E2FF0488E7FF049BEBD17282890C0000000000000000
                  00000000000000000000000000000000000000000000000000000000CDD2D707
                  D9E2EE16C4D1E525B0C0DA349FB0D1438EA0C8517D90BF616D80B5705F70AC7F
                  5162A38E2B337ABF010049FF020049FF010055FF010173FF02028DFF1B26A7FF
                  283BB8FF1D2EB3FF1322AEFF0A16AAFF030DA7FF020CA7FF020DA8FF020EA9FF
                  0210AAFF0211ABFF0213ACFF0314ADFF0215ADFF0217AFFF0118AFFF0119B0FF
                  011AB1FF011BB2FF011DB3FF021EB4FF0220B4FF0220B5FF0221B6FF0223B7FF
                  0225B8FF0227B9FF023BC1FF038AE2FF03C5F9FF11C5F6FF4FC4E5FFA5C5CFFF
                  C5C6C7FFC7C7C7FFC7C7C7FFC8C8C8FFC8C8C8FFC9C9C9FFCACACAFFCBCBCBFF
                  CCCCCCFFCDCDCDFFCECECEFFCFCFCFFFCFCFCFFFD0D0D0FFD1D1D1FFD2D2D2FF
                  D3D3D3FFD4D4D4FFD5D5D5FFD5D5D5FFD6D6D6FFD7D7D7FFD8D8D8FFD9D9D9FF
                  DADADAFFDBDBDBFFD9DADBFFA7B7D4FF4771C4FF0E44B9FF0539B5FF0745C3FF
                  0957D4FF095CD8FF0A5DD9FF0B5FDAFF0C61DBFF0D63DCFF0D66DCFF0E68DCFF
                  0F68DDFF0F6ADEFF106BDEFF116DDFFF126FE0FF1371E1FF1473E2FF1674E3FF
                  1776E3FF1878E4FF197AE4FF1A7CE5FF1C7DE6FF1D7FE6FF1E81E7FF2083E8FF
                  1E83E8FF1B82E8FF1780E8FF127EE8FF0D7BE8FF0A7AEAFF0678EAFF0377EAFF
                  0482E4FF047FE1FF0373E2FF0488E7FF049BEBD17282890C0000000000000000
                  000000000000000000000000000000000000000000000000000000006C6E7102
                  E1E9F210CCD8E91FB8C6DF2EA6B6D53D93A6CB4C8396C25B7487BA6A6477B079
                  5668A7892E377DBA010049FF02004AFF010163FF010283FF060A94FF2A3DB8FF
                  2133B5FF1726B0FF0D1AABFF040FA8FF020CA8FF020DA8FF020EAAFF0210AAFF
                  0212ABFF0213ACFF0214ADFF0215AEFF0217AFFF0119B0FF011AB1FF011BB2FF
                  011CB2FF011DB3FF011FB4FF0220B5FF0221B6FF0222B6FF0224B7FF0225B8FF
                  022CBBFF0269D5FF02BCF6FF0BCBFAFF4DC8E7FFAAC6CEFFC7C7C7FFC7C7C7FF
                  C7C7C7FFC7C7C7FFC8C8C8FFC9C9C9FFCACACAFFCACACAFFCCCCCCFFCCCCCCFF
                  CDCDCDFFCECECEFFCFCFCFFFD0D0D0FFD1D1D1FFD1D1D1FFD2D2D2FFD3D3D3FF
                  D4D4D4FFD5D5D5FFD6D6D6FFD7D7D7FFD7D7D7FFD8D8D8FFD9D9D9FFDADADAFF
                  DBDBDBFFDCDCDCFFDDDDDDFFDEDEDEFFDFDFDFFFB2BDD7FF496DC2FF0A38B3FF
                  0435B4FF074DCBFF0A5ED9FF0C61DBFF0D64DCFF0E67DCFF0E68DCFF0F69DDFF
                  0F6ADEFF106CDEFF116DDFFF1270E0FF1372E1FF1573E2FF1675E3FF1777E3FF
                  1979E4FF1A7AE4FF1B7CE5FF1C7EE6FF1D80E6FF1E81E7FF2084E8FF2185E9FF
                  2387E9FF2187EAFF1B84E9FF1782EAFF117FE9FF0D7DEAFF097BEBFF0479EBFF
                  037DE9FF048BE3FF037AE3FF0488E7FF049BEBD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  E8EEF50BD5DEED19C0CEE328ADBDD9379BADD046899CC6557A8DBD646B7EB473
                  5C6FAB82313A7FB7010049FF020050FF010271FF01038DFF1A26A8FF2639B7FF
                  1A2BB3FF1020AEFF0713A9FF020DA8FF020EA9FF020FAAFF0211ABFF0212ABFF
                  0214ACFF0215ADFF0216AEFF0218AFFF0119B0FF011AB1FF011BB2FF011CB3FF
                  011EB3FF011FB4FF0220B5FF0221B6FF0222B7FF0224B7FF0226B9FF0236BFFF
                  0292E5FF03CCFCFF2FCCF1FF92C8D5FFC6C7C7FFC7C7C7FFC7C7C7FFC7C7C7FF
                  C7C7C7FFC8C8C8FFC9C9C9FFCACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCECECEFF
                  CFCFCFFFCFCFCFFFD0D0D0FFD1D1D1FFD2D2D2FFD3D3D3FFD4D4D4FFD5D5D5FF
                  D5D5D5FFD6D6D6FFD7D7D7FFD8D8D8FFD9D9D9FFDADADAFFDBDBDBFFDCDCDCFF
                  DCDCDCFFDDDDDDFFDEDEDEFFDFDFDFFFE0E0E0FFE1E1E1FFDFDFE1FF99A9D3FF
                  2C4FB8FF042BAEFF073DBDFF0C5FD7FF0E67DCFF0E68DDFF0F69DDFF106ADEFF
                  106CDFFF116EDFFF1270E0FF1472E2FF1574E2FF1675E3FF1877E3FF1979E4FF
                  1A7BE5FF1B7DE5FF1D7FE6FF1E80E7FF1F82E7FF2084E8FF2286E9FF2388EAFF
                  258AEBFF268CEBFF228AEBFF1C86EBFF1683EBFF1181EBFF0C7FEBFF067CECFF
                  037BECFF048AE6FF0487E4FF0488E7FF049BEBD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  95989C04DFE6F112CAD6E821B6C5DE30A3B4D43F91A4CA4F8195C25D7285B86C
                  6375AF7B353F81B2010049FF02005BFF01037FFF050995FF273AB6FF1F32B5FF
                  1525B0FF0B18ABFF030EA9FF020EA9FF020FAAFF0211ABFF0213ACFF0214ACFF
                  0215ADFF0216AEFF0118AFFF0219B0FF011AB1FF011CB2FF011DB3FF011EB4FF
                  0220B4FF0220B5FF0221B6FF0323B7FF0225B8FF0227B9FF0240C3FF02A9EEFF
                  08CDFBFF5DCAE4FFB8C7CAFFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC8C8C8FF
                  C9C9C9FFCACACAFFCBCBCBFFCCCCCCFFCCCCCCFFCDCDCDFFCECECEFFCFCFCFFF
                  D0D0D0FFD1D1D1FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FF
                  D7D7D7FFD8D8D8FFD9D9D9FFD9D9D9FFDADADAFFDBDBDBFFDCDCDCFFDDDDDDFF
                  DEDEDEFFDFDFDFFFE0E0E0FFE0E0E0FFE1E1E1FFE2E2E2FFE3E3E3FFE4E4E4FF
                  CED3DFFF6076C4FF0829ABFF0530B3FF0C5DD5FF0F6ADEFF106BDEFF116DDFFF
                  126FE0FF1371E1FF1473E2FF1574E3FF1676E3FF1878E4FF197AE4FF1A7BE5FF
                  1B7DE6FF1D7FE6FF1E81E7FF1F83E8FF2185E9FF2286E9FF2489EAFF258BEBFF
                  278DEBFF298FECFF278FECFF228BECFF1B88ECFF1585ECFF0F82ECFF0A7FECFF
                  037CEDFF0383EBFF0492E6FF048AE7FF049BEBD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000E7EDF40BD4DEEC1AC0CDE329ACBCD9389AABCF47899DC756798DBD64
                  6A7EB473384383AE01004AFF020169FF01058BFF111CA2FF253AB8FF1A2CB3FF
                  0F1FAEFF0612AAFF030EAAFF0310AAFF0212ABFF0313ACFF0214ADFF0215AEFF
                  0217AFFF0119B0FF021AB1FF021BB2FF021CB2FF011DB3FF021FB4FF0220B5FF
                  0221B5FF0322B6FF0323B7FF0325B8FF0227B9FF0349C7FF03B0F1FF0AC9F9FF
                  82C8D9FFC4C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC8C8C8FFC9C9C9FFC9C9C9FF
                  CACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCECECEFFCFCFCFFFD0D0D0FFD0D0D0FF
                  D1D1D1FFD2D2D2FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FFD7D7D7FFD7D7D7FF
                  D8D8D8FFD9D9D9FFDADADAFFDBDBDBFFDCDCDCFFDDDDDDFFDDDDDDFFDEDEDEFF
                  DFDFDFFFE0E0E0FFE1E1E1FFE2E2E2FFE2E2E2FFE4E4E4FFE4E4E4FFE5E5E5FF
                  E6E6E6FFE2E3E6FF919ED0FF0A27A9FF0426ACFF0D5AD2FF116DDFFF126FE0FF
                  1371E1FF1473E2FF1575E3FF1776E3FF1879E4FF197BE4FF1A7CE5FF1B7EE6FF
                  1D80E6FF1E81E7FF1F83E8FF2185E9FF2287EAFF2489EBFF258BEBFF278EECFF
                  2A8FECFF2B91ECFF2D93EDFF2991EDFF228DEDFF1A89EDFF1386EDFF0D83EDFF
                  067FEDFF037FEDFF0495E9FF048FE8FF049BEBD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000008D909403E0E7F111CCD8E820B7C6DF2FA4B5D43F93A6CB4D8296C35C
                  7387BA6B3D4787A802004FFF020377FF020793FF1F31B0FF1F33B6FF1425B1FF
                  0918ADFF0310AAFF0310ABFF0312ACFF0314ACFF0215ADFF0216AEFF0218AFFF
                  0219B0FF021AB1FF021BB2FF021CB3FF021EB3FF0220B4FF0220B5FF0321B6FF
                  0322B7FF0324B8FF0326B9FF0328BAFF0345C6FF03B3F2FF13C5F6FF9CC7D2FF
                  C7C7C7FFC7C7C7FFC7C7C7FFC8C8C8FFC8C8C8FFC9C9C9FFCACACAFFCBCBCBFF
                  CCCCCCFFCDCDCDFFCECECEFFCFCFCFFFCFCFCFFFD0D0D0FFD1D1D1FFCDD1D2FF
                  C5CFD4FFB6CBD6FF9AC1D8FF86BAD9FF7BB5DAFF7BB3D9FF7CB2D9FF88B5D8FF
                  9DBED8FFBCCCDAFFCDD4DBFFD7DADCFFDDDDDDFFDEDEDEFFDFDFDFFFE0E0E0FF
                  E1E1E1FFE1E1E1FFE2E2E2FFE3E3E3FFE4E4E4FFE5E5E5FFE6E6E6FFE7E7E7FF
                  E8E8E8FFE8E8E8FFE9E9E9FFB3BADAFF152BA9FF041FA7FF0E5CD2FF1372E1FF
                  1474E2FF1675E3FF1777E3FF197AE4FF1A7BE5FF1B7DE6FF1C7EE6FF1D80E7FF
                  1E82E7FF2084E8FF2286E9FF2388EAFF248AEBFF268CECFF288EECFF2A90ECFF
                  2C92EDFF2E94EEFF3097EEFF3098EFFF2893EEFF208EEEFF198AEEFF1186EEFF
                  0A83EEFF0380EEFF038FECFF0497E9FF049BEBD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000DDE2E909D8E1EE17C3D0E426AEBFDA369CAFD1458C9FC854
                  7C90C062424D8AA2010058FF020583FF07109AFF2238B6FF1A2DB5FF0F21AFFF
                  0514ABFF0211ABFF0213ACFF0314ADFF0215AEFF0217AEFF0118B0FF0119B0FF
                  011AB1FF011CB2FF021DB3FF021EB4FF0220B4FF0221B5FF0221B6FF0223B7FF
                  0225B8FF0227B9FF0228BAFF033BC2FF03A4ECFF15C1F3FF96C5D3FFC6C6C7FF
                  C7C7C7FFC7C7C7FFC8C8C8FFC9C9C9FFCACACAFFCACACAFFCBCBCBFFCCCCCCFF
                  CDCDCDFFCECECEFFCFCFCFFFD0D0D0FFC6CED2FFA6C8D7FF69B9DEFF3CABE2FF
                  189FE4FF0696E4FF0591E2FF058BE0FF0485DDFF0482DBFF057ED9FF057AD7FF
                  0476D5FF0673D3FF1978D2FF3F88D2FF70A1D5FFAFC3DAFFD4D9DFFFE1E1E1FF
                  E2E2E2FFE3E3E3FFE4E4E4FFE5E5E5FFE5E5E5FFE6E6E6FFE7E7E7FFE8E8E8FF
                  E9E9E9FFEAEAEAFFEAEAEAFFEBEBEBFFB1B7DAFF1A2BA8FF051FA8FF1265D8FF
                  1676E3FF1878E4FF197AE4FF1A7CE5FF1B7DE6FF1C7FE6FF1E81E7FF1F82E7FF
                  2084E8FF2286E9FF2388EAFF258BEBFF268DECFF288FECFF2A90ECFF2C92EDFF
                  2E95EDFF3197EEFF3399EFFF369CF0FF2F99EFFF2694EFFF1D8FEEFF158AEEFF
                  0E87EFFF0482EFFF0389EEFF049DEBFF049CEBD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000005F616302E4EBF30ED0DBEA1DBACAE12DA8B9D73C96A9CE4A
                  869AC55947528D9C010163FF02078CFF0F1CA3FF2137B8FF1629B3FF0A1CAEFF
                  0312ACFF0213ACFF0214ADFF0216AEFF0217AFFF0119B0FF011AB1FF011BB1FF
                  011CB2FF011DB3FF011FB4FF0220B5FF0221B5FF0222B6FF0224B7FF0226B8FF
                  0227B9FF0228BAFF022FBDFF0390E4FF0EBDF3FF87C4D6FFC6C6C7FFC7C7C7FF
                  C8C8C8FFC8C8C8FFC9C9C9FFCACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCECECEFF
                  CECECEFFCFCFCFFFB8CCD4FF74BFDEFF2FB0E6FF08A5EAFF049CE8FF048BE2FF
                  057BDDFF056BD8FF065FD4FF055AD4FF0658D3FF0658D3FF0658D3FF065AD4FF
                  065CD4FF0660D3FF0664D2FF0665D0FF0563CCFF0962C9FF3075CCFF79A0D4FF
                  C8D1DFFFE3E4E4FFE5E5E5FFE6E6E6FFE7E7E7FFE7E7E7FFE8E8E8FFE9E9E9FF
                  EAEAEAFFEBEBEBFFECECECFFEDEDEDFFEDEDEDFFACB0D8FF1220A3FF0626ACFF
                  1772E0FF197BE5FF1A7CE5FF1B7EE6FF1C7FE6FF1E81E7FF1F83E8FF2085E9FF
                  2287EAFF2389EAFF258BEBFF278DECFF298FECFF2B91EDFF2D93EDFF2F95EEFF
                  3198EEFF349AEFFF369CF0FF399FF1FF389FF1FF2D99F0FF2293EFFF1A8EEFFF
                  118AEFFF0785F0FF0385F0FF049FEDFF059EECD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000A2A5AA05DFE6F113C9D5E722B4C5DE31A2B4D440
                  91A5CB4F4D57909601026EFF020994FF182AADFF1D34B8FF1126B2FF0518AEFF
                  0214ACFF0215ADFF0216AEFF0218AFFF0119B0FF011AB1FF011BB2FF011CB2FF
                  011EB3FF021FB4FF0220B5FF0221B6FF0223B7FF0224B8FF0226B9FF0228BAFF
                  0228BAFF022ABBFF036AD5FF05B7F2FF66C0DDFFC4C6C7FFC7C7C7FFC8C8C8FF
                  C9C9C9FFCACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCDCDCDFFCECECEFFCFCFCFFF
                  C3CED2FF69BFE0FF1CB0EBFF05A9EDFF0493E5FF0572DAFF0455D1FF054BCEFF
                  0547CEFF0549CFFF064BD0FF064CD1FF074DD1FF074ED2FF074FD2FF0751D3FF
                  0852D4FF0754D5FF0857D5FF0858D6FF085AD5FF075CD1FF055ACAFF0556C4FF
                  1C60C5FF7498D2FFD7DBE4FFE7E7E7FFE8E8E8FFE9E9E9FFEAEAEAFFEBEBEBFF
                  EBEBEBFFECECECFFEDEDEDFFEEEEEEFFEFEFEFFFEEEEEFFF8C91CDFF07119CFF
                  0C3ABAFF1A7CE5FF1B7EE6FF1D80E7FF1E81E7FF1F83E8FF2185E9FF2287EAFF
                  248AEBFF258BEBFF278EECFF2990ECFF2B91EDFF2D94EDFF2F96EEFF3299EEFF
                  349BEFFF379DF0FF399FF1FF3CA1F2FF3FA3F2FF369EF1FF2A98F1FF1E92F0FF
                  158DF0FF0B88F0FF0285F1FF049DEFFF04A1ECD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000E1E6EC08D8E1EE17C3D1E526AFC1DB35
                  9DB1D244525D958F01047AFF030C99FF1C32B4FF1930B7FF0C21B1FF0316ADFF
                  0215ADFF0217AFFF0118B0FF0219B1FF011BB1FF011CB2FF011DB3FF011EB4FF
                  0220B4FF0221B5FF0222B6FF0323B7FF0225B8FF0227B9FF0228BAFF0229BBFF
                  022ABCFF033DC3FF04AAEEFF37B9E7FFBFC6C9FFC8C8C8FFC9C9C9FFC9C9C9FF
                  CACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCECECEFFCFCFCFFFCFCFCFFF9DC8D8FF
                  27B5EBFF05ACEEFF0591E5FF055ED4FF0448CCFF0445CCFF0547CDFF0548CEFF
                  064ACFFF064BD0FF064CD0FF074ED1FF074FD2FF0750D3FF0851D4FF0753D4FF
                  0855D5FF0857D6FF0858D6FF0959D7FF095AD8FF095CD8FF095DD9FF085CD4FF
                  0753C7FF054CBFFF255EC2FFA3B6DBFFE9E9E9FFEAEAEAFFEBEBEBFFECECECFF
                  EDEDEDFFEEEEEEFFEEEEEEFFEFEFEFFFF0F0F0FFF1F1F1FFEEEFF1FF555BB9FF
                  020A9AFF155FD2FF1D80E7FF1E82E7FF1F84E8FF2186E9FF2388EAFF248BEBFF
                  258CEBFF288EECFF2A90ECFF2C92EDFF2D94EDFF3097EEFF3299EFFF359BEFFF
                  389DF0FF3AA0F1FF3DA2F1FF40A4F2FF43A6F2FF3EA4F2FF319EF2FF2396F1FF
                  1990F1FF0E8CF1FF0386F1FF0399F0FF04A5EED17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000DDE3EA0CD4DEEC1ABFCEE329
                  ACBDDA395A649F87010683FF06129EFF1D36B7FF152CB5FF091FB0FF0216AEFF
                  0117AFFF0119B0FF011AB1FF021BB2FF011CB2FF011DB3FF021FB4FF0220B5FF
                  0221B6FF0222B6FF0224B7FF0326B8FF0227B9FF0228BAFF0229BBFF032BBCFF
                  022DBDFF0481DEFF0CAFEEFFA3C3CFFFC8C8C8FFC9C9C9FFCACACAFFCBCBCBFF
                  CCCCCCFFCDCDCDFFCDCDCDFFCECECEFFCFCFCFFFCACFD1FF70C1DFFF0BB0EFFF
                  05A1EBFF0466D7FF0444CBFF0544CBFF0546CCFF0547CEFF0549CFFF054ACFFF
                  064CD0FF064DD1FF074ED1FF074FD2FF0750D3FF0752D4FF0854D4FF0856D5FF
                  0857D6FF0958D7FF0959D7FF0A5BD8FF0A5DD9FF0A5ED9FF0A5FDAFF0B61DBFF
                  0C63DCFF0A5DD3FF064AC0FF0844BAFF6B8ACEFFE0E3E9FFECECECFFEDEDEDFF
                  EEEEEEFFEFEFEFFFF0F0F0FFF1F1F1FFF1F1F1FFF2F2F2FFF3F3F3FFDBDCEBFF
                  181B9FFF081DA6FF1D7DE4FF2084E8FF2186E9FF2389EAFF248BEBFF268DECFF
                  288EECFF2A90EDFF2C93EDFF2E95EEFF3198EEFF339AEFFF369CF0FF389EF0FF
                  3BA0F1FF3EA2F2FF41A4F2FF44A7F2FF47AAF2FF48AAF3FF39A2F3FF299BF2FF
                  1D94F2FF128FF2FF0588F2FF0394F2FF04AAEFD17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000006F727402E5EBF30ED0DBEB1D
                  BCCBE22C616BA980020889FF0817A2FF1D37B9FF1229B5FF051CB0FF0118AFFF
                  0119B0FF011AB1FF011BB2FF021DB3FF011EB4FF0220B4FF0220B5FF0221B6FF
                  0223B7FF0224B8FF0226B9FF0328BAFF0228BAFF022ABBFF022BBCFF022CBDFF
                  0346C7FF04A3EAFF51B7DFFFC9C9C9FFCACACAFFCACACAFFCBCBCBFFCCCCCCFF
                  CDCDCDFFCECECEFFCFCFCFFFD0D0D0FFC9CFD2FF5CBDE2FF06ADEFFF058EE4FF
                  044FCFFF0443CBFF0545CCFF0546CDFF0548CEFF0549CFFF064BD0FF064CD0FF
                  064DD1FF074ED2FF074FD2FF0851D4FF0852D4FF0854D5FF0856D5FF0857D6FF
                  0959D7FF095AD8FF0A5BD8FF0A5DD9FF0A5EDAFF0A60DAFF0C62DCFF0C64DCFF
                  0D66DCFF0D68DDFF0D65DAFF084EC6FF053CB7FF5677C8FFE1E3EBFFEFEFEFFF
                  EFEFEFFFF0F0F0FFF1F1F1FFF2F2F2FFF3F3F3FFF4F4F4FFF5F5F5FFF5F5F5FF
                  8A8BCCFF020395FF1656CAFF2287EAFF2389EBFF258BEBFF268DECFF298FECFF
                  2B91EDFF2D93EDFF2E96EEFF3198EFFF339AEFFF369CF0FF389FF1FF3CA1F1FF
                  3FA3F2FF42A5F2FF44A8F2FF48ABF3FF4BADF4FF4EAEF4FF41A8F3FF309FF3FF
                  2298F2FF1692F2FF078AF3FF0391F3FF04ACF0D17282890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000091949703E2E9F210
                  CEDAEA1F6871AF7E020A8FFF0B1CA6FF1B36BAFF0E27B4FF031BB0FF011AB1FF
                  011BB1FF011CB2FF011DB3FF021FB4FF0220B5FF0221B5FF0222B6FF0223B7FF
                  0225B8FF0227B9FF0328BAFF0329BBFF022ABBFF022CBDFF022DBDFF022EBEFF
                  0372D8FF09A7EBFFA8C4CFFFCACACAFFCBCBCBFFCCCCCCFFCDCDCDFFCECECEFF
                  CFCFCFFFCFCFCFFFD0D0D0FFD0D1D1FF62BDE1FF06ACEEFF0584E1FF0449CDFF
                  0544CBFF0445CCFF0546CDFF0548CEFF054ACFFF054BD0FF064DD1FF064DD1FF
                  074FD2FF0750D3FF0751D4FF0853D4FF0855D5FF0857D6FF0858D6FF0959D7FF
                  095AD8FF0A5CD8FF0A5DD9FF0A5FDAFF0A60DBFF0C63DCFF0C64DDFF0D66DDFF
                  0E68DDFF0E69DEFF0F6ADEFF0F6ADEFF0A53C9FF0537B4FF5573C6FFE7E9EDFF
                  F1F1F1FFF2F2F2FFF2F2F2FFF3F3F3FFF4F4F4FFF5F5F5FFF6F6F6FFF7F7F7FF
                  E8E8F1FF1C1B9FFF0A23AAFF2386E8FF258CEBFF278EECFF298FECFF2B91EDFF
                  2D94EEFF2F96EEFF3299EFFF349BEFFF369DF0FF399FF1FF3CA1F1FF3FA3F2FF
                  43A6F2FF45A9F2FF48ABF3FF4CADF4FF50AFF5FF53B2F5FF4AAEF4FF37A3F4FF
                  279BF3FF1994F3FF098DF3FF0390F3FF03AEF2D17283890C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000091959803
                  E2EAF3106F75B188020C94FF0D21AAFF1A35BAFF0C26B5FF021BB1FF021BB2FF
                  021CB2FF021EB3FF021FB4FF0220B5FF0221B6FF0322B7FF0324B7FF0326B8FF
                  0328BAFF0328BAFF0329BBFF032BBCFF032CBDFF032DBEFF032FBEFF0339C3FF
                  0490E3FF3CADE1FFC8CACBFFCCCCCCFFCCCCCCFFCDCDCDFFCECECEFFCFCFCFFF
                  D0D0D0FFD1D1D1FFD2D2D2FF8AC4DCFF09ABEDFF0586E1FF0548CCFF0544CBFF
                  0546CCFF0547CDFF0549CFFF064AD0FF064CD0FF064DD1FF074ED2FF074FD2FF
                  0751D3FF0751D4FF0853D5FF0856D5FF0857D6FF0858D7FF0959D7FF095BD8FF
                  0A5CD9FF0A5ED9FF0A5FDAFF0B61DBFF0C63DCFF0D65DDFF0D67DDFF0E68DDFF
                  0E69DEFF0F6ADFFF106CDFFF116FE0FF1270E0FF0B52C9FF0531B0FF7086CCFF
                  F0F1F2FFF3F3F3FFF4F4F4FFF5F5F5FFF6F6F6FFF6F6F6FFF7F7F7FFF8F8F8FF
                  F8F8F9FF7775C4FF030697FF1E6FDAFF288EECFF2990EDFF2B92EDFF2D95EEFF
                  2F97EEFF3299EFFF349BF0FF379EF0FF3AA0F1FF3DA2F2FF40A4F2FF43A7F2FF
                  46A9F2FF49ACF3FF4DAEF4FF50B0F5FF54B3F5FF58B6F6FF53B3F6FF3EA8F4FF
                  2B9FF4FF1C97F4FF0B8FF4FF038FF4FF03B2F4D172848A0C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  95989B037A7DB680020E98FF0F25ADFF1834BAFF0A24B5FF021BB2FF011DB3FF
                  011EB3FF0220B4FF0220B5FF0221B6FF0223B7FF0225B8FF0227B9FF0228BAFF
                  0229BBFF022ABBFF022BBCFF032CBDFF022EBEFF022FBFFF0330BFFF034CCAFF
                  049BE7FF7CB9D7FFCCCCCCFFCDCDCDFFCECECEFFCFCFCFFFD0D0D0FFD0D0D0FF
                  D1D1D1FFD2D2D2FFB8CDD6FF1AABE9FF0595E6FF044ACDFF0545CBFF0546CDFF
                  0547CEFF0549CFFF054BD0FF064CD1FF064DD1FF064FD2FF0750D3FF0751D3FF
                  0852D4FF0854D5FF0856D5FF0858D6FF0858D7FF095AD7FF095BD8FF0A5DD9FF
                  0A5EDAFF0A60DAFF0B62DCFF0C64DDFF0D66DDFF0D68DDFF0E69DDFF0F69DEFF
                  0F6BDFFF106DDFFF1170E0FF1372E1FF1473E2FF1474E2FF0945C0FF0D31AFFF
                  ABB6DEFFF4F4F4FFF5F5F5FFF6F6F6FFF7F7F7FFF8F8F8FFF9F9F9FFF9F9F9FF
                  FAFAFAFFCDCCE8FF060596FF164AC2FF2A90EDFF2B93EDFF2E95EEFF3098EEFF
                  339AEFFF359CEFFF379EF0FF3AA0F1FF3DA2F2FF41A5F2FF44A7F2FF47AAF3FF
                  4AACF3FF4EAEF4FF51B0F5FF54B3F6FF59B7F6FF5EBAF6FF5CB8F6FF45ADF5FF
                  30A2F5FF1F9AF4FF0E91F4FF038FF5FF03B4F5D172848A0C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000030316779021099FF0E25AEFF1532BAFF0824B5FF021DB3FF011FB4FF
                  0220B5FF0221B5FF0222B6FF0324B7FF0225B8FF0227B9FF0228BAFF0229BBFF
                  022BBCFF022BBCFF022DBDFF032EBEFF022FBFFF0330C0FF0331C0FF0465D3FF
                  0A9AE5FFB0C6D0FFCDCDCDFFCECECEFFCFCFCFFFD0D0D0FFD1D1D1FFD2D2D2FF
                  D3D3D3FFD2D3D4FF58B7E1FF05A1E9FF0459D2FF0545CCFF0546CDFF0548CEFF
                  054ACFFF054BD0FF064CD1FF064ED1FF064FD2FF0750D3FF0751D4FF0853D4FF
                  0755D5FF0857D6FF0858D7FF0959D7FF095AD8FF095BD8FF0A5DD9FF0A5FDAFF
                  0A60DBFF0C63DCFF0C64DDFF0D66DDFF0D68DDFF0E69DEFF0F6ADEFF106BDFFF
                  106EE0FF1170E0FF1372E1FF1474E2FF1575E3FF1677E4FF1673DFFF0630B1FF
                  324DB8FFE6E8F1FFF6F6F6FFF7F7F7FFF8F8F8FFF9F9F9FFFAFAFAFFFBFBFBFF
                  FBFBFBFFEFEFF7FF3230A8FF0C26ABFF2B90ECFF2E96EEFF3198EFFF339AEFFF
                  369CF0FF389FF1FF3BA1F1FF3EA3F2FF41A5F3FF44A8F3FF48AAF3FF4BADF4FF
                  4EAFF4FF52B1F5FF55B4F6FF5AB7F6FF5FBAF6FF63BCF6FF64BDF6FF4DB2F6FF
                  35A6F6FF229CF5FF0E93F5FF0490F5FF03B6F6D172848A0C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000001367902119AFF0E26AFFF1432BBFF0724B6FF021FB4FF0220B5FF
                  0221B6FF0222B7FF0224B7FF0326B9FF0228BAFF0228BAFF022ABBFF022BBCFF
                  022CBDFF022DBEFF022FBFFF0330BFFF0330C0FF0332C1FF0334C2FF0576D9FF
                  249EE0FFC1CACFFFCFCFCFFFD0D0D0FFD1D1D1FFD1D1D1FFD2D2D2FFD3D3D3FF
                  D4D4D4FFB3CCD8FF16A3E7FF0580DFFF0446CCFF0547CDFF0549CFFF054AD0FF
                  054CD0FF064DD1FF064ED2FF074FD2FF0751D3FF0751D4FF0754D5FF0856D5FF
                  0857D6FF0858D7FF0959D7FF095BD8FF095CD9FF095ED9FF0A5FDAFF0A61DBFF
                  0C63DCFF0C65DDFF0D67DDFF0E68DDFF0E69DEFF0F6ADFFF106CDFFF106EE0FF
                  1271E1FF1372E1FF1474E2FF1576E4FF1677E4FF1879E5FF197BE5FF115ACEFF
                  0524A9FF9EA9DAFFF8F8F8FFF9F9F9FFF9F9F9FFFAFAFAFFFBFBFBFFFCFCFCFF
                  FDFDFDFFFDFDFDFF5E5DBAFF06109DFF2B89E6FF3299EFFF349BEFFF369DF0FF
                  399FF1FF3CA1F2FF3FA4F2FF42A6F3FF45A9F3FF48ABF3FF4CADF4FF4FB0F5FF
                  52B2F5FF56B5F6FF5BB8F6FF5FBAF6FF64BCF6FF69BFF7FF6AC0F7FF53B6F7FF
                  39A9F6FF249EF5FF1094F6FF0491F6FF03B8F7D172848A0C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000001366302129CFF0D26B0FF1333BBFF0726B7FF0220B5FF0221B6FF
                  0223B7FF0225B8FF0227B9FF0328BAFF0229BBFF022ABBFF022BBCFF022CBDFF
                  022EBEFF022FBFFF0230C0FF0331C0FF0332C1FF0434C2FF0439C4FF057DDBFF
                  3DA2DDFFCBCED0FFD0D0D0FFD1D1D1FFD2D2D2FFD3D3D3FFD4D4D4FFD5D5D5FF
                  D5D5D5FF77BBDDFF049AE6FF055AD3FF0547CDFF0549CFFF064BD0FF054CD0FF
                  064DD1FF064FD2FF0750D3FF0751D3FF0752D4FF0854D5FF0856D6FF0858D6FF
                  0859D7FF095AD8FF095BD8FF095DD9FF0960D9FF0961D9FF0A62DAFF0C64DCFF
                  0D65DDFF0D67DDFF0E69DEFF0E6ADEFF0F6BDFFF106DDFFF116FE0FF1271E1FF
                  1373E2FF1575E3FF1676E4FF1678E4FF187AE5FF197BE6FF197DE6FF1977E2FF
                  062DB0FF475ABCFFF2F3F7FFFAFAFAFFFBFBFBFFFCFCFCFFFCFCFCFFFDFDFDFF
                  FEFEFEFFFEFEFEFF8A89CDFF020194FF2B83E2FF349CF0FF379DF0FF39A0F1FF
                  3CA2F2FF3FA4F2FF43A7F3FF46A9F3FF49ABF3FF4CAEF4FF50B0F5FF53B2F5FF
                  57B6F6FF5CB8F6FF60BBF6FF65BDF6FF69C0F7FF6EC2F7FF70C3F7FF5ABAF7FF
                  3DACF7FF26A0F6FF1096F6FF0393F7FF03B5F6D172838A0C0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000001365102119AFF0B24AFFF1334BCFF0726B8FF0222B6FF0223B7FF
                  0225B8FF0227B9FF0228BAFF0329BBFF022ABCFF022CBCFF022DBDFF022EBEFF
                  022FBFFF0330C0FF0331C1FF0333C1FF0434C2FF0436C3FF043EC5FF057EDBFF
                  47A3DBFFD1D1D1FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FF
                  D3D6D7FF3FA9E0FF058AE1FF054DD0FF054ACFFF054BD0FF064CD1FF064ED1FF
                  064FD2FF0750D3FF0751D4FF0853D4FF0855D5FF0757D6FF0858D7FF0859D7FF
                  095AD8FF095CD8FF0767D7FF056ED4FF056DD2FF056AD0FF0667CFFF0664CFFF
                  0A65D6FF0D69DDFF0E6ADEFF0F6BDFFF106DE0FF116FE0FF1272E1FF1473E2FF
                  1575E3FF1676E4FF1778E4FF187AE5FF197CE6FF197DE6FF1B7FE7FF1D81E7FF
                  0E48C1FF1228A9FFDDE0F0FFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFEFEFEFF
                  FFFFFFFFFFFFFFFFA6A5D9FF020094FF2977DAFF379EF0FF3AA0F1FF3DA3F2FF
                  40A5F2FF43A7F3FF46AAF3FF4AACF3FF4DAEF4FF51B1F5FF54B3F5FF59B7F6FF
                  5DB9F6FF61BBF6FF66BEF6FF6AC0F7FF6FC3F7FF74C5F8FF76C7F8FF60BDF7FF
                  40AEF7FF27A2F6FF0F97F7FF0397F7FF03A3D6B0727D81030000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000013631021297FF0822ADFF1436BDFF0728B9FF0224B7FF0226B9FF
                  0227B9FF0228BAFF0229BBFF032BBCFF022CBDFF022EBEFF022FBFFF022FBFFF
                  0330C0FF0332C1FF0433C1FF0434C2FF0436C3FF0438C4FF0540C7FF047FDBFF
                  5DA8D9FFD2D2D2FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FFD6D6D6FFD7D7D7FF
                  C6D2D9FF229CE1FF057ADCFF054BD0FF054CD0FF064DD1FF064ED2FF0750D3FF
                  0750D3FF0752D4FF0853D5FF0856D5FF0857D6FF0858D7FF0959D7FF095AD8FF
                  085ED8FF066ED6FF0573D3FF2581D5FF63A0DAFF72A7DCFF639CD9FF2172CEFF
                  065EC9FF085FCEFF0F6BDEFF106EE0FF1170E1FF1372E1FF1474E2FF1575E3FF
                  1677E4FF1779E5FF187BE5FF197CE6FF1A7EE6FF1C7FE7FF1D81E7FF1F84E8FF
                  1661D2FF0218A2FFB5BBE2FFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFFFFFFFF
                  FFFFFFFFFFFFFFFFBCBCE2FF020094FF2871D5FF3BA1F1FF3DA3F2FF41A5F2FF
                  44A8F3FF47AAF3FF4AADF4FF4EAFF4FF51B1F5FF55B4F6FF59B7F6FF5EB9F7FF
                  62BCF6FF67BFF6FF6BC1F7FF70C3F8FF74C6F8FF79C9F8FF7CCAF8FF64BFF8FF
                  43B0F8FF28A3F7FF0C97F7FF039AF8FF027BA193000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000190E020F91FC0621ADFF1336BDFF072ABAFF0327B9FF0228BAFF
                  0229BBFF032ABBFF022BBCFF032DBDFF022EBEFF022FBFFF0330C0FF0331C0FF
                  0333C1FF0434C2FF0435C2FF0437C3FF0439C4FF053AC5FF0440C7FF0478D8FF
                  4FA1D9FFD3D3D3FFD4D4D4FFD5D5D5FFD6D6D6FFD7D7D7FFD8D8D8FFD9D9D9FF
                  C0D0DAFF1493E0FF056FD9FF064CD1FF064DD1FF064FD2FF0750D3FF0751D4FF
                  0752D4FF0854D5FF0856D5FF0857D6FF0858D7FF0959D8FF095BD8FF095DD9FF
                  066BD6FF0975D3FF7DB0DEFFE7E8EAFFEBEBEBFFECECECFFECECECFFE7E9ECFF
                  6D9CD8FF0759C6FF0A61D1FF1171E1FF1372E2FF1474E2FF1576E3FF1677E4FF
                  177AE5FF187BE6FF197DE6FF1A7EE7FF1C80E7FF1E82E8FF1F85E8FF2086E9FF
                  1C72DCFF0319A2FF959CD6FFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFBEBEE3FF020094FF2B72D6FF3EA4F2FF42A6F3FF45A9F3FF
                  48ABF3FF4BADF4FF4FB0F5FF52B2F5FF56B5F6FF5BB8F6FF5FBAF7FF63BDF7FF
                  68BFF7FF6CC1F7FF71C4F8FF75C7F8FF7BC9F8FF80CCF9FF83CDFAFF67C1F9FF
                  43B1F8FF27A3F8FF0A96F8FF039FF9FF027FA16D000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000203020C8AD80420ACFF1235BDFF082DBBFF0328BAFF0329BBFF
                  032BBCFF032CBDFF032DBDFF032FBEFF032FBFFF0330C0FF0331C1FF0433C1FF
                  0434C2FF0436C3FF0438C4FF0539C4FF053AC5FF043BC6FF0441C8FF0575D7FF
                  459BD9FFD4D4D5FFD6D6D6FFD7D7D7FFD7D7D7FFD8D8D8FFD9D9D9FFDADADAFF
                  C0D1DBFF118EDEFF0569D7FF064ED2FF064FD2FF0750D3FF0751D4FF0753D5FF
                  0855D5FF0857D6FF0858D7FF0859D7FF095AD8FF095BD9FF095DD9FF0961D9FF
                  056FD3FF4F97D9FFE6E8EAFFEBEBEBFFECECECFFEDEDEDFFEEEEEEFFEFEFEFFF
                  E9EBEEFF4780D0FF0755C6FF126FDEFF1575E3FF1676E4FF1678E5FF187AE5FF
                  187CE6FF197DE6FF1B7FE7FF1D81E8FF1E83E8FF1F85E9FF2086E9FF2289EAFF
                  1E78DFFF041CA4FF838BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFA8A8DAFF020094FF307BDBFF42A6F3FF45A9F3FF49ACF3FF
                  4CAEF4FF50B0F5FF53B3F6FF57B6F6FF5BB8F7FF60BBF7FF64BDF7FF69BFF7FF
                  6DC2F7FF72C5F8FF76C7F8FF7CCAF9FF81CDF9FF87CFFAFF89D0FAFF6AC3F9FF
                  43B2F9FF25A3F8FF0696F8FF03A7F9FD016E8A3C000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000101010872A8031FABFF1034BCFF0930BDFF032ABBFF022BBCFF
                  022CBDFF022EBEFF022FBEFF0330BFFF0330C0FF0332C1FF0333C2FF0334C2FF
                  0436C3FF0438C4FF0539C5FF053BC5FF043CC6FF043DC7FF0340C8FF046CD4FF
                  3190D8FFCDD2D6FFD7D7D7FFD8D8D8FFD9D9D9FFDADADAFFDADADAFFDBDBDBFF
                  C3D2DCFF168CDCFF056DD8FF064FD3FF0751D3FF0752D4FF0853D5FF0756D5FF
                  0857D6FF0858D7FF0859D7FF095AD8FF095CD9FF095ED9FF0A5FDAFF0963D9FF
                  056DD1FF86B3DFFFECECECFFEDEDEDFFEDEDEDFFEEEEEEFFEFEFEFFFF0F0F0FF
                  F1F1F1FFA4BCE2FF064EC0FF0F66D6FF1677E4FF1679E5FF187BE5FF197CE6FF
                  197DE6FF1B7FE7FF1D82E8FF1E83E8FF1F85E9FF2187EAFF2289EAFF248BEBFF
                  1F77DFFF0418A2FF8A90D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF9090D0FF020094FF398CE3FF46AAF3FF49ACF3FF4DAEF4FF
                  50B1F5FF53B3F6FF58B6F6FF5CB9F7FF61BBF7FF65BEF7FF6AC0F7FF6EC3F7FF
                  73C5F8FF78C8F8FF7DCAF9FF82CDF9FF88D0FAFF8ED3FBFF8ED3FAFF68C3F9FF
                  41B2F9FF22A3F9FF0496F9FF03B3FBE800263020000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000104476C021DA9FF0C30B9FF0B34BFFF032CBCFF022CBDFF
                  022EBEFF022FBFFF0230C0FF0331C0FF0332C1FF0334C2FF0335C2FF0437C3FF
                  0438C4FF043AC5FF043BC6FF043CC7FF043EC7FF033FC8FF0440C9FF0462D1FF
                  1580D6FFC3CED7FFD8D8D8FFD9D9D9FFDADADAFFDBDBDBFFDCDCDCFFDDDDDDFF
                  CED7DDFF2890DBFF0572D8FF0752D4FF0752D4FF0754D5FF0856D5FF0857D6FF
                  0858D7FF0859D8FF095BD8FF095CD9FF095EDAFF0A5FDAFF0A61DBFF0A64DBFF
                  0569D0FF619CDAFFEBECEDFFEEEEEEFFEFEFEFFFEFEFEFFFF0F0F0FFF1F1F1FF
                  F2F2F2FFDDE4EEFF2562C6FF0955C8FF1778E4FF187BE5FF197CE6FF1A7EE7FF
                  1C80E7FF1D82E8FF1E84E8FF2086E9FF2187EAFF228AEAFF248BECFF268DECFF
                  1E6DD8FF02109DFFAAADDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF6766BEFF080F9CFF409AEAFF4AACF4FF4EAFF5FF51B1F5FF
                  54B4F6FF59B7F6FF5DB9F7FF62BCF7FF66BEF7FF6AC0F7FF6FC3F7FF74C6F8FF
                  79C9F8FF7ECBF9FF83CEF9FF89D0FAFF90D3FBFF96D6FBFF91D4FBFF66C2F9FF
                  3EB1F9FF1AA1F9FF0398F9FF02AAE2C300171D07000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000012A2902199FFB082BB6FF0E37C0FF032EBEFF022FBEFF
                  022FBFFF0330C0FF0331C1FF0333C2FF0334C2FF0436C3FF0437C4FF0439C4FF
                  043AC5FF043BC6FF043DC7FF043EC8FF0340C8FF0440C9FF0441CAFF0455CEFF
                  0575D4FFA0BED7FFDADADAFFDBDBDBFFDBDBDBFFDCDCDCFFDDDDDDFFDEDEDEFF
                  DDDEDFFF4D9DDAFF0577D7FF0756D5FF0855D5FF0857D6FF0857D7FF0858D7FF
                  0859D8FF095BD9FF095DD9FF095FDAFF0A60DBFF0A62DBFF0B64DDFF0C65DDFF
                  0866D2FF176ECEFFD6DFEAFFEFEFEFFFF0F0F0FFF1F1F1FFF2F2F2FFF3F3F3FF
                  F3F3F3FFF4F4F4FF6B91D5FF0546BCFF1573DFFF197DE6FF1A7EE7FF1C80E7FF
                  1D83E8FF1E84E9FF2086E9FF2288EAFF238AEBFF248CECFF268EECFF2990EDFF
                  1651C5FF07139EFFD6D8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFF2F2F9FF3533A9FF1228AAFF48A7F0FF4FB0F5FF51B2F6FF55B5F6FF
                  5AB7F6FF5EBAF7FF62BCF7FF67BFF7FF6CC1F7FF70C4F8FF75C7F8FF7AC9F8FF
                  7FCCF9FF85CEFAFF8BD1FAFF91D4FBFF97D6FBFF9ED9FBFF91D4FBFF61C1FAFF
                  39AFF9FF109EF9FF029EFAFF0292BA8300000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000B0B02118DCA0427B3FF0E39C1FF0531BFFF0330BFFF
                  0330C0FF0332C1FF0333C2FF0435C2FF0436C3FF0438C4FF0439C5FF043BC5FF
                  043CC6FF033DC7FF033FC8FF0440C9FF0441CAFF0442CAFF0443CBFF044BCDFF
                  056DD1FF5C9DD6FFDADBDBFFDCDCDCFFDDDDDDFFDEDEDEFFDFDFDFFFDFDFDFFF
                  E0E0E0FF94BCDDFF0678D6FF0661D5FF0757D6FF0858D7FF0859D8FF095AD8FF
                  095CD9FF095EDAFF095FDAFF0A61DBFF0B62DCFF0B64DDFF0C66DEFF0D68DEFF
                  0B67D8FF0560CAFF81ABDDFFF1F1F1FFF1F1F1FFF2F2F2FFF3F3F3FFF4F4F4FF
                  F5F5F5FFF6F6F6FFC0CEE9FF0F48BCFF0E5DCFFF1A7FE7FF1D81E8FF1E83E8FF
                  1F85E9FF2086EAFF2289EAFF238BEBFF258CECFF278EEDFF2991EDFF298DEAFF
                  0B2BADFF3740B0FFF2F3FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFD6D5EDFF080696FF2653C2FF4FB0F5FF52B3F6FF56B6F6FF5BB8F7FF
                  5FBBF7FF64BDF7FF68BFF7FF6DC2F8FF71C5F8FF76C7F8FF7BCAF9FF81CCF9FF
                  86CFFAFF8CD2FBFF92D4FBFF98D7FBFFA0DAFCFFA6DDFCFF8CD2FBFF59BEFAFF
                  33ACFAFF079BFAFF02AAFBF50162783B00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000108597F0224AFFF0B35BEFF0734C1FF0331C1FF
                  0333C1FF0334C2FF0435C2FF0437C4FF0438C4FF043AC5FF043BC6FF043CC6FF
                  033EC7FF033FC8FF0440C9FF0441CAFF0442CAFF0444CBFF0445CCFF0547CDFF
                  0562CFFF1B78D2FFD0D6DCFFDEDEDEFFDEDEDEFFDFDFDFFFE0E0E0FFE1E1E1FF
                  E2E2E2FFCBD7E1FF2282D5FF056CD3FF0858D7FF0859D8FF095BD8FF095CD9FF
                  095EDAFF0960DAFF0A61DBFF0B63DCFF0C65DDFF0D67DEFF0D68DEFF0E69DEFF
                  0E6BDEFF075FCDFF216CCBFFECEEF1FFF3F3F3FFF4F4F4FFF4F4F4FFF5F5F5FF
                  F6F6F6FFF7F7F7FFF1F2F6FF3A66C6FF0744BCFF1C81E7FF1E84E9FF1F85E9FF
                  2187EAFF2289EAFF238BEBFF258DECFF278FEDFF2991EEFF2B94EEFF2170D8FF
                  03109DFF858ACEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FEFEFEFF8583CBFF040597FF3F8AE0FF53B3F6FF57B6F6FF5CB8F7FF60BBF7FF
                  64BEF7FF69C0F7FF6EC3F7FF72C6F8FF77C8F8FF7CCAF9FF82CDF9FF87CFFAFF
                  8ED3FBFF93D5FBFF9AD7FBFFA1DBFCFFA9DEFCFFABDFFBFF82CFFAFF50BAFAFF
                  25A7FAFF039AFAFF02B4F3D2002E380A00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000022830021EA4F1072FBAFF0A3AC3FF0333C1FF
                  0334C2FF0336C3FF0437C3FF0439C5FF043AC5FF043CC6FF043DC7FF033EC7FF
                  0340C9FF0441C9FF0441CAFF0542CBFF0444CBFF0446CCFF0447CDFF0448CEFF
                  0555CEFF0568CEFF88B0D8FFDFDFDFFFE0E0E0FFE0E0E0FFE1E1E1FFE2E2E2FF
                  E3E3E3FFE4E4E4FF78ABDBFF076FD1FF0760D5FF095BD9FF095DD9FF095FDAFF
                  0A60DBFF0A61DBFF0B63DCFF0C65DEFF0D67DEFF0D68DEFF0E6ADFFF0E6BDFFF
                  0F6DE0FF0B66D5FF0556C5FFA6BFE4FFF4F4F4FFF5F5F5FFF6F6F6FFF6F6F6FF
                  F7F7F7FFF8F8F8FFF9F9F9FF8DA5DCFF0638B5FF1770DBFF1F86E9FF2188EAFF
                  228AEBFF248CECFF258DECFF2890EDFF2992EEFF2B94EEFF2C92ECFF0C2CAEFF
                  2029A6FFE0E1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F3F3FAFF2726A3FF1327A9FF50ADF2FF58B7F6FF5DB9F7FF61BCF7FF65BEF7FF
                  6AC0F7FF6FC3F8FF73C6F8FF78C8F9FF7DCBF9FF83CDF9FF89D0FAFF8FD3FBFF
                  95D6FBFF9CD8FBFFA3DBFCFFAADEFCFFB1E1FCFFABDFFCFF75CAFAFF45B6FAFF
                  14A2FAFF039FFBFE028BAF810000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000E05021185B4032BB6FF0B3CC3FF0536C3FF
                  0436C3FF0438C4FF043AC5FF043BC6FF043CC6FF043DC7FF033FC8FF0340C9FF
                  0441CAFF0442CAFF0443CBFF0545CCFF0546CCFF0447CDFF0448CEFF054AD0FF
                  054DD0FF0560CDFF2678CFFFD5DADFFFE1E1E1FFE2E2E2FFE3E3E3FFE4E4E4FF
                  E4E4E4FFE5E5E5FFD7DEE4FF2E80D3FF0567CFFF085FD7FF095FDAFF0A60DBFF
                  0A62DCFF0B64DDFF0C66DEFF0D67DEFF0D69DEFF0E6ADFFF0E6CDFFF0F6EE0FF
                  1070E1FF106FDFFF0755C6FF4179CEFFF3F4F5FFF6F6F6FFF7F7F7FFF8F8F8FF
                  F9F9F9FFF9F9F9FFFAFAFAFFDEE4F3FF113EB6FF0E51C6FF2188EAFF238AEBFF
                  248CEBFF258EEDFF2890EDFF2A93EEFF2C95EEFF2E97EFFF1955C7FF05109CFF
                  8E92D2FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  9D9DD5FF030295FF356ED0FF59B7F7FF5EBAF7FF62BCF7FF67BFF7FF6BC1F7FF
                  70C4F8FF74C7F8FF79C9F9FF7ECBF9FF84CEFAFF8AD1FAFF90D3FBFF96D6FBFF
                  9DD9FBFFA5DCFCFFABDFFCFFB3E3FCFFBAE5FCFFA2DCFBFF66C4FAFF36B0FBFF
                  069DFBFF02B0FCF3014E5F270000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000105464F0327B0F90736BFFF083CC5FF
                  0438C4FF043AC5FF043BC6FF043DC7FF043EC7FF043FC8FF0440C9FF0441CAFF
                  0442CBFF0544CBFF0545CCFF0546CDFF0547CEFF0548CEFF054BD0FF054CD1FF
                  064DD1FF0555CFFF0662CAFF75A3D6FFE2E2E3FFE3E3E3FFE4E4E4FFE5E5E5FF
                  E6E6E6FFE7E7E7FFE8E8E8FFB9CDE3FF0D69CDFF0663CFFF0961D9FF0B62DCFF
                  0B65DDFF0C66DEFF0D68DEFF0E69DFFF0E6BDFFF0F6CE0FF0F6FE0FF1070E1FF
                  1272E2FF1373E2FF0C60D1FF0D52C1FFBECEE9FFF8F8F8FFF9F9F9FFF9F9F9FF
                  FAFAFAFFFBFBFBFFFCFCFCFFFCFDFDFF5270C8FF0635B4FF2182E5FF258DECFF
                  268FEDFF2891EEFF2A94EEFF2C96EFFF2E97EFFF2068D2FF03129EFF4A50B7FF
                  F6F6FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECECF7FF
                  1F1DA0FF1120A5FF56AFF2FF5FBBF7FF63BDF7FF68BFF7FF6CC2F8FF71C5F8FF
                  75C7F8FF7ACAF9FF80CCF9FF85CFFAFF8CD1FBFF91D4FBFF97D7FBFF9FDAFCFF
                  A6DDFCFFADE0FCFFB5E3FCFFBCE6FDFFC0E8FDFF8DD4FBFF55BDFBFF1EA7FBFF
                  039CFBFF02B4E7A7000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000F0702178EC30330BBFF0A3FC5FF
                  053BC6FF043CC6FF043DC7FF043FC8FF0440C8FF0441C9FF0441CAFF0443CBFF
                  0445CBFF0446CCFF0547CDFF0548CEFF0549CFFF054CD0FF054DD1FF064DD2FF
                  064FD2FF0651D3FF055ACBFF1366CAFFB2C6DEFFE5E5E5FFE5E5E5FFE6E6E6FF
                  E7E7E7FFE8E8E8FFE9E9E9FFEAEAEAFF99B9DFFF0C63CAFF065FCDFF0B64DBFF
                  0C67DEFF0D68DEFF0E69DFFF0E6BDFFF0F6DE0FF106FE1FF1171E1FF1273E2FF
                  1374E2FF1575E3FF1473E0FF0549BEFF5D86D2FFF8F8F9FFFAFAFAFFFAFAFAFF
                  FBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFB2BEE6FF042AADFF1764D2FF278FEDFF
                  2992EEFF2B94EEFF2D97EFFF2E97EFFF1F67D1FF04139FFF2F37ACFFEBEBF7FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFDFF6D6CC1FF
                  040496FF4181D8FF60BBF7FF64BDF7FF69C0F7FF6DC3F8FF72C5F8FF76C8F8FF
                  7BCAF9FF81CDF9FF87CFFAFF8DD2FBFF92D4FBFF99D7FBFFA0DAFCFFA8DEFCFF
                  AFE1FCFFB6E4FCFFBEE7FDFFC6EAFDFFB7E5FCFF76CBFBFF3FB5FBFF09A0FBFF
                  02ABFCFB01556834000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000105484F022BB4FA073AC2FF
                  073FC7FF043EC7FF043FC8FF0440C9FF0441CAFF0542CAFF0443CBFF0445CCFF
                  0446CCFF0547CDFF0448CEFF054ACFFF054CD0FF054DD1FF064ED2FF064FD3FF
                  0751D3FF0652D4FF0655D2FF0559C8FF3276CDFFCFD8E3FFE7E7E7FFE8E8E8FF
                  E8E8E8FFE9E9E9FFEAEAEAFFEBEBEBFFEAEBECFF8EB1DDFF1162C9FF055AC9FF
                  0B63D7FF0E6ADFFF0E6CDFFF0F6EE0FF1070E1FF1171E1FF1373E2FF1474E3FF
                  1576E3FF1678E4FF167AE5FF0B56CAFF1950BEFFD5DDF0FFFBFBFBFFFCFCFCFF
                  FDFDFDFFFDFDFDFFFEFEFEFFFFFFFFFFF7F8FCFF1F3EB3FF0C3FBAFF2890ECFF
                  2B95EFFF2D97EFFF2F99F0FF2370D7FF0516A1FF313AAEFFDDDEF1FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFA7A7D9FF0A0997FF
                  2344B8FF60BAF6FF65BEF7FF6AC1F8FF6EC3F8FF73C6F8FF77C8F8FF7DCAF9FF
                  82CDF9FF88D0FAFF8ED3FBFF94D5FBFF9AD8FBFFA2DBFCFFA9DEFCFFB0E1FCFF
                  B8E5FDFFC0E8FDFFC8EBFDFFCDEDFDFF9DDBFBFF5EC2FBFF22AAFCFF039EFCFF
                  02B0E5AA00020201000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000B04021792B70435BFFF
                  0841C7FF0440C9FF0440C9FF0441CAFF0542CAFF0444CBFF0445CCFF0546CDFF
                  0447CEFF0448CEFF054BCFFF054CD1FF054DD1FF064ED2FF0650D3FF0751D4FF
                  0753D4FF0754D5FF0756D6FF0657D0FF0556C5FF4A82CFFFDCE0E6FFE9E9E9FF
                  EAEAEAFFEBEBEBFFECECECFFECECECFFEDEDEDFFECEDEEFFA5BFE2FF2167C9FF
                  0554C4FF095ED0FF0E6BDDFF1070E1FF1172E2FF1373E2FF1475E3FF1577E3FF
                  1679E4FF167AE5FF177CE6FF146FDCFF053EB7FF7F9AD8FFFCFCFCFFFDFDFDFF
                  FEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFF7587CFFF0527ABFF247EE0FF
                  2E97EFFF3099F0FF3095EDFF0D2DAEFF2730A9FFD8DAEFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C5E7FF1D1C9FFF1220A5FF
                  5AADEEFF66BFF7FF6BC1F7FF6FC3F8FF73C6F8FF78C8F9FF7ECBF9FF83CEF9FF
                  89D1FAFF8FD3FBFF95D5FBFF9CD9FCFFA4DCFCFFAADFFCFFB2E2FCFFBAE5FDFF
                  C2E9FDFFCAECFDFFD1EFFDFFC3EAFDFF7DCEFCFF40B6FCFF09A1FCFF02B0FCEE
                  01566A2D00000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000002302D032CB2F6
                  053CC4FF0743CAFF0441CAFF0543CBFF0444CBFF0446CCFF0547CDFF0448CEFF
                  0449CFFF054BD0FF054DD1FF064DD2FF064FD2FF0650D3FF0652D4FF0753D5FF
                  0755D5FF0856D6FF0857D7FF0858D7FF0656CDFF0652C3FF5A8AD1FFE5E7E9FF
                  EBEBEBFFECECECFFEDEDEDFFEEEEEEFFEFEFEFFFEFEFEFFFF0F0F0FFCFDAEAFF
                  5082D0FF054EC0FF0651C4FF0C61D2FF1271E0FF1475E3FF1577E4FF167AE5FF
                  167BE6FF177CE6FF197EE7FF1A7DE6FF0A4BC1FF2B55BFFFE9EDF7FFFEFEFEFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCED3EDFF0720A6FF1857C8FF
                  319AF0FF339BF0FF308EE7FF020E9CFF7B7FCAFFFEFEFEFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D8EEFF2624A3FF0A109CFF4F96E2FF
                  67BFF7FF6CC1F8FF70C4F8FF75C7F8FF79C9F8FF7FCCF9FF85CEFAFF8BD1FAFF
                  90D4FBFF96D6FBFF9ED9FBFFA5DDFCFFACE0FCFFB3E3FCFFBBE6FDFFC3E9FDFF
                  CBECFDFFD3EFFDFFD2F0FEFF9EDCFCFF5CC2FBFF19A8FBFF02A2FCFF028AB182
                  0003030100000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000010F7280
                  0337BFFE0642C8FF0544CBFF0545CCFF0446CCFF0447CDFF0448CEFF054ACFFF
                  054CD0FF054DD1FF064ED2FF064FD3FF0651D3FF0752D4FF0754D5FF0755D5FF
                  0757D6FF0858D7FF0859D8FF085AD8FF085BD8FF0655CCFF064EC1FF487BCDFF
                  DFE3EAFFEDEDEDFFEEEEEEFFEFEFEFFFF0F0F0FFF1F1F1FFF2F2F2FFF3F3F3FF
                  EFF0F2FFA8BEE3FF2E66C7FF0748BDFF0648BEFF0B58CBFF116CDAFF1678E4FF
                  177CE6FF197EE7FF1B81E8FF1C83E8FF1467D6FF0533B2FFA3B3E2FFFEFEFEFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FBFF3F4FB8FF0B2DAFFF
                  3093EBFF369EF1FF3392E9FF04109DFF6B6EC2FFFDFDFEFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFEFEFEFFCFCEEAFF1F1DA0FF0A0F9CFF4A8CDCFF68C0F7FF
                  6CC2F8FF71C5F8FF75C7F8FF7BCAF9FF80CCF9FF86CFFAFF8CD1FAFF92D4FBFF
                  98D7FBFF9FDAFCFFA7DDFCFFAEE1FCFFB5E4FCFFBDE7FDFFC5EAFDFFCDEDFDFF
                  D4F0FDFFD7F1FEFFB9E6FDFF75CCFCFF31B1FBFF039FFCFF02B7FAD0002B3515
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000010E0C
                  021F9DC4043DC4FF0747CCFF0547CDFF0447CDFF0548CEFF054ACFFF054CD0FF
                  054DD1FF064ED2FF0650D3FF0651D4FF0753D5FF0754D5FF0756D6FF0857D7FF
                  0858D7FF0859D8FF085AD8FF085CD9FF085EDAFF095FDAFF0755CDFF054ABFFF
                  366CC8FFC7D2E6FFEFEFF0FFF1F1F1FFF1F1F1FFF2F2F2FFF3F3F3FFF4F4F4FF
                  F5F5F5FFF5F5F5FFF0F2F5FFA8BDE3FF4B76CCFF164CBDFF053DB7FF0640BAFF
                  0C51C6FF166EDBFF1C83E8FF1E85E9FF1D80E5FF083DB8FF3A5ABFFFF6F7FCFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959DD7FF0314A0FF
                  2877DAFF39A1F2FF3B9FF0FF1539B4FF0D0E9AFF9E9DD6FFEFEFF8FFFEFEFEFF
                  FDFDFEFFEDECF7FFA5A5D9FF17159CFF0B129DFF4B8DDDFF69C0F7FF6DC3F8FF
                  72C5F8FF77C8F8FF7CCAF9FF82CDF9FF87D0FAFF8DD2FBFF93D5FBFF99D8FBFF
                  A1DAFCFFA8DEFCFFAFE2FCFFB7E4FDFFBFE8FDFFC7EBFDFFCFEDFDFFD6F0FDFF
                  D7F1FEFFCAECFEFF8BD4FCFF4ABBFCFF08A2FCFF02ACFDF00160784200000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00043234032EB3E70442C9FF064ACEFF0549CFFF054BD0FF054CD1FF064DD2FF
                  064FD2FF0650D3FF0752D4FF0753D5FF0755D5FF0756D6FF0857D7FF0858D7FF
                  0859D8FF085BD9FF085DD9FF085EDAFF0960DBFF0A61DBFF0A63DCFF0859D0FF
                  0547BEFF1D55C0FF94ACDBFFEAECF0FFF3F3F3FFF3F3F3FFF4F4F4FFF5F5F5FF
                  F6F6F6FFF7F7F7FFF8F8F8FFF9F9F9FFF7F8F9FFD4DDF0FF97ADDFFF5779CCFF
                  1D49BAFF0535B4FF125ECFFF1F87EAFF2189EBFF135CCDFF0529ACFFC1CAEAFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDFF2FF1A26A6FF
                  1641BAFF3CA1F1FF40A6F3FF3990E5FF1024A8FF040295FF2F2EA7FF504FB5FF
                  4E4DB4FF2826A4FF030194FF1423A6FF5298E2FF6AC1F7FF6EC3F8FF73C6F8FF
                  78C8F8FF7DCBF9FF83CEF9FF89D0FBFF8ED3FBFF94D5FBFF9BD8FCFFA3DBFCFF
                  A9DFFCFFB0E2FCFFB9E5FDFFC1E8FDFFC9EBFDFFD0EEFDFFD6F1FEFFD8F2FEFF
                  D2EFFEFF9FDCFCFF5DC3FCFF16A8FCFF03A3FCFC029AC67F0013170100000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000010C625F0339BFF70547CCFF064CD0FF054DD1FF064ED2FF064FD3FF
                  0651D4FF0752D4FF0754D5FF0755D6FF0857D7FF0858D7FF0859D8FF085AD8FF
                  085BD9FF085DDAFF095FDAFF0960DBFF0A62DCFF0A64DCFF0B66DDFF0C67DEFF
                  0B5FD6FF0648C1FF0943BAFF5078CBFFCAD4E9FFF5F5F5FFF6F6F6FFF6F6F6FF
                  F7F7F7FFF8F8F8FFF9F9F9FFFAFAFAFFFBFBFBFFFCFCFCFFFCFCFCFFFCFCFDFF
                  D8DFF2FF4B6BC6FF042FAFFF1A74DDFF238BECFF207EE2FF062DAFFF586CC5FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFEFF5A61BEFF
                  05139EFF3B97EAFF44A9F3FF47ACF3FF449FECFF2C62CAFF1831AEFF0F1DA3FF
                  1120A5FF1E38B1FF3A6DCCFF5FB0EFFF6BC1F8FF6FC4F8FF74C7F8FF79C9F9FF
                  7ECCF9FF84CEFAFF8AD1FBFF90D4FBFF95D6FBFF9DD9FCFFA4DCFCFFABE0FCFF
                  B2E3FDFFBAE6FDFFC2E9FDFFCBECFDFFD2EFFDFFD7F1FEFFD8F2FFFFD6F1FEFF
                  B0E2FDFF6CC9FCFF24AEFCFF03A1FCFF02B3EEB1001115090000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000050301146E870340C6FD064BCEFF064FD2FF0650D3FF0651D4FF
                  0653D4FF0755D5FF0756D6FF0857D7FF0758D7FF0859D8FF085AD9FF085CD9FF
                  085EDAFF085FDBFF0961DBFF0A62DCFF0B64DCFF0B66DDFF0C67DEFF0D69DFFF
                  0D6ADFFF0D68DCFF0953CAFF053DB7FF1648BAFF708DD2FFDCE2F0FFF8F8F8FF
                  F9F9F9FFF9F9F9FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFEFEFEFF
                  FEFEFEFFD5DCF1FF1134B0FF1256C9FF258EECFF268FEDFF104BC2FF0A24A8FF
                  DEE1F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B3DFFF
                  070A99FF2A69CEFF47ACF3FF4BAFF4FF4EB1F5FF51B2F5FF53B2F4FF54ACF0FF
                  59B0F1FF61BAF5FF67C0F7FF6CC2F8FF70C4F8FF75C7F8FF7AC9F9FF80CCF9FF
                  85CFFAFF8BD1FBFF91D4FBFF97D7FBFF9EDAFCFFA6DDFCFFACE1FCFFB4E3FDFF
                  BCE6FDFFC4EAFDFFCCECFDFFD3F0FDFFD7F1FEFFD8F2FFFFD8F2FFFFBCE7FDFF
                  79CEFCFF30B3FCFF04A0FCFF03B6FBD301465714000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000001A05021B97A10446CAFE064ED1FF0752D4FF0753D5FF
                  0755D5FF0756D6FF0857D7FF0859D8FF085AD8FF075BD9FF085DDAFF085EDAFF
                  0960DBFF0961DBFF0A63DCFF0B65DDFF0B66DDFF0C68DEFF0D69DFFF0E6BDFFF
                  0E6DE0FF0F6FE1FF1070E1FF0E68DAFF0949C2FF0537B4FF1340B6FF6581CEFF
                  CAD3EBFFF5F6F9FFFCFCFCFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFFFFFFFF
                  FFFFFFFFEAEDF8FF1534AFFF1252C6FF2691EDFF2893EEFF217ADFFF041EA6FF
                  7783CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9EFFF
                  15159DFF2353C2FF4CAFF5FF4FB1F5FF52B3F6FF56B6F6FF5BB9F7FF5FBBF7FF
                  63BEF7FF69C0F7FF6DC2F8FF71C5F8FF76C8F8FF7BCAF9FF81CDF9FF87D0FAFF
                  8DD2FBFF92D5FBFF98D7FBFFA0DAFCFFA7DEFCFFAEE1FCFFB6E4FDFFBEE7FDFF
                  C6EBFDFFCDEDFDFFD5F0FEFFD8F2FFFFD8F2FFFFD7F1FEFFC2E9FDFF81D1FCFF
                  37B5FBFF05A1FBFF03AEF7DE0144582C00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000001C0C02209CB40348CCFE0651D2FF0756D5FF
                  0757D6FF0758D7FF0859D8FF085AD8FF085BD9FF085DDAFF085FDAFF0960DBFF
                  0962DCFF0A64DCFF0B66DDFF0C67DEFF0C68DFFF0D6ADFFF0E6BE0FF0E6EE0FF
                  0F6FE1FF1071E2FF1172E2FF1274E3FF1375E3FF1066D7FF0949C1FF0534B3FF
                  042EAFFF3C5CC0FF8B9DD8FFD4DAF0FFF0F2F9FFFEFEFEFFFFFFFFFFFEFEFEFF
                  EDEFF8FF6F81CDFF0423A8FF1B6DD6FF2994EEFF2B95EFFF2D97F0FF0E37B5FF
                  1A29A8FFE3E4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFEFFA5A4D8FF
                  080696FF2F69CEFF50B1F6FF53B4F6FF58B7F6FF5CBAF7FF60BCF7FF65BFF7FF
                  69C0F7FF6EC3F8FF72C6F8FF77C8F9FF7DCBF9FF82CEF9FF88D0FAFF8ED3FBFF
                  94D5FBFF9AD8FCFFA2DBFCFFA9DFFCFFB0E1FCFFB8E5FDFFBFE8FDFFC8EBFDFF
                  CFEEFDFFD6F0FEFFD7F1FFFFD8F2FFFFD7F1FEFFC4EAFEFF84D2FCFF3AB6FBFF
                  05A1FBFF03A7F2E501455A380000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000001211202229CB0034ACDFE0654D4FF
                  0858D7FF0859D8FF085AD9FF085CD9FF085EDAFF085FDAFF0961DBFF0A62DCFF
                  0A64DDFF0B66DDFF0C67DEFF0D69DFFF0D6ADFFF0E6CE0FF0E6EE0FF0F70E1FF
                  1071E2FF1173E2FF1374E3FF1476E4FF1578E4FF167AE5FF167BE5FF146FDDFF
                  0E54CAFF0839B7FF042AADFF0C2EADFF334EB9FF6074C8FF8191D3FF6477C9FF
                  3047B6FF0520A7FF114AC1FF2993EEFF2C96EFFF2E98F0FF309AF0FF2677DAFF
                  04139FFF3B43B1FFB5B7E1FFDEDFF1FFE7E8F5FFD6D6EEFF8D8CCEFF14129BFF
                  030396FF377AD6FF52B0F3FF59B8F7FF5DBAF7FF61BCF7FF66BFF7FF6BC1F8FF
                  6FC4F8FF73C6F8FF78C9F8FF7ECBF9FF84CEFAFF8AD1FBFF8FD4FBFF95D6FBFF
                  9BD9FCFFA3DCFCFFAADFFCFFB1E3FDFFB9E6FDFFC1E9FDFFC9ECFDFFD1EEFDFF
                  D6F1FEFFD8F2FFFFD8F2FFFFD7F1FFFFC2E9FDFF85D3FCFF3BB7FBFF05A1FBFF
                  03A6F1E401465C43000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000001221402229CA5034BCDFC
                  0555D5FF075BD9FF085CDAFF085EDAFF095FDBFF0961DBFF0A63DCFF0B65DDFF
                  0B66DEFF0C67DFFF0D69DFFF0D6BE0FF0E6DE0FF0F6FE1FF0F70E1FF1072E2FF
                  1273E2FF1375E3FF1477E4FF1578E4FF167AE5FF167BE6FF187DE7FF197FE8FF
                  1A81E8FF1B7EE6FF176EDAFF1154C9FF0A3CB9FF062CAEFF0423A9FF0627ABFF
                  0B38B6FF1963D0FF2890ECFF2C96F0FF2E98F0FF319AF0FF339DF1FF359EF1FF
                  2367D0FF0718A2FF050A99FF1B1DA0FF2324A2FF211FA1FF2725A3FF2523A2FF
                  090797FF040596FF1F3EB5FF54A6ECFF62BDF7FF67BFF7FF6BC1F7FF70C4F8FF
                  74C7F8FF79CAF8FF7FCCF9FF85CFFAFF8BD1FBFF90D4FBFF96D7FBFF9DD9FCFF
                  A4DDFCFFABE0FCFFB3E3FDFFBBE6FDFFC3E9FDFFCBECFDFFD2EFFEFFD7F1FEFF
                  D8F2FFFFD8F2FFFFD7F1FEFFBDE8FDFF7FD1FCFF33B3FBFF06A1FBFF03A9F4DD
                  01445A3900000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000001210B011B7E95
                  034DCFFD0558D6FF085EDAFF0960DBFF0961DCFF0A63DCFF0B65DDFF0B67DEFF
                  0C68DFFF0D69DFFF0D6CE0FF0E6DE0FF0F6FE1FF0F71E1FF1172E2FF1274E3FF
                  1375E3FF1477E4FF1579E5FF167BE5FF177CE6FF187EE7FF1A80E8FF1B82E8FF
                  1C83E9FF1D85EAFF1F87EAFF2089EBFF2188E9FF2183E6FF2182E5FF2386E7FF
                  268FEBFF2A95EFFF2D97F0FF2F99F0FF319BF1FF339DF1FF359FF1FF38A1F2FF
                  3CA3F2FF2D78D9FF040899FF18179DFF908FD0FFE0E0F2FFEDEDF7FFECECF7FF
                  D9D9EFFF7776C5FF040395FF1F39B1FF64B8F3FF6CC2F7FF71C5F8FF76C7F8FF
                  7ACAF9FF80CDF9FF86CFFAFF8CD2FBFF92D5FBFF97D7FCFF9FDAFCFFA6DDFCFF
                  ADE1FCFFB5E4FDFFBCE7FDFFC5EAFDFFCCEDFDFFD4F0FEFFD7F1FFFFD8F2FFFF
                  D8F2FFFFD6F1FEFFB6E5FDFF74CDFCFF26AEFAFF04A0FBFF03AEF8D30141562C
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000202
                  01106D710348C9F50458D7FF0860DBFF0A64DDFF0B66DDFF0B67DEFF0C68DFFF
                  0D6AE0FF0E6CE0FF0E6EE1FF0F70E1FF1071E2FF1173E2FF1274E3FF1376E4FF
                  1578E4FF1579E5FF167BE6FF177CE7FF187EE8FF1A81E8FF1B82E9FF1D84E9FF
                  1E86EAFF1F88EBFF2089EBFF228BECFF248DECFF258FEDFF2791EEFF2994EEFF
                  2B95EFFF2D97F0FF2F99F0FF319CF1FF349EF1FF379FF2FF39A2F2FF3CA3F3FF
                  3FA5F3FF1C46BBFF110F9AFFC4C3E5FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFDFDFEFF7D7DC8FF040496FF5597E1FF72C6F8FF77C8F8FF7CCBF9FF
                  81CDF9FF87D0FAFF8DD2FBFF93D5FCFF99D8FCFFA1DBFCFFA7DEFCFFAEE1FCFF
                  B7E4FDFFBEE7FDFFC7EBFDFFCEEDFDFFD5F0FEFFD7F1FFFFD8F2FFFFD7F1FEFF
                  D1EFFEFFA6DFFCFF61C5FBFF16A7FBFF03A0FBFD03A7ECB20141561800000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000001096347023AB6DA0358D7FE0760DBFF0B67DEFF0D69E0FF0D6BE0FF
                  0E6DE0FF0E6FE1FF0F70E2FF1072E2FF1173E3FF1375E3FF1476E4FF1578E5FF
                  167AE5FF167BE6FF177DE7FF197FE8FF1A81E8FF1B83E9FF1D85EAFF1E86EAFF
                  1F88EBFF218AEBFF238CECFF248DEDFF2690EDFF2792EEFF2994EFFF2B96EFFF
                  2E98F0FF309AF1FF329CF1FF349EF2FF37A0F2FF3AA2F3FF3DA5F3FF40A6F4FF
                  41A4F1FF132DADFF3635AAFFF3F3FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFBFBFE4FF020094FF4C81D5FF78C9F9FF7DCBF9FF83CEFAFF
                  89D1FBFF8FD3FBFF94D6FCFF9BD8FCFFA2DCFCFFA9DFFCFFB0E2FDFFB8E5FDFF
                  C0E8FDFFC8EBFDFFD0EEFDFFD6F1FFFFD8F2FFFFD8F2FFFFD6F1FFFFC5EBFEFF
                  8FD7FCFF45BAFAFF0AA1FAFF03A2F9F40289C086000F14090000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000032E24022796AC0253D2FB0560DCFF0B69DFFF0E6DE0FF
                  0F6FE1FF0F71E2FF1072E2FF1174E3FF1375E3FF1477E4FF1579E5FF167AE5FF
                  167CE6FF177DE7FF1980E8FF1A81E9FF1C83E9FF1D85EAFF1E87EAFF1F89EBFF
                  218BEBFF238CECFF258EEDFF2690EDFF2793EEFF2995EFFF2C96F0FF2E98F0FF
                  309BF1FF339DF1FF359FF2FF38A1F2FF3BA2F3FF3EA4F3FF41A7F4FF44A9F4FF
                  46AAF3FF1B3EB6FF19179DFFD3D3ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFAFAFCFF6564BEFF070998FF62A2E4FF7ECCF9FF84CEFAFF8AD1FBFF
                  90D4FBFF95D6FCFF9CD9FCFFA4DCFCFFABDFFCFFB2E3FDFFBAE6FDFFC2E9FDFF
                  CAECFDFFD1EFFEFFD7F1FEFFD8F2FFFFD8F2FFFFD2EFFEFFAFE2FDFF6FCAFBFF
                  27ADFAFF049EFAFF03A3F3DB0254754D00101601000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000009090111776B0243C5EA0360DCFF0868DFFF
                  0E6FE1FF1073E2FF1274E3FF1376E4FF1478E4FF1579E5FF167AE5FF177CE6FF
                  187EE7FF1980E8FF1B82E9FF1C84E9FF1D86EAFF1F87EAFF2089EBFF228BECFF
                  238DECFF258EEDFF2691EDFF2893EEFF2A95EFFF2C97F0FF2E99F0FF319BF1FF
                  339DF1FF369FF2FF39A1F2FF3BA3F3FF3EA5F3FF41A7F4FF44AAF4FF47ADF4FF
                  4BAFF5FF3C87DEFF060999FF2F2EA7FFAAA9DBFFE7E7F4FFFFFFFFFFEFEFF8FF
                  C6C6E7FF5C5BBAFF070596FF3352BCFF7DC8F7FF85CFFAFF8BD2FBFF91D4FBFF
                  97D7FCFF9EDAFCFFA5DDFCFFACE0FCFFB4E3FDFFBCE6FDFFC3EAFDFFCBEDFDFF
                  D3EFFEFFD7F1FFFFD8F2FFFFD6F1FFFFC1E9FDFF8ED6FCFF43B7FAFF0EA1F9FF
                  039FF8F9038FD1A10125341C0000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000043425012795AD0258D5FC
                  0465DEFF0B6EE1FF1376E4FF1578E5FF157AE5FF167BE6FF177CE6FF187FE8FF
                  1A81E8FF1B82E9FF1C84EAFF1E86EAFF1F88EBFF208AEBFF228BECFF248DECFF
                  258FEDFF2691EDFF2894EEFF2A96EFFF2D97F0FF2F99F0FF319CF1FF349EF1FF
                  36A0F2FF39A1F2FF3CA3F3FF3FA6F4FF42A8F4FF45ABF4FF48ADF4FF4BAFF5FF
                  4FB2F6FF51B3F5FF3B7BD6FF0B139EFF060495FF17169DFF201EA0FF1B199EFF
                  0C0A98FF040395FF3656BFFF7BC4F5FF86CFFAFF8CD2FBFF92D5FCFF98D8FCFF
                  A0DBFCFFA6DEFCFFADE1FCFFB5E4FDFFBDE7FDFFC5EAFDFFCDEDFDFFD4F0FEFF
                  D7F1FFFFD7F1FEFFC9ECFEFF9FDDFCFF5BC0FAFF18A3F8FF049CF9FF03A0F3D7
                  02557C51000B1005000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000B0301085B4A
                  0235B3CE025FDAFC0569E0FF0E72E3FF157AE5FF177DE7FF187FE8FF1A81E9FF
                  1B83E9FF1D85EAFF1E87EAFF1F88EBFF218AECFF238CECFF248EEDFF258FEDFF
                  2792EEFF2995EFFF2B96EFFF2E98F0FF2F9AF1FF319CF1FF349FF2FF37A0F2FF
                  3AA2F3FF3DA4F3FF40A6F4FF42A9F4FF46ACF4FF49AEF5FF4CB0F6FF4FB2F6FF
                  53B5F6FF57B7F7FF5CBAF7FF5AB0F1FF4179D2FF2C4EBCFF2239B1FF2B48B8FF
                  426DCAFF6BAEEBFF81CCF9FF88D0FBFF8ED3FBFF93D5FCFF99D8FCFFA2DBFCFF
                  A8DFFCFFAFE2FCFFB7E5FDFFBFE8FDFFC7EBFDFFCFEEFDFFD5F0FEFFD6F1FEFF
                  C9ECFEFFA0DCFCFF5EC1F9FF1DA4F7FF049AF7FE039BF2EC036A9E7C001B280D
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00001208010E5F63023CB5D60360DBFD066BE1FF0F76E5FF177FE8FF1C84EAFF
                  1D85EAFF1E87EBFF1F89EBFF218BECFF238CECFF258EEDFF2690EDFF2793EEFF
                  2995EFFF2B97EFFF2E98F0FF309BF1FF329DF1FF359FF2FF38A1F2FF3AA2F3FF
                  3DA5F3FF40A7F4FF43A9F4FF47ACF4FF49AEF5FF4DB0F6FF50B3F6FF54B6F6FF
                  58B8F7FF5DBBF7FF61BDF7FF66BFF7FF6AC2F8FF6FC5F8FF73C7F8FF78C9F9FF
                  7DCBF9FF83CEFAFF89D1FBFF8FD3FBFF95D6FCFF9BD9FCFFA3DCFCFFAADFFCFF
                  B1E2FDFFB9E6FDFFC1E9FDFFC9ECFDFFD0EFFDFFD2EFFEFFC2E9FDFF98D8FBFF
                  59BDF9FF1EA3F6FF0498F6FF0398F3ED0385CC94013C5A1D0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000001610011161650238B2C8035BD8FA056DE2FF0E75E5FF
                  1881E9FF1E88EBFF228BECFF238DECFF258FEDFF2690EDFF2893EEFF2A95EFFF
                  2C97F0FF2E99F0FF309BF1FF329EF2FF35A0F2FF38A1F3FF3BA3F3FF3EA5F4FF
                  41A7F4FF44AAF4FF47ADF5FF4AAFF5FF4EB1F6FF51B4F6FF55B6F7FF59B9F7FF
                  5EBBF7FF62BDF7FF67C0F7FF6BC3F8FF70C5F8FF74C7F9FF79C9F9FF7FCCFAFF
                  84CFFAFF8AD2FBFF90D4FCFF96D6FCFF9DD9FCFFA4DDFCFFABE0FCFFB3E3FDFF
                  BBE6FDFFC2E9FDFFC9ECFDFFC6EBFDFFB2E3FDFF81CDFAFF44B2F7FF169DF5FF
                  0395F4FE0394EFE2037BC28B013B5C2B00060901000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000150E010B5C4C0229AEAE0351D0F6
                  046BE2FF0972E5FF137CE8FF1E87EBFF2691EEFF2893EEFF2A96EFFF2C98F0FF
                  2F9AF0FF319CF1FF339EF2FF36A0F2FF39A1F3FF3BA3F3FF3FA6F4FF41A8F4FF
                  45ABF4FF47ADF5FF4BAFF5FF4FB2F6FF52B4F6FF56B7F7FF5ABAF7FF5FBCF7FF
                  63BEF7FF68C0F7FF6CC3F8FF71C6F8FF75C8F9FF7ACAF9FF80CCFAFF85CFFAFF
                  8CD2FBFF91D5FCFF97D7FCFF9FDAFCFFA6DDFCFFACE1FCFFB4E4FDFFBBE6FDFF
                  B9E6FDFFACE1FCFF87D0FAFF55B7F7FF25A0F4FF0B95F4FF0391F1FD048EEBCE
                  025C9775011D2E1D000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000F0500043824
                  01146E7B0238C0D3025DD9FD0570E5FF0974E6FF147FE9FF208BECFF2B97F0FF
                  319CF1FF339FF2FF37A1F3FF39A2F3FF3CA4F4FF3FA6F4FF42A9F4FF45ACF4FF
                  48AEF5FF4CB0F6FF4FB3F6FF52B5F7FF57B7F7FF5BBAF7FF5FBCF7FF64BFF7FF
                  69C1F8FF6DC4F8FF71C6F9FF76C8F9FF7BCBF9FF81CDFAFF87D0FAFF8DD2FBFF
                  92D5FCFF98D8FCFFA0DBFCFFA7DEFCFFA8DFFCFFA4DDFCFF96D7FBFF6FC3F8FF
                  47AEF5FF209BF2FF0B92F3FF038EF2FF0389EAED0378CD9E02385F42000F190C
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000030300023C2E011174800234B5CD0254D3F30369E1FC046EE4FF
                  0D78E8FF1883EAFF248EEDFF309AF0FF39A2F3FF3FA6F3FF44ABF4FF48AEF5FF
                  4CB0F6FF50B3F6FF53B5F7FF58B8F7FF5CBAF8FF60BCF8FF65BFF7FF6AC2F8FF
                  6EC5F8FF73C7F9FF77C9F9FF7CCBF9FF81CDFAFF86D0FBFF8BD2FBFF8BD2FBFF
                  89D1FAFF83CEFAFF75C6F8FF59B6F6FF3DA7F3FF2299F1FF0A8CF0FF048AF0FE
                  0388EDF7037BDAE30473CF9E023C6D4E00192E0A000203010000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000013D220008545B01209998
                  0238B4D00252D2E90264DEFB026AE2FF0673E6FF0D7CE9FF1582EBFF1D89ECFF
                  2691EEFF2E98EFFF379FF1FF3EA4F2FF47ACF5FF4AAEF5FF4DB0F5FF50B2F5FF
                  54B4F5FF56B5F6FF51B1F4FF4EAFF4FF46AAF3FF3DA4F2FF329DF1FF2596F0FF
                  1990EFFF0B88EEFF0382ECFF0382ECFE037FE8F10372D5DD0362BAB20356A871
                  012A5139000A1307000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000140300022F2300073E460118856F02258D9A0235A9BF0248CBD20254D3E4
                  025FDAF30266DDFF0269DFFF036FE3FF026FE3FF0270E4FF0271E4FF0272E4FF
                  0273E5FF0275E6FF0276E6FF0375E5FF0375E5FF0374E3F90370E0EB036CDCD9
                  035FC4C7034DA1AC034A9E80012A5C51011B3C320011240E0000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000585A6702595D7A10595D7A1E
                  595E7B2959617C325A72C74C5A7AD3515A7CD4695A7ED56C5A7FD66C5B81D76C
                  5B83D86C5B85D96C5B87D95A5B86D84F5A78AF3B59667F2E59677F2359688015
                  5962710700000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000001FFFFFFFFFFFFFFFFFFFFF
                  FFF000000000FFFFFFFFFFFFFFFFFFFFFF00000000000FFFFFFFFFFFFFFFFFFF
                  F8000000000000FFFFFFFFFFFFFFFFFFC00000000000001FFFFFFFFFFFFFFFFE
                  0000000000000007FFFFFFFFFFFFFFF80000000000000001FFFFFFFFFFFFFFE0
                  00000000000000003FFFFFFFFFFFFF8000000000000000000FFFFFFFFFFFFE00
                  000000000000000007FFFFFFFFFFFC00000000000000000001FFFFFFFFFFF000
                  000000000000000000FFFFFFFFFFE0000000000000000000003FFFFFFFFF8000
                  0000000000000000001FFFFFFFFF000000000000000000000007FFFFFFFE0000
                  00000000000000000003FFFFFFFC000000000000000000000001FFFFFFF80000
                  00000000000000000000FFFFFFF00000000000000000000000007FFFFFE00000
                  000000000000000000003FFFFFC00000000000000000000000001FFFFF800000
                  000000000000000000001FFFFF800000000000000000000000000FFFFF000000
                  0000000000000000000007FFFE0000000000000000000000000003FFFE000000
                  0000000000000000000003FFFC0000000000000000000000000001FFF8000000
                  0000000000000000000001FFF80000000000000000000000000000FFF8000000
                  0000000000000000000000FFF000000000000000000000000000007FF0000000
                  00000000000000000000007FE000000000000000000000000000007FE0000000
                  00000000000000000000003FE000000000000000000000000000003FE0000000
                  00000000000000000000003FC000000000000000000000000000003FC0000000
                  00000000000000000000001FC000000000000000000000000000001FC0000000
                  00000000000000000000001FC000000000000000000000000000001FC0000000
                  00000000000000000000001FC000000000000000000000000000001FC0000000
                  00000000000000000000001FC000000000000000000000000000001FC0000000
                  00000000000000000000001FC000000000000000000000000000001FE0000000
                  00000000000000000000001FE000000000000000000000000000001FE0000000
                  00000000000000000000001FF000000000000000000000000000001FF0000000
                  00000000000000000000001FF000000000000000000000000000001FF8000000
                  00000000000000000000001FF800000000000000000000000000001FFC000000
                  00000000000000000000001FFC00000000000000000000000000001FFE000000
                  00000000000000000000001FFE00000000000000000000000000001FFF000000
                  00000000000000000000001FFF80000000000000000000000000001FFFC00000
                  00000000000000000000001FFFC0000000000000000000000000001FFFE00000
                  00000000000000000000001FFFF0000000000000000000000000001FFFF80000
                  00000000000000000000001FFFFC000000000000000000000000001FFFFC0000
                  00000000000000000000001FFFFC000000000000000000000000001FFFFC0000
                  00000000000000000000001FFFFC000000000000000000000000003FFFFC0000
                  00000000000000000000003FFFFC000000000000000000000000003FFFFC0000
                  00000000000000000000003FFFFE000000000000000000000000003FFFFE0000
                  00000000000000000000007FFFFE000000000000000000000000007FFFFF0000
                  00000000000000000000007FFFFF00000000000000000000000000FFFFFF0000
                  0000000000000000000000FFFFFF80000000000000000000000001FFFFFF8000
                  0000000000000000000001FFFFFFC0000000000000000000000001FFFFFFC000
                  0000000000000000000003FFFFFFE0000000000000000000000003FFFFFFF000
                  0000000000000000000007FFFFFFF000000000000000000000000FFFFFFFF800
                  000000000000000000000FFFFFFFFC00000000000000000000001FFFFFFFFC00
                  000000000000000000003FFFFFFFFE00000000000000000000007FFFFFFFFF00
                  00000000000000000000FFFFFFFFFF8000000000000000000001FFFFFFFFFFC0
                  00000000000000000003FFFFFFFFFFE000000000000000000007FFFFFFFFFFF0
                  0000000000000000000FFFFFFFFFFFFC0000000000000000001FFFFFFFFFFFFE
                  0000000000000000003FFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFF
                  C00000000000000001FFFFFFFFFFFFFFE00000000000000007FFFFFFFFFFFFFF
                  F8000000000000001FFFFFFFFFFFFFFFFE000000000000003FFFFFFFFFFFFFFF
                  FF80000000000001FFFFFFFFFFFFFFFFFFE0000000000007FFFFFFFFFFFFFFFF
                  FFFC00000000001FFFFFFFFFFFFFFFFFFFFFC000000001FFFFFFFFFFFFFFFFFF
                  FFFFF80000001FFFFFFFFFFFFFFFFFFFFFFFFFC00003FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = FileExit1Click
              end
            end
          end
        end
      end
    end
  end
  object PanelTopMenu: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 5
    object ImgBanner: TImage
      Left = 4
      Top = 4
      Width = 292
      Height = 55
      Stretch = True
      Transparent = True
    end
    object Panel3: TPanel
      Left = 216
      Top = 0
      Width = 414
      Height = 64
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        414
        64)
      object lblTanggal: TLabel
        Left = 304
        Top = 15
        Width = 65
        Height = 16
        Alignment = taRightJustify
        Anchors = [akTop]
        Caption = 'lblTanggal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 136
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblUserLocation: TLabel
        Left = 278
        Top = 35
        Width = 94
        Height = 16
        Cursor = crHandPoint
        Alignment = taRightJustify
        Anchors = [akTop]
        Caption = 'lblUserLocation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 136
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = lblUserLocationClick
      end
      object ImageButton2: TImageButton
        Left = 376
        Top = 16
        Width = 32
        Height = 32
        Cursor = crHandPoint
        AutoSize = True
        PictNormal.Data = {
          055449636F6E0000010001002020000000000000A80800001600000028000000
          2000000040000000010008000000000080040000000000000000000000010000
          00000000FFFFFF00C0CFC000E0EFE000EFEFEF00F0F0F000DFE0DF00BFBFBF00
          FFFFCF00FFEFCF00FFCF9000AFB0AF00EFCFA000FF906000DFDFDF00FF909000
          CFCFCF00CF909000CF906000FF902F00FFCFCF00A09F9F0090909000CF606000
          CF602F007070700080808000EFFFFF007F7F7F005F5F5F0060606000D0D0D000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000001F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F151B1B1B1B1B1B1B1B1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F14150A0F0D0D1E06151D181B1B1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F141E00001A1A1A1A0000030A1D1B1B1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F0A0000030D0A10100B1E0204000518181B1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1E001A0510171717161717110603000418181B1F1F
          1F1F1F1F1F1F1F1F1F1F0600040F16171717010410171717110200031D181B1F
          1F1F1F1F1F1F1F1F1F06001A0F17171717160D000B171717171103000F1C181F
          1F1F1F1F1F1F1F1F1F050002161717171717100B1617171717171004001B181B
          1F1F1F1F1F1F1F1F010400101717171717171717171717171717170D00011818
          1F1F1F1F1F1F1F1F080003161717171717170602111717171717171000031818
          1F1F1F1F1F1F1F1F020013171717171717170F000B1717171717171104001B18
          1F1F1F1F1F1F1F1F02000B17171717171717101A031117171717171603001918
          1F1F1F1F1F1F1F1F02000B171717171717171706000311171717171603001918
          1F1F1F1F1F1F1F1F02000B171717171717171717010002171717171104001518
          1F1F1F1F1F1F1F1F020008161717171717171717160200101717171100001518
          1F1F1F1F1F1F1F1F0200000C1217170B13111717170D000B1717170B00031518
          1F1F1F1F1F1F1F1F010400130C0C160F0002111710040010171711040006151F
          1F1F1F1F1F1F1F1F1F020000090C0C100200040200000211120C13000014151F
          1F1F1F1F1F1F1F1F1F0103000009090C0B0D020202050E0C0C0B00000F0A1F1F
          1F1F1F1F1F1F1F1F1F1F01000000080909090B0B0B090C09080000020A1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F010400000007070808090808000000030A1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F0103000000000000000000000005061F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F0102030000000000000403011F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F01020202030202011F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007FFFFC001FFFF8000FF
          FF00007FFE00003FFC00001FF800001FF800000FF000000FF000000FF000000F
          F000000FF000000FF000000FF000000FF000000FF000001FF800001FF800003F
          FC00007FFE0000FFFF0001FFFF8007FFFFE01FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF}
        OnClick = ImageButton2Click
      end
    end
  end
  object ImageList: TImageList
    Height = 32
    Width = 32
    Left = 64
    Top = 120
    Bitmap = {
      494C010110001300040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000A000000001002000000000000040
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F6F6FFE8E8
      E8FFE4E4E4FFF6F6F6FF00000000000000000000000000000000E3E3E3FFC8C8
      C8FFE5E5E5FFF7F7F7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E5FF9D9D9DFFD4D4D4FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F3FFCECECEFF9C9C9CFF646464FF303030FF4F4F
      4FFF8E8E8EFF9A9A9AFFF8F8F8FF0000000000000000E2DFDFFF9B3C38FF8A41
      38FF744B4AFF7A6A6AFF9A9A9AFFC2C2C2FFE1E1E1FFF6F6F6FF000000000000
      0000FCFCFCFFF6F6F6FF00000000000000000000000000000000000000000000
      0000FAFAFAFFFAFAFAFFF7F7F7FFAEAEAEFFAEAEAEFFFFFFFFFF7A7A7AFFF3F3
      F3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F0FFA6A6A6FF656565FF303030FF0C0B0AFF181616FF131312FF0D0C
      0AFF4E4E4EFFE2E2E2FF000000000000000000000000C0B1B0FFA94838FFD16E
      3DFFCF693BFFC15B37FFB34D35FF924437FF774746FF7A6565FF959494FF9292
      92FFB7B8B8FFAEAEAEFF878787FFFEFEFEFF00000000E8E8E8FFE5E5E5FF9C9C
      9CFFB1B1B1FFA1A1A1FF686868FFD1D1D1FFE2E2E2FFE0E0E0FF9A9A9AFF9D9D
      9DFFF5F5F5FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4F4F4FFB6B6
      B6FF777777FF6B6B6BFF333232FF3A3835FF403C3AFF34322FFF363433FF3735
      34FF25211FFF2B2827FFECEBEBFF0000000000000000B5A4A3FFAE5041FFD06F
      3FFFCF6E3EFFCF6D3DFFCF6D3CFFD06C3BFFCF6A3AFFC45D36FFA15746FFE7EB
      ECFFB5A3A3FFC4B8B8FFDCDDDDFF8C8C8CFFB1B1B1FF9A9A9AFF939393FFADAD
      ADFFF1F1F1FFE9E9E9FF787878FFAAAAAAFFA6A6A6FFA6A6A6FFAEADADFF706F
      6FFFB8B8B8FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C6FF989898FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F1FFB5B5B5FF727272FF5B5B
      5BFF969696FFA7A8A8FF4A4643FF1E1D1AFF000000FF151515FF292928FF1A18
      17FF363432FF1F1C1BFF393535FF0000000000000000AC9797FFB15648FFD070
      3FFFD06D3EFFD06E3FFFD06E3EFFCF6D3DFFCF6C3DFFCF6B39FFB6846CFFE2E7
      EAFF82482EFFA36A53FFE6EBEDFF784840FF9C746FFFFFFFFFFFF5F5F5FFC8C8
      C8FFE5E5E5FFE4E4E4FF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4
      D4FF727272FFF7F7F7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A7A7A7FFA5A5A5FFB7B7B7FF999999FF909090FFC9C9C9FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8E8E8FFABABABFF757575FF727272FF9D9D9DFFDBDB
      DBFFFEFEFEFF595755FF0C0A09FF000000FF9D9D9DFF00000000000000006564
      63FF12110EFF33302FFF181614FFB6B6B5FF00000000A58C8BFFB66051FFD06F
      40FFD06F40FFD06F3EFFD06D3FFFD06E3DFFCE6C3EFFD06B3AFFB5846DFFE0E2
      E3FFC8C9CAFFCFD2D3FFDEE1E2FF986045FFC78B6DFFFFFFFFFFF8F8F8FFB1B1
      B1FFDEDEDEFFCBCBCBFFC5C5C5FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFD5D5
      D5FF787676FFBBBBBBFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F6FFEBEBEBFFE0E0E0FFD6D6
      D6FFD4D4D4FFDEDEDEFFF1F1F1FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D5FF9D9D9DFFC4C4C4FFDADADAFFBCBCBCFFB7B7B7FFB4B4B4FF8E8E8EFF8F8F
      8FFFC6C6C6FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FDFFD7D7D7FF9B9B9BFF797979FF959595FFD2D2D2FF00000000000000000000
      0000B4B3B3FF0E0C0CFF000000FF939293FFF8F7F7FFFFFEFFFFD4D3D2FF0D0C
      0AFF2B2B2BFF211D1CFF23201FFF71706FFF00000000AD8583FFBD6B5AFFCC6D
      40FFD07041FFD0703FFFD06F40FFD06D3FFFD06E3DFFCF6B3BFFB3816BFFDADC
      DEFFDEDEDEFFDEDEDEFFD7D9DBFF966044FFB39485FFFDFEFFFFFEFEFEFFE3E3
      E3FFC8C8C8FF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFCFCF
      CFFFCFCFCFFF767676FFE3E3E3FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F0FFCFCFCFFFB3B3B3FF9C9C9CFF919191FF8D8D8DFF8C8C8CFF8B8B
      8BFF898989FF828282FF7B7B7BFFA0A0A0FFF7F7F7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2B2B2FFAFAF
      AFFFD9D9D9FFD9D9D9FFD6D6D6FFBABABAFFB5B5B5FFB7B7B7FF929292FF3131
      31FF616161FF878787FFB8B8B8FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E6FFB6B6B6FF8686
      86FF828282FFBCBCBCFF0000000000000000F6F6F5FFB4B0AEFF87786EFF897E
      74FF3B3B39FF000000FF807E80FFD3D2D0FF7E7D7AFFC0BFBEFF504F50FF6B6A
      6AFFF1F0F1FF272724FF252622FF444343FF00000000A67A79FFC37564FFC869
      3FFFD17040FFCF6F40FFCF6F40FFCF6E3FFFD06E3EFFD16C3CFFB1816AFFD4D6
      D7FFD7D7D7FFD7D7D7FFD1D3D5FF976045FFC38F77FFFBFDFFFFFCFCFCFFE6E5
      E3FFBEBDBBFF9D9C99FFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFCECE
      CEFFC1C1C1FFDADADAFF959595FFFBFBFBFF0000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFCFFCCCCCCFF9D9D
      9DFF8E8E8EFF878787FF7A7A7BFF6B6D86FF5B5E89FF464C9CFF323AB1FF252C
      B5FF1C24C8FF5055A4FF828282FF5F5F5FFFB7B7B7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1E1E1FFABABABFFCDCDCDFFE0E0
      E0FFDBDBDBFFD9D9D9FFDADADAFFBBBBBBFFB6B6B6FFB8B8B8FF959595FF3A3A
      3AFF3E3E3EFF343434FF949494FF7D7D7DFFAAAAAAFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F7FFEBEBEBFFE2E2E2FFCECECEFFA6A6A6FF909090FF787878FF969696FFDFDF
      DFFF00000000D7D7D7FFAEA6A2FF675F57FF416777FF442F1EFF3C2512FF4C42
      3AFF0E0B0CFF131213FFB8B4B2FF212121FF3E3E3EFF4B4A4AFFCAC6C9FF5A59
      58FFD3D2D2FF4B4B48FF2B2B29FF373533FF00000000A07270FFC97F6EFFCA76
      55FFD68358FFD37B50FFD2784CFFD17548FFCF7143FFD16C3CFFB07F68FFCED1
      D2FFD3D3D3FFD3D3D3FFCBCECFFF976145FFCB8F71FFF9FCFDFFF7F6F4FF8392
      CAFF7C8EC3FF6376AEFF999FBDFFFCFBF8FFFBFBFBFFF8F8F8FFF9F9F9FFCDCD
      CDFFBDBDBDFFF9F9F9FF908F8FFFCDCDCDFF0000000000000000000000000000
      0000000000000000000000000000F7F7F7FFB8B8B8FF848484FF828282FF8A8A
      8AFF5F618EFF3E47C0FF2531EDFF101DFCFF030DD3FF040CB3FF030A9AFF0308
      7FFF060E8EFF13186AFF080808FF1A1A17FFC0C0C0FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3C3C3FFBABABAFFE2E2E2FFE3E3E3FFDDDD
      DDFFDCDCDCFFDADADAFFDBDBDBFFBEBEBEFFB8B8B8FFBABABAFF959595FF4040
      40FF474747FF393939FFA9A9A9FFB1B1B1FF8D8D8DFFB1B1B1FF000000000000
      00000000000000000000000000000000000000000000FBFBFBFFB8B8B8FF8989
      89FF8F8F8FFF616161FF0A0908FF050403FF434343FF00000000F6F6F6FF9491
      8FFF6E645FFF5B4B41FF563A2AFF404A4DFF323A38FF290C00FF281A16FF2A28
      29FF080B0DFF054052FF313130FF212226FF000000FF6D6B6AFFA9A8A9FF2C2C
      2AFF9B9A99FF474542FF2F2D2BFF504F4EFF000000009B6A67FFD18E79FFC978
      5BFFD98C67FFD78A63FFD88760FFD7855DFFD68259FFD67E53FFB08570FFCBCD
      CEFFCFCFCFFFCFCFCFFFC7C9CBFF935D43FFCC8F71FFFDFEFBFF6890E5FF8CCE
      FFFF96D4FFFF97D6FFFF66A7F9FF8B94B6FFFDFCFAFFF7F7F7FFF6F6F6FFCCCC
      CCFFBDBDBDFFEFEFEFFFEEEDEDFFA3A3A3FF0000000000000000000000000000
      00000000000000000000B7B7B7FF7F7F7FFF838383FF8B8B8BFF5E6296FF2333
      F8FF1625FFFF0F17E6FF0C105BFF02023CFF030132FF030030FF030232FF0403
      38FF04033DFF0C0F47FF141200FF141307FF4C4A45FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4B4B4FFEDEDEDFFE5E5E5FFE2E2E2FFE0E0
      E0FFDFDFDFFFDDDDDDFFDFDFDFFFBEBEBEFFB9B9B9FFBDBDBDFF979797FF4747
      47FF4C4C4CFF3F3F3FFF9F9F9FFFB1B1B1FFA1A1A1FFA5A5A5FF000000000000
      00000000000000000000000000000000000000000000FEFEFEFFE3E3E3FFDFDF
      DFFFF3F3F3FF4A4844FF353330FF171718FF0C0E11FF6C6A68FF64554EFF6C5D
      50FF5F5042FF4A3829FF4E3E2FFF3E1C05FF48260CFF696B66FF212325FF211A
      14FF1C1311FF003644FF1A1B1BFF441A00FF0B0907FFCDCDCDFF28292AFF3837
      35FF9D9C9BFF242221FF3F3B39FF8B8A88FF000000009B6561FFD99A86FFC779
      60FFDD9874FFDC946FFFDB916DFFDA8D68FFD98C66FFD9855DFFA6968EFFCBCC
      CDFFCCCCCCFFCDCDCDFFCBCCCCFF877871FFB78167FFFDFCF8FF458AECFF72C8
      FFFF70C6FFFF70C6FFFF6DC4FFFF6482C5FFFCFBF8FFF3F3F3FFF4F4F4FFCACA
      CAFFBDBDBDFFDBDBDBFFAFAFAFFFACABABFF0000000000000000000000000000
      0000D8D8D8FF868686FF818181FF909090FF666B9FFF2E3AFBFF0F1AFFFF0408
      AEFF05032AFF060204FF000046FF000350FF020354FF020354FF020452FF0103
      52FF03014EFF00005FFF151436FF181700FF1C1914FFC0C0BEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BEBEBEFFEDEDEDFFE6E6E6FFE5E5E5FFE3E3
      E3FFE1E1E1FFDFDFDFFFE0E0E0FFC0C0C0FFBBBBBBFFBCBCBCFF959595FF4949
      49FF505050FF444444FF949494FFB4B4B4FFA8A8A8FF9A9A9AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000949290FF110F0DFF080503FF1D1D1EFF533017FF824821FF6E5541FF5243
      35FF523D2FFF594133FF43230BFF4C3221FF655F5AFF3E3D3DFF5F5B54FF2928
      28FF1C1B17FF1A1111FF7B7572FF4B1900FF2B2625FF403D3DFF000000FF9B9A
      99FF716F6EFF363332FF454241FFBEBDBDFF00000000B06761FFE0A993FFC378
      64FFE1A283FFDF9D7DFFDD9A7BFFDC9977FFDD9672FFB18C7AFFCBCED0FFD6D6
      D6FFCECECEFFCBCBCBFFCCCCCCFFC2C3C4FF807975FFFCF9F4FF2A7FEAFF43B4
      FFFF42B4FFFF42B4FFFF3EAFFFFF5F7FC4FFF9F8F5FFF2F2F2FFF2F2F2FFC9C9
      C9FFA4A4A4FF909090FFDDDDDDFFCDCDCDFF000000000000000000000000ABAB
      ABFF797979FF919191FF686B93FF3848FFFF303CFFFF0A0D96FF04010DFF0A07
      00FF040430FF000156FF00015CFF000263FF000165FF000165FF000164FF0002
      62FF00015BFF000056FF02025CFF1C1903FF1B1B0DFF5C5B56FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6FFEFEFEFFFE9E9E9FFE7E7E7FFE6E6
      E6FFE3E3E3FFE1E1E1FFE2E2E2FFC2C2C2FFBDBDBDFFBEBEBEFFA4A4A4FF6E6E
      6EFF5D5D5DFF3F3F3FFF878787FFB7B7B7FFB0B0B0FF8E8E8EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000111417FF000001FF7F8382FF838A8BFF7D8383FF333332FF61554CFF5E33
      15FF5E4131FF55331EFF736E67FF89949AFF5C5E5FFF1D1918FF5E5952FF352C
      26FF040505FF25292CFF5D4E43FF43190FFFB8B9B9FF1B1C1FFF514F4BFFB2B0
      AFFF282626FF595655FF5E5C58FFF6F6F6FF00000000AE615AFFE7B6A1FFC077
      66FFE4AE91FFE1A98BFFE2A689FFE1A285FFE19E7EFFB6B7B5FFE1E1E1FFE0E0
      E0FFE1E2E2FFD8D8D9FFCBCBCBFFCCCCCCFF979897FFE9E4DEFF0C71EBFF13A3
      FFFF15A0FFFF19A3FFFF159EFEFF5779C2FFF7F5F2FFEFEFEFFFEFEFEFFFC7C7
      C7FFA9A9A9FFE7E7E7FFBBBBBBFFEAEAEAFF00000000FAFAFAFF929292FF8585
      85FF808092FF2A35CCFF1C2BFFFF1417A8FF010010FF060400FF060536FF0004
      9FFF04088FFF030465FF02067DFF030B88FF040B85FF040C87FF060C8DFF050C
      8EFF050B84FF020877FF000083FF141332FF242200FF29261FFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BCBCBCFFCFCFCFFFF1F1F1FFECECECFFEAEAEAFFE8E8
      E8FFE6E6E6FFE3E3E3FFE5E5E5FFC3C3C3FFBFBFBFFFBDBDBDFFBFBFBFFFC1C1
      C1FFB6B6B6FFA4A4A4FF9D9D9DFFB7B7B7FFBABABAFF7A7A7AFF000000000000
      000000000000000000000000000000000000000000000000000000000000BBBA
      B9FF030000FF919595FF9A9C9BFF666462FF486164FF6B7C81FF6D615CFF6242
      2FFF502F18FF70695EFF959EA5FF7B7D7CFF696D6BFF252625FF3F4143FF5E55
      51FF020000FF404748FF3D1D0EFF390F00FF434649FF202021FF010101FF0001
      08FF2D353EFF6A6E6DFFBBBAB9FF0000000000000000AE5F58FFEABEA9FFC37D
      6EFFE8B8A0FFE6B299FFE5B197FFE3AE93FFE3A98BFFC8CBCCFFE5E5E5FFE3E3
      E4FFBAADA7FFC2B9B6FFE4E5E5FFDEDEDEFFBFBFBFFFDBD8D3FF3F8AEEFF58BD
      FFFF4CB7FFFF119EFFFF008FFEFF5377C2FFF5F3EFFFECECECFFEBEBEBFFC1C1
      C1FFD5D5D5FFD0D0D0FF9C9C9CFFFBFBFBFFFBFBFBFF979797FF878787FF575D
      A3FF061AFFFF020ADAFF030322FF060300FF060643FF0309B1FF030AA8FF0A0D
      31FF0B0A2BFF050BA1FF040A9FFF0209A1FF0208A2FF0006A6FF0004ABFF0002
      AFFF0000AFFF0000B5FF0001B8FF020996FF342D00FF3C382AFF888894FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CACACAFF9C9C9CFFB1B1B1FFD6D6D6FFF4F4F4FFEFEFEFFFEDEDEDFFEAEA
      EAFFEBEAE8FFF0EDE5FFFBF7E4FFDBD9C5FFD3D1C1FFC9C8BFFFC0C0BDFFBBBB
      BBFFBCBCBCFFBCBCBCFFBABABAFFB8B8B8FFBFBFBFFF727272FF8D8D8DFFB8B8
      B8FF00000000000000000000000000000000000000000000000000000000A2A1
      A0FF81807EFF484643FF292422FF717170FF4F5E5EFF13171BFF462B1CFF7164
      55FF5D4A3BFF9EAAADFF818281FF7C7C7AFF82898AFF7C7C7DFF100906FF0000
      00FF190908FF779698FF4B1E08FF421800FF1D0900FF000000FF040000FF552C
      09FF58351AFF252628FF000000000000000000000000AF5D55FFEDC4B0FFC583
      75FFEBC2ADFFE8BEA8FFE7BBA5FFE8B7A1FFE8B59BFFC3C6C7FFE9E9E9FFD6D8
      D9FFB88770FFC89983FFE2E5E5FFE9E9E9FFBDBDBDFFEEECE8FF629BEEFF7FCD
      FFFF7ECBFFFF82CDFFFF7CC9FFFF718AC5FFC1C0BDFF8D8D8DFFA6A6A6FFBEBE
      BEFFF9F9F9FFE5E5E5FFA7A6A6FF00000000E9E9E9FF787878FF3139C7FF0818
      FFFF030666FF0B0700FF08092DFF030AA9FF070CA0FF0A0C2CFF0A0819FF0308
      6DFF000BD9FF0004C3FF0003CEFF0004E4FF0003F6FF0003FFFF090EFAFF0D13
      F4FF1D20E1FF232CC4FF151DBFFF0004FFFF383836FF4B4610FF474B89FF6469
      A3FFBFBFBFFFE9E9E9FF00000000000000000000000000000000D6D6D6FFAAAA
      AAFFBFBFBFFFDBDBDBFFC4C4C4FFDADADAFFF7F7F7FFF1F1F1FFF3F2EFFFFBF8
      ECFFFFFEE9FFB1BDEBFF2F5CFFFF0006C1FF3D46B9FF868ABDFFC9CAC1FFD4D3
      BFFFCBCABEFFC1C1BBFFBBBBBAFFBABABAFFC2C2C2FF7B7B7BFF3D3D3DFF5D5D
      5DFF8E8E8EFF8F8F8FFF00000000000000000000000000000000000000005657
      56FFFDFEFCFF696765FF000000FF000000FF0B0F11FF2A1C11FF87837EFF9186
      7EFF9E9691FF6B7376FF8E9295FF91999FFF7E8180FF462B14FF562E0DFF0F00
      00FF1B282FFF8DAEAAFF502306FFB07E55FF875531FF67300DFFC89064FFFECE
      A2FFF5BD8DFFC19A7AFF000000000000000000000000B16057FFF0CAB7FFC686
      79FFEECDBBFFEDC6B5FFECC5B2FFEBC1ADFFEBC0AAFFC0B3ADFFEDEEEEFFD5D7
      D8FFBC927DFFCDA38FFFE5E7E8FFEDEEEEFFAEADACFFFFFFFFFF79A4EDFFA5DC
      FEFFA2D9FFFFA2D9FFFFAADFFFFF788DC8FFD1D0CDFFFAFAFAFFD7D6D6FFF6F6
      F6FFFFFFFFFFB2B1B1FFF9F9F9FF00000000EAEAEAFF1E2AD9FF1521F8FF0906
      17FF0B0A09FF020794FF030993FF09092FFF06051EFF040A9AFF0711FFFF030F
      E9FF000695FF0008EEFF293AFFFF3C4CFFFF2C379EFF3E4468FF404536FF3B3F
      20FF454712FF3B3A00FF212119FF0000F0FF222697FF6C610DFF2A2A21FF3139
      A0FF13196AFF3A371EFF000000000000000000000000DCDCDCFFBABABAFFE2E2
      E2FFDFDFDFFFDDDDDDFFBEBEBEFFE1E1E0FFFFFFFAFFFFFFF4FFFFFDF0FF90A6
      F4FF1647FEFF002FFFFF043AFFFF0018CEFF0007BAFF0002BCFF0000B9FF1C28
      BAFF6269BAFFA9ABBDFFD7D5BFFFCFCEBFFFCECDC5FF868583FF4A4A4AFF4040
      40FFCDCDCDFF878787FFC5C5C5FF000000000000000000000000969797FF6060
      5EFF73736EFF040306FF503E37FF635E56FF4C4B4AFF746C64FF9AAAB2FF7559
      44FF26292BFF4B5458FF84837FFF605449FF4A2C15FF3A1C07FF2D3D4DFF3E30
      25FF5E5C4CFF5A777EFF050002FF886244FF835334FF915E3AFFE4C7B0FFD3B2
      9BFFEADBCFFF000000000000000000000000FDFDFDFFB4685EFFF2D0BEFFC383
      76FFF3D9C9FFEFD1C2FFEFCEBEFFEECCBBFFEDCAB8FFE2BEACFFC4C1C0FFC1C3
      C3FFDAB19BFFD7B09EFFD8DBDDFFC1BCBAFFC8ADA1FFFFFFFFFF9DB0EAFFA6CB
      F7FFB7DCFCFFB9DCFBFF85A9F2FFC6C9DCFFD9D8D8FFD5D5D5FFFDFDFDFFE3E3
      E3FFBAB9B9FF000000000000000000000000B5B8E3FF151ED1FF141220FF060C
      5BFF0007ABFF08083AFF0A0A2BFF060DB1FF111CFFFF161DBEFF080926FF0000
      00FF20257AFF4D63FFFF2731A5FF747000FF68672AFF656433FF363613FF4346
      2AFF232410FF4E5036FF898C6DFF0000BEFF0719FFFF4F4A32FF241E00FF252A
      47FF1B2081FF33346BFFD6D6CEFF0000000000000000D5D5D5FFCFCFCFFFE6E6
      E6FFE0E0E0FFE2E2E0FFC2C1B8FFFFFBE5FFEFF2FBFF708FFAFF083EFFFF093E
      FFFF1144FFFF1244FFFF1045FFFF0526DCFF0014C3FF0014C3FF0013C0FF000C
      BDFF0003B9FF0000B4FF0007B1FF4046B3FF8C8EC0FF868689FF585852FF3C3C
      3CFFC3C3C3FF919191FFB7B7B7FF0000000000000000DEDEDEFF353635FF9394
      8DFF292A27FF000000FF481700FF3F1604FF433C3CFFA3ABB0FF564B40FF5B56
      50FF5C5450FF583629FF2A0600FF391C00FF482D14FF100000FF003589FF0C46
      79FF552800FF1A150EFF000006FF000406FF495E5DFF22110BFFCDC8C3FF0000
      000000000000000000000000000000000000F8F7F7FFB97168FFF3D4C4FFE1B5
      A6FFC5877CFFE1B7AAFFEDCCBDFFF2D8C9FFF1D5C6FFF2D4C5FFEDCEBDFFDDBF
      AFFFEECBB9FFEDC8B5FFD1B2A3FFE7BDA7FFDAC1B4FFFDFFFFFFFFFFFDFFD7DC
      F5FFC9D0F0FFC6CFF1FFEFF1F5FFE2E3E2FFD9D9DAFFFEFFFFFFADADADFFF2F2
      F2FF00000000000000000000000000000000EBEDF3FF201F2FFF111691FF070B
      67FF0B071AFF0B13AFFF0413FFFF0B107BFF000017FF040200FF222B87FF3C4D
      CFFF4D61FFFF2635F4FF0505D3FF646080FFA2A44DFFEBECB8FFF9F8D1FFFFFF
      F9FFFFFFFCFFFFFFFFFF928C6FFF0514E7FF243BFFFF2932CAFF0F0A00FF0000
      26FF00001FFF141653FFA5A69FFF0000000000000000D1D1D1FFDBDBDBFFEAEA
      EAFFE4E4E4FFEAEAE5FF7B85C4FF0A2EE5FF0E46FFFF184DFFFF1E50FFFF1D4F
      FFFF1A4CFFFF1648FFFF1347FFFF082DE6FF0016C9FF0017CAFF0016C7FF0014
      C3FF0012BFFF0010BAFF000BB6FF0001B0FF00009FFF000096FF66665DFF4141
      41FFAEAEAEFF9F9F9FFFA8A8A8FF0000000000000000737170FFADADABFF6C6B
      65FF000000FF6D5A4AFF583B29FF0D0405FF121212FF4E4F4EFF391F17FF2F0A
      00FF5E3918FF6D5A46FF4F4B4CFF260C00FF351F08FF271201FF1A6EABFF184F
      81FF270000FF290C00FF31160CFF4B5958FF576D72FF0E0401FF190A00FF3B5D
      83FF00000000000000000000000000000000F3F1F1FFBE7B71FFF4D7C8FFF7DA
      C9FFECC6B6FFDBAA9BFFCD9386FFC68576FFC78577FFC6867AFFC6867AFFEDCD
      BDFFF0D2C3FFEED0C1FFF0CEBEFFEECCBBFFE9C8B8FFE4C8BBFFE3C6B7FFE4C4
      B4FFE2C3B2FFE1BFADFFDEBBAAFFCAAEA2FFE8E2DFFFB3A7A7FF000000000000
      00000000000000000000000000000000000000000000474878FF0F136AFF1114
      70FF0C1BFBFF0C14A2FF080500FF27231DFF393EB2FF3B4FFFFF4A59FFFF4E5F
      FFFF0307DFFF0000DEFF0003F6FF0000FFFF0000B5FF00023AFF161A22FF1F23
      0EFF67673DFF363532FF00008CFF0000F0FF0309DBFFE8F0FFFF444EDFFF2429
      7CFF000008FF000018FF131248FFDADADAFF00000000CECECEFFE6E6E6FFEDED
      EDFFE9E9E8FFEBEBE9FFCAC9BEFF4B5ECFFF000FE0FF1F50FDFF285BFFFF2354
      FFFF1E4FFFFF1A4CFFFF184BFFFF0B36EEFF0019D0FF001BD1FF0019CDFF0017
      C9FF0015C6FF0013C1FF000DB9FF00009FFF3738A6FFD0CFC3FFBABAB6FFAFAF
      AFFFB4B4B4FFAAAAAAFF979797FF00000000EBEBEBFF3D3E3BFFD6D4D1FF6C69
      68FF1D1C1DFF39261FFF010102FF02080BFF393738FF080B0CFF4B413DFF4733
      28FF31190BFF1E0602FF0A0000FF0C0000FF220900FF2B0F00FF3B1E19FF3510
      04FF461D07FF855534FFBF8B66FFA27252FF250800FF0E0000FF341E11FF452F
      24FFE5E3E1FF000000000000000000000000EFEBEBFFC4847BFFF6DCCDFFF7DC
      CDFFF6D9C9FFF5D7C6FFF5D5C3FFF4D2BFFFF3CFBBFFF1CAB6FFEFC4AFFFBD74
      68FFF6DFD2FFF3DACDFFF1D7CAFFF1D4C6FFF0D2C2FFEFCFC0FFEFCDBDFFEECB
      BAFFEDC9B7FFECC6B4FFEBC4B0FFE3BAA8FFE0B8A4FFECDADAFF000000000000
      0000000000000000000000000000000000000000000050507DFF131BB1FF131F
      DFFF080722FF0B0B2AFF0000BAFF514DFFFF8F97EDFF4856FAFF8E99F6FF3539
      F2FF0000E1FF000CE2FF000BE1FF000BE4FF0007FCFF0009FFFF040EFFFF1521
      D5FF2F39B2FF3437E4FF3235FFFF3738D8FF4041C8FF888AEBFF0412DAFF535F
      E0FF42478BFF060410FF0B0E64FF5D5E70FF00000000C7C7C7FFF2F2F1FFF8F7
      F0FFFEFAEBFFFDF9E7FFD7D5C1FFEDE7C0FFA9ADC5FF0022DCFF1641F3FF2C5E
      FFFF2355FFFF1D4FFFFF1A4DFFFF0F3DF7FF001DD7FF001ED9FF001CD5FF001B
      D0FF0018CDFF0010BDFF00009FFFA8A3C6FFF0EDD0FFDFDDC4FFD3D1C2FFCBCA
      C0FFC4C4BEFFB8B8B6FF868686FF00000000484849FF868683FF747571FF595B
      5CFF303333FF150500FF502203FF7C4720FF685C51FF000000FF5D300CFF605E
      59FFB9B9BAFF90857DFF786559FF473224FF0D0000FF401D02FF4C1D00FF4E27
      0AFF543D25FF352317FF030000FF0A0000FF7B726BFF7B726BFF170500FF3017
      08FF564539FF000000000000000000000000EBE5E5FFC99085FFF8E0D2FFF8E0
      D1FFF7DDCEFFF6DAC9FFF5D7C7FFF4D4C3FFF2CFBDFFF2CDBBFFF1CBB6FFE4B5
      A1FFBF796DFFDBB0A6FFE7C6B9FFF3DACFFFF5DED2FFF4DCCFFFF2D9CDFFF2D7
      C9FFF1D4C6FFEFD1C2FFEECDBDFFE8C5B6FFEDD1C1FFD9B7B5FF000000000000
      00000000000000000000000000000000000000000000595A8EFF1C29FFFF0006
      B4FF0003A2FF000EFFFF000DEAFF0000CDFF7782FAFFB8C5FFFFA6B3FFFF0709
      E5FF0000DEFF000BE2FF000DE2FF000DE2FF000CE0FF0009E2FF0000EDFF0000
      F4FF080AE7FF3132D0FF5452C6FF6C69C6FF373ED1FF060BDBFF1C28F2FF2737
      FFFF2B3BFFFF565EB6FF515797FF353B9DFF00000000CFCBBAFFFFFFFCFFD4DB
      F5FF6786F7FF0339FFFF0000C0FF0C1EC1FF3D49BFFF5C63BBFF001BD4FF0A31
      E7FF285BFFFF2255FFFF1D4EFFFF1545FCFF0020DFFF0023DEFF0020DAFF001E
      D8FF000FBBFF0009ADFF274EF2FF0C45FFFF0000C4FF0714B6FF3F46B9FF7175
      B9FFA6A7BCFFD7D8C7FF7E7E72FF00000000ADAEACFF9F9E97FF9E9E9DFF2727
      27FF0D0000FF532000FF7C573BFF6F6763FF121417FF000000FF663D1DFF3113
      00FF353D43FF9FA6A8FFACB2B5FFFFFFFFFF8D9398FF000000FF17130FFF4639
      30FF33281FFF201309FF6F5F57FFD7D9D8FF7E878CFF5C6368FF390F00FF642E
      08FF896851FF000000000000000000000000F3EAEAFFC58A82FFF8E3D5FFF9E3
      D5FFF8E1D1FFF6DECFFFF5DBCCFFF4D8C8FFF5D5C4FFF2D2BFFFF1CFBCFFF1CC
      B9FFF0C6B3FFDEAA98FFD19384FFC67F6FFFC57D6FFFC58175FFC7877AFFCA92
      87FFD8A89CFFE4BEB0FFF0D4C5FFEFD5CAFFF6E0D2FFD8B2AFFF000000000000
      00000000000000000000000000000000000000000000BDBECAFF0D1AF8FF3739
      56FF121BBEFF000BE9FF000EE1FF0000E5FF1515DBFFA7B2FFFFC1D1FFFF8993
      FCFF0000D8FF0000E2FF0000E6FF0000E3FF0000E2FF0000E1FF0406DCFF7B78
      E6FFC9C9FBFFFFFFFFFFFEFFFFFFBBC2FFFF4650FFFF1E22A4FF7B7EA7FF3C46
      BBFF282D71FF1218D3FF0B12C0FF6C73C5FF000000002F45D0FF2853FAFF0941
      FFFF0F42FFFF1348FFFF0224DCFF0013CAFF0010C7FF000DC1FF000CB6FF0014
      C6FF0122DEFF1E4CFBFF2255FFFF1A4CFFFF0024E8FF0027E7FF0022E0FF000D
      B7FF081FC7FF194DFFFF1246FFFF0C41FFFF0017CAFF0011C3FF000ABEFF0000
      B7FF0000B0FF0000A2FF3B3BA4FF000000000000000000000000EBEBEBFF4029
      19FFB27C52FF969AA6FFB9CDE7FFA6B0C0FF404853FF1C2C39FF765D48FF6F4A
      30FF130000FF2E3233FFA6A7AAFFFFFFFFFFF2F3F3FFC7C7C6FF5B6F73FF6987
      8BFF270B00FF190400FFC9C0BFFF5C5E62FF1E2934FF3D1B03FF682E03FF7743
      1CFF795134FFFCFCFBFF0000000000000000F9F8F8FFB76D65FFF4DFD3FFFAE6
      D9FFF8E4D7FFF9E2D4FFF8DFD1FFF7DCCCFFF6D8CAFFF5D7C6FFF4D3C1FFF0CC
      BBFFEDC3B1FFEABDAAFFE9BDA8FFECBDA9FFEBBDA7FFECBBA3FFECB89FFFE7AE
      95FFDA9A83FFCE8873FFBD6C5BFF98483FFFA57B77FFE8DAD9FF000000000000
      00000000000000000000000000000000000000000000000000002C3183FF4540
      00FF292B55FF0002FFFF0618D4FF000ED5FF0000CEFF0B07CFFFC4C7F7FFFFFF
      FFFFE6E6F9FF3230D5FF2222DCFF4C48E5FF5D5EE9FF4949EBFF4A4BEDFF8286
      FFFF4550FFFF7880FEFF070979FF020631FF18190DFF000000FF514E33FF6870
      C8FF342E00FF353997FF4552FDFFB9BCE1FF00000000000000001B32E1FF143F
      EFFF275AFFFF1E51FFFF0D38F0FF001AD4FF001AD1FF0017CAFF0013C3FF000E
      B6FF0108ABFF122AD3FF0F38E9FF2056FFFF002AF2FF0025E1FF0010BAFF0E2E
      D8FF2B62FFFF1F51FFFF1848FFFF1247FFFF011CD3FF0019CEFF0018CAFF0014
      C3FF0108A7FF4D4DB9FF00000000000000000000000077818DFF171717FF9D6A
      41FFFFD5A9FF887B76FF5E4B3DFF422D1FFF503321FFABA7A4FFAFA197FF2D1B
      0FFF000000FF0D0100FF383833FF272A2AFF000000FF423C39FF6D7E7CFF5781
      87FF1E0A0AFF100000FF253E44FF131F29FF593117FF864712FF804614FF9965
      39FF875025FFFBFAF9FF000000000000000000000000A77270FFECCEC3FFFAE9
      DDFFFAE7DAFFF9E5D8FFF9E3D5FFF8E0D2FFF7DECEFFF6DACAFFF1D2C2FFDBA7
      99FF9A5D5AFFA46C69FFB66862FFB46157FFBB6C61FFC57B6DFFCD8877FFD896
      83FFDDA08AFFE0A38AFFD7937CFF8A4844FFE5E5E5FF00000000000000000000
      0000000000000000000000000000000000000000000000000000DCDCE4FF3234
      08FF404430FF1819FFFF0000DCFF0000C7FF0E18D5FF0000C1FF0000B4FF5E5C
      D1FFC8C6EDFFBDBBE9FF807FE8FF5E5CFBFF1517F3FF212BFFFF4952E3FF474C
      A7FF2F345EFF0F1102FF050400FF141100FF0E0C02FF1E1D02FF03011FFF5E62
      AAFF3E3E18FFA1A7E7FFBEC0D4FFC7C7D1FF0000000000000000000000004058
      EAFF0C32E7FF2458FFFF194CFFFF001FDCFF001ED8FF001CD3FF0014C3FF0F18
      B6FFA7A8E5FF000000005567EFFF0626DFFF0123E0FF2332CCFFA9B1F3FF304C
      E8FF0D34E7FF2558FFFF1C4FFFFF164AFFFF0020DBFF0021DBFF001BCFFF040E
      B3FF8688DAFF0000000000000000000000000000000000000000D2CECAFFAC61
      1FFFA07C5DFF43464BFF312F31FF211F20FF4B4B4AFF00000000E5E2DFFF6237
      14FFBB8B62FFECC6ACFFF2BA87FF5A525FFF29383FFF000000FF6A8384FF4E6E
      72FF574C42FF462818FF706B65FF985C2AFFCD864CFF8F4A13FF93501AFFA96C
      39FFB29277FF00000000000000000000000000000000D8D2D1FFC7867EFFF3DE
      D1FFF8E6D9FFF9E6D9FFF9E6D8FFF8E3D6FFF9E1D3FFF5DACBFFDEAFA2FF935A
      58FFF9F9F9FF000000000000000000000000F0EEEEFFD4D0D0FFC6B7B6FFAD97
      97FFAA8482FFA16F6DFFAE635FFFB49E9EFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8C8
      CFFF333444FF8491FFFF8687FBFF6D6EF1FF7E84FAFF484BD3FF8687DDFF3840
      D8FF0000D1FF1723DFFF252ED9FF060B6DFF515175FF1B1C31FF1B1903FF7678
      43FF88834DFF6C6A44FF121200FF060300FF282B21FF1C1C06FF55537AFF7581
      FFFFC0C2D1FF00000000C1C1C4FFA9ABC5FF0000000000000000000000000000
      00007386FAFF0425E0FF1E52FFFF032AEBFF0023E2FF0017C6FF343FC8FF0000
      000000000000000000000000000099A5FEFF5A6AEDFF00000000000000000000
      00007688F8FF0322DBFF1A48F9FF1A50FFFF0027ECFF001ED5FF1723BDFF0000
      0000000000000000000000000000000000000000000000000000E6D7C9FF412C
      1FFF263445FF828690FFA2A2A7FFE2E3E5FF000000000000000000000000BF9E
      81FFF4D6BCFFFCE6E0FFFFF4EBFFE3E5FCFFE6E4D5FF767467FF506C73FF2032
      3CFFBC9A83FF7F523DFF9B6948FFFDD6B9FF967D68FF37281CFF72563EFFE4DD
      D8FF000000000000000000000000000000000000000000000000B48583FFB465
      5FFFBF7B74FFCB9289FFD7A89EFFE4BFB4FFE7C6B9FFDBADA1FF935552FFF1F1
      F1FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D9DBFBFFADB2F0FFA0A5EBFFB1B6EFFFC5C9F5FFD2D5F5FFDFE1
      F7FFE4E5FAFFF4F4FDFFA6A9C1FF89887FFFA4A389FFAAA881FF6D6D62FF6664
      3DFF716F46FF918F76FF9698A3FF8388B2FF686EC5FF666FDDFF979EEEFFB7B9
      D7FFB6B7CDFF9C9EC2FF979AC3FFF5F5F8FF0000000000000000000000000000
      000000000000AAB5FFFF0E29DAFF0329E4FF0219CEFF6F7AE6FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001F34D7FF0B32E7FF001DD4FF3C4ACDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7DDD4FFBBA999FFE2D3CAFFE8DDD5FFDFC8B8FFEEEEEDFFFAFCFCFFF1F0
      EDFFE7E5DAFF000000FF535452FFD9DCD2FFA1AAACFF989999FF7D8687FF8488
      8CFF000000000000000000000000000000000000000000000000000000000000
      0000F4F2F3FFDFD9D9FFD3C2C1FFC6ABAAFFCD9F9EFFC79F9DFFF4F4F4FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009497D8FFF8F8FCFF00000000B4B5C4FF9C9FB3FFAFB6
      F3FF949BF9FFA9B0FEFF5255AEFF7D81CBFFCACCE7FFD8D9E6FFEEEEF4FFE0E0
      E7FFF5F5FCFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000003C4ED9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005C6ADDFF707CDCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E2DFFF8A847BFF7056
      45FF808179FF545351FFD8D0C3FFFFFFFFFF7C7A79FF000000007C7B79FF6462
      60FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7CFC9FF000000FF2425
      25FF8C8B86FFFFFFFFFFFFFFFFFFB2B0ADFFF6F6F5FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDDDDDFFF4F4
      F2FFFFFFFFFFADADACFFCDCCCBFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF5B6D81FF4A535CFF5C5E60FF696B6CFF6B6C6DFF656664FF6665
      64FF797979FF959595FFBABABAFFE7E7E7FFFEFEFEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004152AFFFB8BACAFFA0A0AFFFB9B9BFFFFDFD
      FDFF8F8F8EFF474A4DFF595A58FF646460FF636361FF575754FF454645FF4141
      40FF4C4C4CFF737373FFAEAEAEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2E5
      E9FF4A535AFF686760FFA1A19BFFAFAFAFFFACAEB0FFAAACAFFF98999CFF8182
      83FF7F807CFF83837CFF72726DFF58595BFF48566AFF587195FFA2BAD9FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000130593FF282789FF6261BDFF8986E3FF4F4DA2FF6061
      7AFF5A5956FF939395FF9FA1AAFF9498A9FF8B90A3FF797C89FF787A80FF8384
      84FF83837DFF676762FF454543FF393A3BFF404D5FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008DB78DFF5E98
      5EFF3B803BFF226F22FF146614FF106510FF106510FF176817FF2B752BFF468A
      46FF6CA36CFF9BC19BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5AE9DFFC186
      6DFFB16447FFA64E2CFF9D3D18FF993810FF9A3810FF9C3C14FFA44822FFAD5C
      3AFFBC7A5DFFCFA08BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C40
      68FF3D4054FF545989FF50559BFF363A91FF2D2F90FF2D2B90FF272682FF2728
      7EFF373B86FF545990FF8286A1FFAEAEB0FFA4A49DFF7B7B78FF484D57FF2B4D
      85FFABC3E5FF0000000000000000000000000000000000000000000000000000
      0000000000001B01ABFF6D6ACEFFA39EF7FF7875D2FF827FD7FF5856BDFF5250
      B0FF31367BFF323696FF232194FF241A91FF251889FF211682FF2A2287FF3E3C
      8CFF595C97FF8F93ACFFB4B5B4FF908F8AFF4F4F4EFF535351FF474C56FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077B077FF1A701AFF016301FF1C8B1CFF35AE
      35FF42BF42FF4DCD4DFF50D250FF50D450FF4DD24DFF47CB47FF3CBF3CFF2EAE
      2EFF209A20FF138613FF036E03FF278227FF85BA85FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7A288FFB45429FFA03703FFAE501CFFB964
      31FFC2723FFFCA7B48FFCD804DFFCC804DFFCA7C49FFC57441FFBF6C39FFB75E
      2BFFAF5320FFA44310FF9A3300FFA54818FFD09174FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A14
      6AFF0F1883FF1B1F96FF231E9CFF2D1DA3FF31169CFF2F1399FF2E17A0FF2E18
      A0FF301A9BFF301F9AFF281E8DFF37378EFF8186B2FFCFD1D8FFD6D6D0FF8281
      80FF35455EFF9CB3D2FF00000000000000000000000000000000000000000000
      0000000000000A208DFFB6B2FCFFD4D0FFFF9A98D8FF5252AAFFB3B0EEFF8B8C
      D8FF1F259BFF322AA6FF3722A4FF2A15ABFF1F14BFFF261ECCFF2A22C4FF4337
      CBFF3F32B5FF362D9CFF5454A1FFB9BBD2FFDFDFD9FF717070FF767673FF807F
      7EFF000000000000000000000000000000000000000000000000000000000000
      00000000000093C193FF0B690BFF209320FF4DCF4DFF259625FF3EB63EFF5AD9
      5AFF58D458FF57D557FF55D255FF53D153FF50CD50FF4CCD4CFF48C948FF42C8
      42FF3DC63DFF39C439FF33C233FF026B02FF0F870FFF197119FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1421BFFB25824FF9C3704FFDE9966FFDA9461FFD891
      5EFFD68E5BFFD28A57FFD08653FFCC814EFFC97B48FFC67845FFC4723FFFC06F
      3CFFBE6A37FFB25926FFA4410EFFB05522FFA1400DFF9F3A09FFD8A38AFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006258
      91FF212697FF3D39ABFF382CA8FF3622A5FF1F14BAFF0C11D3FF121BE4FF1B24
      EAFF232AE3FF4849F2FF564EE0FF5345C4FF372D9DFF333292FF9094C2FFFFFF
      FFFFB4B3B0FF3F4959FFDBDEE3FF000000000000000000000000000000000000
      000000000000224C96FFDEDCFFFF9A99D8FF9190CDFF8C8DC5FFBBBBDDFF9498
      CAFF281A91FF3B28A0FF291CBCFF0511E9FF0613E3FF0D1AE0FF2E3AFBFF4651
      FFFF575FFFFF6062F7FF4845CFFF0C0F99FF7177BDFFE4E4E8FF747370FFA3A3
      A3FF000000000000000000000000000000000000000000000000000000000000
      000000000000207020FF44C644FF50D450FF56D756FF2C9F2CFF31A031FF61DC
      61FF5FD75FFF5ED75EFF5DD75DFF5AD55AFF57D357FF52D052FF4DCC4DFF47C8
      47FF40C440FF3BBF3BFF36C236FF006900FF2BBF2BFF18A018FF277727FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A34823FFCB7E4BFFE4A471FF9B3603FFDE9D6AFFD99562FFD993
      60FFD7915EFFD68E5BFFD38A57FFD08653FFCD814EFFCA7C49FFC67643FFC271
      3EFFBF6C39FFAE521FFFA64613FFB45A27FFAE531FFFA94B17FF9E3B0EFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002617
      59FF271B8DFF3A2296FF3A27A1FF241BC3FF0210F3FF0A16E9FF0A15D8FF1622
      E3FF3742FEFF4650FFFF545FFFFF5962FBFF6A6CF7FF2E2DC6FF000094FF434B
      A4FFE9EAF7FFAAA9A3FF576271FF000000000000000000000000000000000000
      00005AAEE0FF5369A0FF2B3B71FF051750FF403F93FFC4C3E5FFA5A7D1FF2F31
      92FF1F128AFF301B8DFF2418C2FF0E1BFFFF1A28FFFF2935FBFF3E48FFFF4C56
      FFFF5963FFFF454EEEFF303AE0FF4951E7FF1720B8FF535BB3FF8D8F9CFF3738
      4CFFE1E2EEFF0000000000000000000000000000000000000000000000000000
      0000000000002D782DFF46C646FF54D254FF59D659FF50C850FF50C450FF67DF
      67FF66DD66FF67DD67FF65DE65FF64DB64FF60D860FF59D559FF53D153FF4DCC
      4DFF46C846FF40C440FF39C339FF097409FF2BBB2BFF22B622FF116611FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000095320BFFE09F6CFFE3A06DFFA13D0AFFE4A26FFFDE9B68FFDE9A
      67FFDC9865FFDA9562FFD7915EFFD48C59FFD18754FFCD814EFFC97B48FFC575
      42FFC36F3CFFB65F2CFFB25926FFB45B28FFAE5320FFAA4D1AFFA2451BFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0888DFF1317
      7FFF25188CFF2F1D93FF361B8FFF2618C5FF0C19FFFF1826FFFF242FFCFF313C
      FEFF3E48FFFF4B55FFFF5C65FFFF4952EFFF2D37DEFF3741E1FF575FEEFF1219
      B8FF2F389DFFA6A9C2FF595A5BFF000000000000000000000000000000000000
      0000A6E2E6FF56777DFF00000000000000007A4B3DFF442532FF313696FF0708
      7DFF101184FF131089FF15108BFF1E18ACFF2825D5FF2F35F8FF3E49FFFF515B
      FFFF5B64FEFF4049ECFF303ADFFF3740DEFF888DFBFF7D83E0FF1E2680FF2326
      5EFF2F389CFF0000000000000000000000000000000000000000000000000000
      000000000000498A49FF41BA41FF5BD85BFF5FD75FFF66DD66FF6CE26CFF6EE1
      6EFF6FE36FFF71E371FF6EE26EFF6BE06BFF66DD66FF60D960FF5BD55BFF52D0
      52FF4BCB4BFF43C643FF3CC13CFF36C036FF2DB72DFF25B725FF116611FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000095310BFFE4A370FFE2A16EFFE6A774FFE4A673FFE3A471FFE4A3
      70FFE19F6CFFDE9B68FFDB9764FFD89360FFD48C59FFD08653FFCC7F4CFFC779
      46FFC37340FFBF6C39FFBB6532FFB55D2AFFB05724FFAA4D19FFAE5B36FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000371E4CFF020B
      7EFF0B0F83FF0A0F83FF0B0D82FF17108CFF1F19B8FF2325E2FF2933F9FF3844
      FFFF444EFFFF5159FFFF5F67FFFF3E46E6FF343DDEFF2E37D9FF444CE1FF7E84
      F7FF7E84E0FF171F87FF3E455BFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000007E7282FF080E88FF1719
      8EFF1A158BFF211597FF331B9FFF31188BFF3A1D8FFF5C4894FF6F6CB3FF7878
      C3FF7B7BC4FF5659BCFF666AD6FF7B80EDFFA7ABFFFFC1C5FFFF4B51B4FF4C50
      A3FF000000000000000000000000000000000000000000000000000000000000
      00000000000071A571FF33A633FF62DD62FF63DB63FF6AE16AFF70E570FF75E7
      75FF78E978FF78E978FF78E878FF72E572FF6EE16EFF66DD66FF60D860FF57D3
      57FF4FCE4FFF47C847FF3FC33FFF36BD36FF2FB82FFF24B224FF237423FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A3B1AFFE4A572FFE5A673FFE7A875FFE8AA77FFE8AA77FFE7A9
      76FFE5A673FFE4A370FFDF9C69FFDB9764FFD7905DFFD38A57FFCE8350FFCA7C
      49FFC57542FFC06E3BFFBC6734FFB7602DFFB45A27FFA74815FFBC7C5DFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000774C4AFF0C0B6CFF070D
      80FF161184FF20148AFF2A199EFF271798FF201486FF321A8EFF3E25A7FF382E
      C6FF444BF4FF5761FFFF636BFEFF4952EBFF5961EEFF545CE9FF656DECFFA6AC
      FFFFBDC1FFFF6066C3FF203083FF000000000000000000000000000000000000
      000000000000000000000000000000000000CAC1C0FF13126CFF302A9FFF3A30
      A9FF3422A6FF2D179EFF341DA3FF2E1FC0FF655C95FF7C7693FF4144C4FF353A
      CDFF292ECEFF6F70C7FFCCC7BDFFB8B4B7FFA5A2BCFFB6B5DFFF5358AEFF7A7F
      C1FF000000000000000000000000000000000000000000000000000000000000
      000000000000A8C8A8FF1B881BFF69E569FF68DE68FF71E371FF78E878FF7EEC
      7EFF82F082FF81EF81FF80ED80FF79EB79FF74E574FF6BE06BFF63DB63FF5BD6
      5BFF52D052FF4ACA4AFF41C541FF39BF39FF32BC32FF1FA51FFF478A47FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5B3EFFD99461FFECB07DFFEBB07DFFEDB17EFFEDB380FFECB0
      7DFFEAAC79FFE6A774FFE2A16EFFDE9B68FFDA9461FFD58D5AFFD08653FFCC7F
      4CFFC77845FFC2703DFFBD6936FFB8622FFFB55D2AFFA2410EFFD3A793FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003E2A5DFF141B8CFF302E
      A2FF28209CFF1F1796FF1E1395FF381DA0FF43209CFF341C9FFF3A2DC1FF241F
      BEFF3B41E7FF626AFFFF525AF2FF2F39DCFF4E56E7FF8086FAFF9DA2FFFFA8AD
      FFFFBEC2FFFF8D92DBFF595EAAFF000000000000000000000000000000000000
      0000000000000000000000000000000000002B173EFF1E1C94FF392599FF3627
      A5FF371EA6FF3619A1FF2322E0FF2936FCFF7A779BFF181FEAFF0001FFFF0000
      FFFF090FFFFFC1C6FFFFFFFFFFFFFFFFFDFFF6F4EDFFD4D0CDFF706E94FF787A
      B0FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000076307FF6DE76DFF6FE46FFF74E674FF7CED7CFF85F0
      85FF8AF48AFF8BF68BFF87F387FF80EF80FF77E877FF70E470FF66DD66FF5FD7
      5FFF55D255FF4CCC4CFF43C643FF3AC03AFF35C035FF158D15FF80AF80FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C58B75FFC47542FFF2B986FFF0B582FFF2BA87FFF2B986FFF2B8
      85FFEDB380FFEBAC79FFE5A774FFE2A06DFFDC9764FFD7905DFFD28A57FFCD81
      4EFFC87B48FFC3723FFFBE6B38FFB96330FFB7612DFF9D3402FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A181CFF0B107AFF2F2395FF3A2F
      A6FF3826A8FF381EA9FF381BA4FF341FADFF2A28DBFF0F19D5FF2330EEFF1F2A
      E5FF424CF3FF6068FFFF2A33DCFF3039DBFF3A42DDFF8087F8FFA1A6FFFFADB1
      FFFFC5C9FFFF8085D1FF7B7DB9FF000000000000000000000000000000000000
      0000000000000000000000000000674C53FF0C1085FF362395FF3729A2FF3623
      A5FF381997FF2417B3FF0917E4FF2C37F7FF6A69B5FF0B09F3FF0004FFFF3540
      FFFFBEC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFFF575EF9FF5958
      9BFFA4A7D1FF0000000000000000000000000000000000000000000000000000
      00000000000000000000579A57FF3FB03FFF74EA74FF77E977FF7FEF7FFF89F3
      89FF92FA92FF95FB95FF8CF78CFF84F084FF7AEA7AFF71E471FF68DE68FF5FD8
      5FFF56D256FF4DCC4DFF44C644FF3CC03CFF38C638FF036D03FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4430FFFFBC592FFF4BD8AFFF8C18EFFF8C28FFFF6BE
      8BFFF2B885FFECB07DFFE7A875FFE2A16EFFDD9966FFD8925FFFD38A57FFCE82
      4FFFC97B48FFC47340FFBF6C39FFBC6734FFAE5320FFBC633DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D0E56FF1C1D8DFF3A2799FF3624
      9FFF3521A6FF371AA4FF3218A2FF1F24EDFF2533FFFF2D38FAFF3942F7FF414A
      F6FF5A62FEFF676EFEFF353DE0FF5B63EEFF242AD3FF4047DCFFA9AEFFFFB3B7
      FFFFCDD0FFFF696FC1FFA0A0CBFF000000000000000000000000000000000000
      00000000000000000000CFC9C8FF0E0D63FF2C32A1FF3A34A6FF3628A7FF361D
      9DFF381891FF1C17C2FF0F1CE9FF2D38F5FF7A77AAFF858AF0FFB1B5FFFFF7F8
      FFFFFFFFFFFFFEFEFEFFFDFDFEFFFFFFFFFFFFFFFFFFEEEFFFFF1B25FFFF494B
      C6FF9E9FBBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000046904FF76EC76FF79EB79FF7FEF7FFF89F3
      89FF92FA92FF95FB95FF8CF78CFF85F185FF7CEC7CFF72E572FF68DE68FF5FD8
      5FFF56D256FF4DCC4DFF44C644FF3EC53EFF26A626FF3B8A3BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A64D2BFFE4A26FFFF9C592FFFBC794FFFCCA97FFF8C1
      8EFFF2BA87FFEDB17EFFE8AB78FFE3A26FFFDE9A67FFD89461FFD48B58FFCE83
      50FFC97B48FFC47441FFBF6D3AFFBD6A37FF9F3804FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000351437FF0B0E81FF342191FF37279EFF3627
      A6FF361B9FFF371897FF1C15BBFF0916E1FF2832F9FF3D47FFFF2F39ECFF353E
      EBFF464FF1FF6067F9FF6870F8FF373FDDFF5159E4FF9499FCFFACAFFFFFB9BC
      FFFFCDD0FFFF5056AEFFC3C3DBFF000000000000000000000000000000000000
      000000000000F3EFEEFF39316DFF1C279FFF383BADFF352DAAFF3522AAFF361A
      A6FF3D1C9CFF261DBFFF2331FFFF3139E5FF979296FFE8E6D3FFF0EFE4FFF4F4
      F1FFF7F7F7FFFBFCFBFFFDFCF3FFF7F5EAFFF0EDDFFFA6A6D2FF5655B0FF8280
      A0FFC7C9F7FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000076AF76FF1D881DFF83F783FF7FEF7FFF86F3
      86FF8EF88EFF95FF95FF96FF96FF88F588FF78E877FF7AEE7AFF71EA71FF64DE
      64FF58D558FF4DCD4DFF45C945FF3FC73FFF036C03FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8C1AFFFA4400CFFFFCD9AFFFCC794FFFCC895FFF9C3
      90FFF8C18EFFF6C08DFFF3B885FFEDB17EFFE7A774FFDE9B68FFD68F5CFFCF84
      51FFC97B48FFC57643FFC4723FFFA84A17FFC57654FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000644964FF02097CFF292E9AFF3A32A3FF362CA6FF3621
      A2FF361896FF361893FF1B1DDDFF0E1BE5FF2934F1FF2F39F2FF1822D6FF121B
      D1FF323BE2FF2B34DCFF555DEBFF898EFEFF9CA1FFFFAAAEFFFFB4B7FFFFBFC2
      FFFFC9CCFEFF30399AFF5086C5FF000000000000000000000000000000000000
      00007F5A4FFF757785FF2B3170FF464B7EFF434282FF3A3287FF321C8CFF3417
      9EFF3E1EA7FF4229BBFF333AFFFF5056CFFFCCC8BDFFFFFFFFFFFBFBFBFFFEFE
      FEFFFCFCFAFFBDB8B7FF7C79A7FF7575B2FF9998CAFF7779AAFF787AAEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F924FFF218B21FF84F884FF8CFC
      8CFF7AE679FF30962DFF005800FF005100FF005B00FF005000FF096D06FF32A2
      32FF57D456FF50D050FF48CF48FF0C7B0CFF79B579FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C67C5EFFB75F2BFFFFD19EFFFDCA97FFF3BB
      88FFC06933FFA13400FF941E00FF931E00FF962900FFA84A17FFC57542FFD38B
      58FFCC7E4BFFC97C49FFAC501DFFAD552FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3E3F0FF121173FF1B2592FF3A3EA9FF3733A7FF3629A7FF351E
      A3FF37199AFF391A98FF1414C6FF1C29F0FF303BF9FF212BDFFF404AF2FF3C45
      EAFF232DD8FF3F46E3FF676EF2FF6168EDFF6168E9FF5158E1FF8389EFFFCDD0
      FFFFC2C5F6FF222C93FF005DB5FF000000000000000000000000000000000000
      00006F635FFF666564FFA19F98FF9F9D94FF908D83FF85837FFF7B7A7EFF6863
      78FF4F4376FF483183FF3622A6FF7771A6FFF6F5EAFFFFFFFFFFFFFFFFFFFFFF
      FFFFE1DED5FF8B8ABDFF6E74ECFF6168E9FFA4A9FAFF555AA9FF7176CEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000067A567FF097209FF2891
      27FF005400FF29AC37FF4BEA5FFF48E384FF3CCF8AFF32C870FF18AE16FF007A
      00FF016600FF4BCD4BFF077307FF6AAC6AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B76C4BFFB05722FFDF9A65FF9620
      00FFC16327FF9E8E8EFF909EB4FF9B98A0FFC77948FFBB5010FF972C00FFA746
      13FFC97B48FFA2420EFFB0643EFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005656A9FF141E8BFF3840A6FF3636A8FF342AABFF3421AAFF341A
      A9FF3A1CA8FF4121A2FF2F27D2FF2E3CFFFF333DF6FF1720D7FF2C35E2FF2E37
      E2FF2A33DAFF5C64F1FF7A80F8FF3B3FDAFF8389F3FF4950DDFF4C54DCFFC9CC
      FFFFA9ACE3FF383EA2FF000000000000000000000000000000008A88D4FF4326
      1EFF4F4D4CFF8C8C88FFB1B0AEFFB4B3B1FFBDBCBBFFBFBDB8FFA5A39EFF9B9C
      99FF888A83FF727370FF605861FFC0BAB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB0ABAEFF9EA1ECFFAFB3FFFFC5C8FFFFD7D9FFFF2A308BFF4950D3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000157
      01FF72FF9BFF58E8B5FF319CFFFF3694FFFF3E9AFFFF3B99FFFF3199FFFF21B4
      69FF006300FF177017FF9FCA9FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2967BFF9E2405FFA487
      7EFF2AA3FFFF2EA2FFFF38A6FFFF32A4FFFF1F9DFFFF698CBBFFC66121FF9B2E
      00FFA24218FFDAAA93FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005927
      18FF797680FF3A3D63FF525571FF50526EFF4A4970FF423D77FF382978FF351C
      8DFF3B1EA4FF4222A8FF452AB7FF383EF6FF404CFFFF4751FBFF1F28D8FF0A14
      CAFF686FF7FF8188FDFF8B91FDFF2730D4FF424ADCFF4A52DDFF575DDFFF9CA1
      F5FF8C8FCDFF5857B4FF00000000000000000000000000000000696793FF5F5F
      5FFFAEACACFF9FA9A6FFB1B1ADFFEAEAEBFFF3F3F3FFFBFBFBFFBAB5B0FF6260
      5CFF5D5E5FFF6F706EFFA8A59BFFF9F8F5FFFFFFFFFFF6F6F6FFF7F8F8FFF4F1
      E8FF726F9AFF8F95F6FFC5C8FFFFD8D9FFFFBBBEF1FF212785FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000065
      00FF31A3AAFF3291FFFF58AEFFFF65B7FFFF60B6FFFF5EB4FFFF55ADFFFF399C
      FFFF0F7748FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009B685BFF23A2
      FFFF51AEFFFF5EB4FFFF61B5FFFF62B7FFFF61B8FFFF38A7FFFF3A91ECFFA330
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005434
      2CFF545451FF9B9A94FFB1AFAAFFADADA8FFA9A9A4FF9FA098FF8A8B86FF7170
      72FF544E6AFF493B74FF472F86FF3D24A1FF2723CAFF3D46EDFF656FFFFF6870
      FCFF787FFDFF4D55E8FF8288F7FF8F95F9FF848AF1FF757BEAFF696EE4FFAFB3
      F8FF646AB3FF6F6FC7FF000000000000000000000000000000005F5E85FF9E9F
      9FFFE4E0DCFFB6B2AFFFB3AFAAFFCBC8C2FFCAC6C2FFD3D0CEFFB9B7B0FFBBCC
      C2FFA2A69FFF98918CFFE7E6E3FFFFFFFFFFFFFFFFFFF5F5F5FFE7E7E8FFD9D6
      CCFF827397FFABA6F2FFC9CDFFFFE3E5FFFF8F93D2FF46499BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002384
      6FFF3C9FFFFF6BBBFFFF6BBCFFFF68BAFFFF66B9FFFF64B6FFFF61B4FFFF59B1
      FFFF3498FFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000045A7FFFF51AF
      FFFF60B6FFFF63B7FFFF67B9FFFF6ABAFFFF6BBBFFFF6DBDFFFF42ADFFFF487C
      BEFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004879B9FF68679FFF4744
      42FF4A4948FF5D5A58FF615D5AFF6A645FFF787169FF8B8780FFA2A09DFFB0B0
      AEFF9A9B96FF7A7C74FF686867FF52495EFF493574FF4832A2FF6C62E2FF6568
      F4FF2530DAFF454EE3FF585FE6FFA9ADFFFFADB1FCFFA6ABF8FFCACDFFFFDFE0
      FEFF3B3D90FF6970CDFF00000000000000000000000000000000575684FF7D7D
      7DFFEBEAE7FFCAC8C4FFCCC9C5FFCDCBC6FFC4BFB8FFBDBAB1FFC1D3C9FFD3EF
      E7FFC9D9D0FFC6C6BDFFE5E3E0FFFDFCFCFFFFFFFFFFFEFEFEFFE1E1E2FFB6B2
      ABFF746A6DFF7B638DFFBFB3E5FFEAEDFFFF6369B1FF878BCBFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003C9F
      FFFF6DBDFFFF73C1FFFF73C0FFFF73C0FFFF6FBEFFFF6BBCFFFF67B8FFFF63B7
      FFFF43A3FFFFA3D9FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDE3FFFF3C9FFFFF64B7
      FFFF67B8FFFF6DBCFFFF70BFFFFF72C0FFFF74C0FFFF73BFFFFF73C2FFFF34A1
      FFFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000634B45FF4A4A4AFF837D
      7CFF84A5B1FF1C95BFFF1F88BDFF2276B1FF28619AFF33507CFF464C5EFF5A59
      57FF6D6A62FF767571FF8F8F8DFF9C9D99FF878982FF615C66FF5A4675FF573E
      98FF3628B5FF6B6EEDFF323DDBFF7980EEFFC1C4FFFFC6CAFFFFD5D8FFFFCBCD
      F4FF373079FF0000000000000000000000000000000000000000000000005755
      55FFB7B7B6FFE1DED8FFF2F1EFFFFFFFFFFFD9D4CCFFC5C3A6FFD5EDE7FFD5EA
      E4FFDBF0EAFFDAEBE5FFC9D0C9FFC8C6BFFFF2F0EEFFFFFFFFFFEEEEEEFFB4AE
      A6FFEAEAE7FF858485FF776079FFC3B2D9FF474C96FFBABEF0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093CEFFFF4FAA
      FFFF7AC4FFFF7AC4FFFF7BC6FFFF7BC7FFFF79C5FFFF74C2FFFF6EBEFFFF67BA
      FFFF57AFFFFF63BCFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080CAFFFF4FAAFFFF68BA
      FFFF6EBEFFFF75C1FFFF7AC4FFFF7DC6FFFF7EC8FFFF7FCBFFFF7BC8FFFF64B7
      FFFF5EB9FFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000494645FF8D8D8DFFFFFF
      FFFFF5FFFFFF39CEFFFF00A8FFFF0798FFFF0582FFFF0667FFFF075AECFF144A
      B1FF2A3D79FF404358FF585753FF7C7B73FFABAAA9FFC0C1BEFF999A95FF6B68
      6BFF493668FF472D97FF433EC9FF9BA2F9FFC2C7FFFFC9CBFFFFDFE1FFFFA5A9
      DCFF58508BFF0000000000000000000000000000000000000000000000000000
      00008C9191FFB4B2B1FFEAE8E5FFDCD4C8FFE5DECEFFCDCCBDFFD7EAE4FFDCEF
      E9FFE0F0EBFFE5F3EFFFEBF9F5FFE4EBE7FFC3C2BBFFE0DDDAFFECE5E1FF837E
      76FFABA8A7FFFEFEFDFF93938FFF605278FF525593FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004B9EFFFF74C1
      FFFF7DC8FFFF81C9FFFF86CDFFFF84CBFFFF80CAFFFF7AC5FFFF74C0FFFF6BBB
      FFFF66B8FFFF3DA3FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005ABCFFFF60B6FFFF6CBD
      FFFF74C0FFFF7AC6FFFF84CCFFFF8ED6FFFF96E3FFFF5E94EAFF7DC6FEFF86D6
      FFFF369EFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000575251FFB0B0B0FFFFFF
      FFFFFFFFFFFFD2F1FEFF22A7FDFF0085FDFF0876FEFF046EFEFF0062ECFF0043
      D9FF0025C0FF0211A5FF151B8AFF323464FF555553FF8B8B82FFCDCECCFFE0E2
      DFFFA5A6A1FF574F60FF614682FFA794D4FFC3C6FDFFD0D4FFFFE9EBFFFF7B7E
      C1FF7570BAFF0000000000000000000000000000000000000000000000000000
      0000000000008A9DA4FF92969AFFCBB483FFE8DA98FFDAD6B9FFDCEBE9FFE4F1
      EDFFE7F3EFFFEBF5F2FFF0F8F5FFF8FDFCFF78BCBEFF9CC4C1FFB5C3BDFFB1D0
      CFFF57787AFF989A97FFFFFFFFFF808289FF68698DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002988BBFF208AD9FF89CD
      FFFF84CBFFFF8BCFFFFF90D1FFFF8ED2FFFF89CEFFFF81C8FFFF77C4FFFF6EBD
      FFFF6BBCFFFF379CFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000097A5FFFF6572F5FF2C80FDFF67BAFFFF7ED2
      FFFF88D9FFFF93E0FFFF8FD7FFFF679DEFFF132BC7FF0001BDFF0000A9FF3C61
      D0FF52B8FFFFBDE5FFFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ABA19DFF818181FFFFFF
      FFFFFFFFFFFFFFFFFFFFD1ECFFFF40A1FEFF006AFEFF0069F6FF0054DFFF0036
      C8FF0019B1FF0007A6FF0004B0FF0005B4FF11169BFF323464FF606058FFA1A1
      99FFF3F3F3FFE4E5E2FF787675FF66516FFFA68CBEFFCFCAF4FFE7EBFFFF4F52
      A2FF3947B4FF0000000000000000000000000000000000000000000000000000
      00000000000000000000828078FFE3CF91FFF1E3A8FFEDEBCEFFE6F5F5FFE9F5
      F1FFEDF6F4FFF1F9F6FFFFFFFFFFACD5D7FF7CCED2FFD4FFFFFFD3FFFFFFE8FF
      FFFF7EC4CEFF263E5DFFBDBAB7FF8D8B8BFF574E5EFFC0BBE2FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000089BDFF007AABFF72BE
      F7FF80C9FCFF94D4FFFF99D8FFFF98D6FFFF8DD1FFFF84CAFFFF79C4FFFF71BE
      FFFF6EBEFFFF258CDEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008494FCFF092EE6FF092DEAFF0015E3FF000E
      E0FF0015DEFF000BD8FF0006D1FF001AD7FF173FECFF255BFFFF1A4EFFFF0006
      B9FF0F31BEFFA9E4FFFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7775FFBABA
      BAFFFFFFFFFFFFFFFFFFFFFFFCFFF7FAFCFF79AEFFFF055CEFFF0040D4FF0028
      BDFF000EA8FF0007A7FF0007ADFF0006B5FF0003C0FF0105C3FF181B98FF3737
      59FF73736AFFE3E3E1FFFDFEFDFF8E908DFF5F5061FFA182A7FFCABFE2FF4044
      9DFF0962BAFF0000000000000000000000000000000000000000000000000000
      000000000000F9F9F9FFA68A6FFFD9C394FFECDEAAFFF1F1DBFFECF8F9FFEFF8
      F6FFF4FBFAFFFFFFFFFFD9EBECFF78C3C7FFD3FCFDFFDCFEFFFFE0FEFFFFF0FF
      FFFF9ED3E0FF254273FF5D5A58FF555553FF544756FF997B9EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4D8EDFF009ACDFF008FC2FF0076
      A8FF0079ACFF9CDAFFFF98D7FFFF97D6FFFF8ED1FFFF82CAFFFF7AC4FFFF70BF
      FFFF72C1FFFF0976B0FF8EC3DBFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000052DECFF3F70FFFF4777FFFF497A
      FFFF4977FFFF4574FFFF4071FFFF3869FFFF2D60FFFF2557FFFF1F53FFFF1752
      FFFF0008B4FF8697E9FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844C40FF7E7A
      79FFCBCBCBFFFFFFFFFFFAFBFBFFF6F4F1FFFEFAF4FFB4CBF3FF2B5ACFFF0012
      B1FF0003A5FF0007ABFF0007B1FF0007B8FF0006BDFF0005C6FF0001D2FF0306
      CCFF212383FF585752FFC9C9C5FFFFFFFFFF9E9F9DFF5C5456FF6F5C8EFF1529
      9CFF000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F8FFC7B8ACFFDDCDB9FFD8C391FFF7F7E6FFF6FAF6FFF9F9
      F2FFFFFEF4FFE2EDE8FF80C3C8FFD0F3F5FFECFFFFFFE9FEFFFFEEFEFFFFFDFF
      FFFFB3DDDEFF527572FF534E4EFFAEAEAEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091D1EAFF009FD2FF00BAEDFF00BA
      EDFF007EB1FF79C4F5FF91D3FFFF8DD1FFFF87CEFFFF80C8FFFF76C2FFFF70BF
      FFFF67BAFFFF006A9AFF8FC6DFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F86FFFF0533F6FF204FFDFF3B6A
      FEFF507EFFFF4A7BFFFF4272FFFF396BFFFF2F62FFFF204EF8FF1136E5FF071E
      CAFF0008ACFF7373D6FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F7FF888888FFBABABAFFFFFFFFFFF5F5F5FFE8E7E7FFEEE9E2FFD3D4D8FF6D75
      B7FF141AA6FF0001AEFF0002B6FF0005BCFF0006C1FF0005C6FF0004CDFF0003
      D6FF0001E0FF181AA3FF4B4B4DFFC0C0BBFFFFFFFFFFBBBBB7FF43445DFF106A
      BFFF000000000000000000000000000000000000000000000000000000000000
      000000000000B7B7B7FFC7B9AFFFE1D0B1FFEBE0B7FFF5EECFFFF7EFD2FFF9F1
      D6FFBDD6C4FF47A2A2FF81C8CCFFBDE6E7FFDEF4F5FFFBFFFFFFFFFFFFFFFFFF
      FFFFB9DDDFFF406466FF3E3B3CFFBBBBB7FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009BD7EEFF009ED1FF00C3F6FF00C2
      F5FF0098CBFF41A2D6FF8ED0FFFF85CAFFFF80C8FFFF7AC4FFFF74C1FFFF72C0
      FFFF3095D2FF006FA0FFA2D0E6FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000124DDFF1445FFFF002E
      F9FF001DEDFF001CE4FF001CDCFF0015D0FF000BC3FF0014C4FF0720CEFF0E33
      E7FF051AC6FF9C9DE3FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFEFF96969BFF8E8E92FFDCDCDCFFEEEEEEFFDEDEDEFFD7D6D3FFD1D0
      C7FFA2A2ABFF5D6098FF1F249EFF0005B7FF0001CAFF0003D1FF0003D3FF0004
      D7FF0002DDFF0000ECFF1618AEFF4E4E4CFFCFCFCDFFFFFFFFFF747472FF214D
      87FF000000000000000000000000000000000000000000000000000000000000
      000000000000939398FFA48F77FFF6ECC8FFF7F1D3FFF5EFD4FFFFF8DDFFC3DA
      CAFF79BBBEFFC3E2E4FFB5DBDDFF81C7CBFF63B9BEFF75BCC0FFBADDDEFFFFFF
      FFFFBADEDFFF071B8BFF1618ACFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000095C9FF00C6F9FF00C3
      F6FF00BCEFFF007AAEFF84C9FFFF84CAFFFF7EC8FFFF7AC4FFFF76C2FFFF5BB0
      F5FF0074A5FF017CB0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C37DFFF3262FEFF3E6E
      FFFF4071FFFF3D6DFFFF3766FEFF3466FFFF3164FFFF295EFFFF2156FFFF1B54
      FFFF010DB6FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBCC2FF5A5978FF9B9B9BFFD5D5D5FFD9D9D9FFCBCB
      CBFFC3C3C0FFB9B8AFFF93938FFF555573FF1F217BFF070B9EFF0003C5FF0001
      D6FF0000E3FF0000F1FF0000FFFF1F209AFF6A6A61FFCFCFCEFF4E667BFF6F7F
      94FFF6F6F6FF0000000000000000000000000000000000000000000000000000
      000000000000000000008A7564FFEFE0BEFFFFFEE7FFFDF6E1FFDBE6D7FF7EBD
      B9FF78C5C9FFBADFE1FFCBEDEFFFCBF9FCFFAFEFF2FF9CD4D7FF98CCCFFF90C9
      CBFF98CDD0FF000DA8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001193C5FF00C6F9FF00C5
      F8FF00C6F9FF00A3D6FF037EB1FF2F97D0FF3C9FDAFF40A2DEFF2791CCFF0075
      A7FF009FD1FF1985B7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000899AFDFF0E38EFFF4373
      FFFF4471FFFF4472FFFF3F6EFFFF3767FFFF2F60FFFF2959FFFF2357FFFF123C
      ECFF3C40CBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E629FFF72717FFF9D9D9DFFC1C1
      C1FFC4C4C4FFBBBBBBFFB3B3B2FFA6A6A0FF88887DFF646462FF48485CFF3233
      67FF242578FF1D1E8BFF1A1B95FF2A2B80FF4A4A4BFF565655FF5F627CFFE6DE
      DAFFFAFAFAFF0000000000000000000000000000000000000000000000000000
      00000000000000000000BD9E97FF704B3BFFCEBAA2FFFFFFF5FFDAEDE6FFA4D3
      D0FF8FD6D9FF9FE6EBFFADE9ECFFA5DEE1FF9AD8DBFFC8E5E7FFFFFFFFFFDBEF
      F0FF319AA0FF151D6CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007CCBE8FF00A1D3FF00CF
      FFFF00C6F9FF00C6F9FF00B9ECFF00A4D7FF009ACDFF0094C6FF009BCEFF00B3
      E5FF008ABEFF8AC8E4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003452F3FF2351
      FAFF4E7DFFFF4C7BFFFF4170FFFF3A69FFFF3263FFFF2D5FFFFF1F50FCFF0714
      BEFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2B7C0FF61578CFF6C6A
      7FFF858585FFA0A0A0FFAAAAAAFFA8A8A8FFA1A1A0FF989896FF8A8A86FF8080
      78FF7B7B6FFF767666FF787867FF7C7C71FF555556FF4E5155FFA6867FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCC8C5FFA08875FFF5EBDFFFFFFF
      FFFFEDF9FCFFA7CFCEFF88BABAFFCEF3F4FFF2FFFFFFFDFFFFFFFFFFFFFFC3EB
      EDFF306F6FFF717162FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ACD1FF009E
      D2FF00BBEEFF00BCEFFF00AEE1FF00B4E7FF00BBEEFF00B8EBFF00A9DCFF018B
      BFFF51A7D1FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003758
      FFFF103FF9FF3764FBFF4271FFFF3A6CFFFF2958FAFF1236E2FF0F1EC7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBB7
      B5FFAEACC1FF505F90FF63687AFF767677FF848484FF898989FF858585FF8181
      81FF828282FF828282FF818181FF6A6A6AFF4D4D4DFFA9A9A9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008A5448FF7A5848FFAA8D
      75FFF7EADFFF9A8C8AFF595D6DFF5A6768FF5C7476FF678687FF587F81FF4D64
      65FF7B7B7BFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000092CF
      E3FF46AAD1FF3CA5CCFF5FB4D4FF41A4CAFF2295C1FF2090BFFF46A4C9FFA0D0
      E5FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CABFBFF3D56EFFF1731E5FF142BDCFF3445DAFF7984E4FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CAD6EFFFA1B1CEFF808FA6FF617186FF576473FF565F
      68FF646566FF646464FF636363FF7B7B7BFFC5C5C5FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F5FFA29183FFA49B95FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F5FFE9E9E9FFE6E6E6FFE0E0
      E0FFD9D9D9FFDADADAFF2D2E31FF091317FF2F343BFF55595DFFD5D5D5FFD9D9
      D9FFDCDCDCFFE4E4E4FFE8E8E8FFEDEDEDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B9E0FF6473C1FF4052B1FF4254B3FFDCDFF1FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000079AAE0FF3684D3FF6FA6DEFF9AC0E8FFB6D1EEFFF2F7FCFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003683D2FF6EA5DCFF99BEE6FFB5D0EDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFBFF7E9DB5FF214A64FF17395DFF253C67FF364C73FF6B829DFFEDED
      EFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFDFF4658
      B2FF01189AFF0E0DB0FF1906C0FF0E0EADFF162F9CFFF1F2F9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000088AEE1FF4B7FCCFF6894D5FFACC6E9FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E0EACFF1239A3FF0000000000000000F5F8
      FCFF4289D3FF006ED1FF007ADBFF0075D8FF0073D6FF006CCFFF629EDBFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFDFFEBEE
      F2FF3B7ABDFF0059A9FF005AA2FF005298FF005197FF005099FF5080B2FFE4E4
      E4FFF5F5F5FFFDFDFDFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFF5
      F7FF89B4DEFF468CCCFF3D87C9FF3275BDFF4D82C0FF5F8EC5FF3F70ABFF365E
      93FFEBEDEFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003549AAFF0612
      A3FF1F00D6FF2700E2FF2800DDFF2A00DCFF0A10A7FF283DA4FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006897D8FF0045B7FF0756C6FF054FBFFF003FB3FF1455
      BEFFAFC8EBFF0000000000000000000000000000000000000000000000000000
      00000000000000000000230CD9FF0750C8FF016ACDFF1949B0FFE0E9F6FF2172
      CBFF007ADAFF0080E1FF007CDFFF007ADCFF007CDCFF007ADBFF3F8AD5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000169CBFF1743A2FFA8AFB8FF123F
      6FFF003259FF002A4AFF012349FF02204BFF02214BFF012248FF152D46FF6868
      68FF8D8D8DFFC1C1C1FF608BC7FF0044B6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3F0
      F8FF82AED4FF3B7CBCFF387EBBFF347AB8FF5C99C8FF79ACD0FF5389BCFF295A
      9AFF869AB4FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A9B0DCFF01169BFF1B00
      E1FF1E00E6FF0B0BB4FF06129AFF1505C6FF2300DFFF0613A2FF495BB1FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000098B9E4FF003CAFFF1673D6FF40D0FFFF3AC0FFFF299EF2FF0552
      C1FF0043B3FFAAC5E9FF00000000000000000000000000000000000000000000
      000000000000072BBAFF0166CAFF0C87E5FF0988E8FF0565C9FF2078D0FF0662
      C9FF005EC9FF0058C7FF005CCAFF0073D6FF0079D9FF0078DAFF1870CBFFEEF4
      FBFF00000000000000000045B5FF0F6DD0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000B81DBFF0767B1FF023161FF0B2447FF0C17
      64FF42449BFF7D7ACCFF9890D3FF9F94CAFF9F94CBFF9890D4FF7E7BCDFF544F
      9DFF34316BFF2E394FFF002259FF0C54A0FF3DC8F5FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D9EB
      F4FF87B1D6FF3E7EBEFF387DBCFF3075B4FF528CC0FF72A0C9FF5282B3FF2B59
      93FF91A5BAFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000495BB2FF090BBDFF1C00
      F7FF0510ADFF001B92FF0010C0FF001C8DFF1902D5FF1D00DEFF03159AFF606F
      BEFF000000000000000000000000000000000000000000000000000000000000
      0000B6CDECFF003EB2FF1165CCFF33B4FEFF1063CCFF0B5BC5FF2DA4F7FF3BC3
      FFFF0654C2FF0047B6FFF2F6FBFF000000000000000000000000000000000000
      00000235B8FF0055C3FF0B95EFFF1399F0FF058BE9FF056CCDFF8CF3FFFF7AE5
      FFFF61C7F5FF55B7ECFF3696DCFF005DC6FF0078DBFF0079DBFF0071D3FF0066
      C9FF659BD8FF0044B5FF0067CBFF0067CCFF0C62CAFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000055C2FF0A88DAFF0C5E94FF032D55FF20287DFF8D87D1FFB099
      A1FF8F6457FF682F1EFF571806FF561705FF561704FF581907FF693120FF9168
      5BFFB29CA7FF8883D0FF1C2579FF00224BFF083D7FFF0A54B5FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C4E1
      F0FF8EB4D6FF4485C0FF3A81BDFF3174B4FF437BB5FF5581B7FF40699FFF223C
      6FFF94B0C9FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000273DA0FF0D06D9FF1600
      FDFF001C84FF1A04CDFF0C00FFFF001C8DFF0F08C5FF1B00EBFF1602D4FF0119
      95FF8C97D0FF000000000000000000000000000000000000000000000000D3E1
      F4FF0043B4FF0850BFFF37BBFFFF0750BFFF003BB1FF0043B7FF002FA9FF2EA7
      F6FF2FA6F6FF003FB2FF86ACDFFF000000000000000000000000000000000923
      D7FF5DB3E6FF60B4E3FF0049C5FF0286E9FF006EDAFF003AB9FF68CBF2FF7DE6
      FFFF71DAFFFF77E4FFFF75E3FFFF0962C9FF0075D9FF0078D9FF0079DBFF007F
      E1FF0073D6FF0063C7FF0078DBFF007ADDFF0064C8FF004ABAFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056A2CCFF00286BFF072161FF7774C8FFAC9192FF662D1CFF672E
      1DFF9A7469FFA07C72FFB2958DFF9C766BFF9C786DFFA38178FFB1948CFF9B75
      6AFF642B19FF6A3222FFB1979AFF7471C6FF061A58FF002968FF002B99FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFDFF00000000BCDA
      F0FF7DB5DDFF3B91C7FF3898C8FF3798C6FF4BA2C9FF60B0D4FF5FB0D6FF326E
      A4FF4E7AA1FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004254B1FF0510B1FF1100
      FFFF0311B1FF05178DFF031991FF021698FF1400EBFF1200DEFF1600E8FF1006
      D2FF001B8EFFB0B6DFFF00000000000000000000000000000000E5EDF8FF0F51
      BCFF0044B6FF32B0FDFF2EAFFBFF0025A4FF3098E4FF4EDEFFFF003AB3FF0B5B
      C6FF3FCAFFFF0655C5FF4379CAFF000000000000000000000000022CB7FF50A8
      E0FFBBFFFFFFB7FFFFFF4DA1DAFF0447BDFF2D86D3FF4EABE2FF76DDFDFF75DB
      FFFF6CD3FFFF6BD3FFFF73E2FFFF1163C9FF0059CAFF007EDDFF007DDEFF006D
      D2FF0067CEFF007EE0FF0079DBFF007BDCFF0079DCFF0063C9FF0043B7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AEEDEDFF678F8FFF202A73FFA89ECFFF7C4C3EFF662D1CFFB3978FFFB89D
      96FF642A19FF581A07FF6F3929FF632817FF5A1C09FF591B08FF774437FF6C34
      24FFBBA39CFFB1948CFF632918FF815246FFA79ED2FF111F6BFF002669FF0A55
      B9FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F9FCFFEFF5FCFF8EC0
      E4FF3E8592FF2A7F77FF2E8875FF2A8473FF267C6EFF257A6EFF2B8075FF2563
      66FF3D6E8AFFEBF2FCFFF3F8FDFFFDFDFDFF0000000000000000000000000000
      00000000000000000000000000000000000000000000E7E9F5FF3246A5FF0214
      A6FF0C00F3FF060CCCFF050CBBFF1001EBFF0F00EAFF0F00E3FF1000E1FF1400
      F2FF0D08C8FF001B8BFFD5D8EEFF0000000000000000000000002362C4FF003B
      B1FF2599F0FF36B9FFFF32AEFFFF0249BAFF0844B0FF2688DCFF0033ABFF146C
      D4FF43D5FFFF095ECAFF2763C2FF00000000000000005689D4FF64B3E6FFCEFF
      FFFF97FBFFFF93F3FFFF9EFFFFFF8EF1FAFF9CFFFFFF93F7FFFF7BE1FFFF74D9
      FFFF6FD6FFFF6AD2FFFF6ED9FFFF58BFF4FF1A70CCFF0054C3FF005BCAFF0B65
      C8FF1C79D1FF005BC6FF007CDDFF0077D9FF007ADBFF0079DAFF0065C8FF0F69
      D0FF00000000000000000000000000000000000000000000000000000000C8F8
      F8FF63A5A8FF2D3C79FFB0A3C8FF672F20FF86594DFFCBB7B2FF683021FF7947
      39FF591B08FF5A1C09FF6E3828FF642A18FF5A1C09FF5A1C08FF794638FF5A1C
      09FF805043FF6D372BFFD7C8C5FF825446FF6C3525FFAEA4CFFF0F206CFF0A47
      8CFF41D0F9FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFCFDFFEAF2FAFFD1E4F9FF5A9B
      B7FF215E2EFF2B7B4BFF2E8C5CFF2A9361FF2A9663FF2A905EFF26804EFF2066
      31FF398287FFC4DDF6FFEAF2FAFFF9FBFDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006675
      BDFF001797FF0904EDFF0D00FFFF0B00F5FF0B00E9FF0C00E9FF0C00E7FF0D00
      E8FF1300F8FF090CBFFF102891FFF3F3FAFF000000004882D1FF0034AFFF2F97
      E8FF3EC0FFFF2AA2FFFF31ADFFFF2CA5F8FF044EBFFF0030ABFF0D62CCFF37BE
      FFFF1775D9FF0044B7FF6092D6FF00000000000000007CA5DFFF489DDCFFC5FF
      FFFFA4FDFFFF93F2FFFF91F0FFFF92F3FFFF87E9FFFF89EDFFFF8FF2FFFF8EF2
      FFFF86EBFFFF7AE1FFFF6DD4FFFF71DCFFFF77E6FFFF49AEEBFF0E60C5FF51BD
      F6FF6CDFFFFF1973D1FF0058C5FF007BDCFF0077D9FF007CDCFF007CDCFF0063
      C8FF1372D6FF0000000000000000000000000000000000000000489CDBFFA1D1
      D1FF374F72FFA69DD0FF693121FF946C62FFE4DAD7FF825346FF5A1C09FF7947
      37FF591B08FF5A1C09FF6E3828FF642A18FF5A1C09FF5A1C08FF794638FF5A1C
      09FF805043FF571706FF86594DFFE2D8D5FF8E6357FF6E3928FFA29BD4FF0422
      61FF105FB2FF0044B6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFDFFF0F6FCFFE2EEFAFF82B7DAFF246B
      45FF2D814CFF349B69FF34A778FF2FAC7EFF2FAD7FFF2EA97AFF2C9E6AFF2886
      51FF216D3AFF63A6C5FFD7E8F9FFEEF5FCFFFBFCFDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000959ED2FF001A89FF0409CFFF0700FFFF0800F7FF0900EDFF0A00EDFF0A00
      ECFF0B00ECFF1100FCFF0410AFFF4B57ABFF7EA6DDFF0035B3FF308BDCFF60DA
      FFFF3FB3FFFF31A7FFFF29A2FFFF31AEFFFF33B3FFFF34B7FEFF38BCFFFF1164
      CBFF003AAFFF548AD2FFFCFCFEFF0000000000000000000000007694D8FF2F7E
      D0FFACFFFEFF9CF9FFFF91F0FFFF92F1FFFFA5FFFFFF8CEFFDFF62C3EDFF51B4
      E9FF59BEEDFF71D8F9FF85EDFFFF7DE7FFFF69D3FFFF6BD8FFFF67D8FFFF5FCD
      FFFF58C8FFFF5CD0FFFF1673CFFF0058C5FF007CDDFF007ADBFF006ED2FF0661
      C7FF003BAFFF0000000000000000000000000000000000000000718ECFFF1A45
      76FF7572C6FF815245FF835548FFEFEAE8FF6B3423FF7E4E40FF591B08FF7947
      37FF591B08FF5A1C09FF6E3828FF642A18FF5A1C09FF5A1C08FF794638FF5A1C
      09FF805043FF571706FF794639FF733F31FFF5F2F1FF7E4D3FFF8B6053FF6667
      BFFF002267FF5185CAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000F5F9FDFFE8F1FAFFADD0F0FF2F7E6BFF2C7C
      3EFF359B65FF38AD7CFF36B589FF31B98EFF31BA90FF31B68AFF30AD7DFF2C9C
      67FF267C43FF247148FF8FC0E4FFE2EEFAFFF2F7FCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C5CAE7FF05208AFF0211B5FF0500FFFF0600FFFF0700F3FF0800
      F1FF0800F0FF0900F7FF0B00FFFF0007A6FF000492FF2B86D7FF7EF3FFFF5BC7
      FFFF4CBAFFFF40B2FFFF2FA6FFFF2BA2FFFF39BBFFFF2EA5F7FF044EBDFF0040
      B2FF94B6E3FF00000000000000000000000000000000B9D1EDFF1577D2FF0049
      C2FF99EBF6FFA6FFFFFF98F7FFFFAFFFFFFF4FA4DCFF004EBFFF0324D3FF0514
      DDFF0420D7FF023ACFFF196ECEFF53B7EEFF7FEDFFFF6FD9FFFF60CAFFFF5AC6
      FFFF55C1FFFF59C7FFFF5ACEFFFF1972D0FF0061CAFF007CDEFF015DC3FF0000
      00000000000000000000000000000000000000000000000000001264B1FF1522
      7CFFB1999EFF622816FFEEE8E7FF977066FF5A1C09FF7D4D3EFF591B08FF7947
      37FF591B08FF5A1C09FF6E3828FF642A18FF5A1C09FF5A1C08FF794638FF5A1C
      09FF805043FF571706FF794639FF591B07FFAA8A82FFEAE2E0FF5F2311FFB7A2
      ACFF363B81FFDADADAFF00000000000000000000000000000000000000000000
      00000000000000000000FBFCFDFFECF4FBFFD5E6F9FF569CB2FF2C7732FF3496
      5AFF2AB082FF2DBD97FF36BD94FF33C19BFF33C29DFF32BF98FF31B689FF2FA6
      73FF2B9059FF256B31FF398587FFC1DCF6FFE8F1FAFFF9FBFDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E4E6F4FF3045A0FF0015A6FF0301F8FF0400FFFF0400
      FBFF0500F7FF0500FFFF0000ECFF000097FF225DC5FF8FFFFFFF79E1FFFF62CC
      FFFF57C3FFFF4BBAFFFF42B7FFFF41C4FFFF1E8AE5FF003FB4FF0A4CB8FFBCD2
      EEFF00000000000000000000000000000000A0C1E8FF006CD2FF0C9BF4FF2279
      D0FFBFFFFFFFA1FFFFFFB7FFFFFF53A2DAFF0050CDFF0170D4FF000000000000
      000000000000000000000007E6FF0027AAFF1C76D1FF6FDBFCFF77E4FFFF5EC9
      FFFF59C5FFFF55C2FFFF56C7FFFF67DEFFFF1169C8FF006ED3FF0070D3FF7BAB
      DFFF0000000000000000000000000000000000000000006BD0FF0867A6FF7F7D
      CFFF6F3929FFB2968DFFEBE4E2FF5A1D0BFF5A1C09FF7D4D3EFF591B08FF7947
      37FF591B08FF5A1C09FF6E3828FF642A18FF5A1C09FF5A1C08FF794638FF5A1C
      09FF805043FF571706FF794639FF591B08FF602513FFF4F1EFFFAA8A82FF7642
      35FF837DCEFFAFAFB1FFFDFDFDFF000000000000000000000000000000000000
      00000000000000000000F7FAFDFFE6F0FAFF96C4E6FF2D7C4BFF328A43FF2EA5
      6FFF22BD96FF2EC29EFF38C39FFF33C9A7FF33CAAAFF33C6A4FF32BD95FF29AA
      79FF27985EFF2E854AFF24642DFF6FAAC9FFDFECFAFFF0F6FBFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A68B7FF001792FF0006E7FF0000
      FFFF0000FFFF0000E7FF000095FF502452FFA5AC87FF92FFFFFF79E5FFFF70D4
      FFFF62CBFFFF64D5FFFF5DD7FFFF1F7BD8FF0037AEFF2D69C7FFE6EEF8FF0000
      000000000000000000000000000000000000106BC9FF2386D9FF004FC4FF519F
      DCFFBDFFFFFFACFFFFFFA2ECF6FF004FC2FF13A6FFFF0A7DD8FF0013E0FF0000
      0000000000000000000000000000000000007F9493FF0D63C8FF5DC9F6FF74E1
      FFFF5BC8FFFF59C5FFFF5CCDFFFF359AE5FF005DC6FF0076D9FF0079DCFF156E
      C9FFEDF3FAFF000000000000000000000000000000002281D0FF052379FFB19E
      B2FF5F2311FFF6F2F1FFB49891FF5A1C08FF5A1C09FF7D4D3EFF591B08FF7947
      37FF591B08FF5A1C09FF6E3828FF642A18FF5A1C09FF5A1C08FF794638FF5A1C
      09FF805043FF571706FF794639FF591B08FF591B08FFBCA39CFFF1ECEBFF5B1D
      0DFFB4A5BFFF767494FFF6F6F6FF000000000000000000000000000000000000
      00000000000000000000EEF5FBFFD6E6F9FF5BA1B3FF307D2DFF339552FF26B0
      80FF25C09AFF37C29DFF38CAA8FF35D0B3FF35D2B6FF34CDAEFF2DC098FF69C9
      A8FF4EAF7FFF24894CFF2D6E31FF3B8487FFC7E0F7FFEBF2FBFFFBFCFDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009699DAFF00178DFF0008
      DBFF0000EFFF000096FF9791BDFFFFEAB6FF993317FF87877FFF8BFFFFFF7BE8
      FFFF81EDFFFF72E2FCFF1563C8FF0036AFFF5D8FD5FF00000000000000000000
      0000000000000000000000000000000000005393D9FFC4FFFFFFA6ECF6FFA3FC
      FEFFA3FFFFFFB8FFFFFF78C3E5FF005FD3FF21B2FFFF1084E0FF0031A1FF0000
      000000000000000000000000000000000000000000007F8383FF0E61C5FF60CC
      F7FF71DFFFFF5EC9FFFF5BCBFDFF004FBDFF006AD4FF007BDCFF0079DBFF006F
      D2FF0D6BCBFF2178CFFF5B9ADAFF0000000000000000B5EBEBFF4D5B9FFF9E7A
      6FFF8F6559FFFFFFFFFF90665BFF825346FF68301EFF8C6254FF5B1E0BFF9A75
      6AFF5D210FFF815245FF6E3828FF713D2EFF703B2BFF6B3323FF8E6358FF591B
      08FF977066FF561606FF8B6055FF662C1CFF774436FF977065FFFFFFFFFF885B
      4EFFA6857DFF2A3C92FF558FCBFF000000000000000000000000000000000000
      000000000000FDFDFDFFEDF4FCFFC3DDF6FF4A9990FF328230FF319A5AFF23B5
      88FF2CBE95FF3BC59FFF38CFB1FF35D6BEFF35D8C2FF33D3B8FF26C29CFFAFE6
      D6FFF1F8F3FF38965EFF2A7635FF276945FFA1CAECFFEAF2FBFFF9FBFDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFCFBFFFDFDFCFF00000000EBEBF8FF282D
      B3FF0000A4FF421F47FFFFDCA5FFFFFFF8FFF2C2BBFF8D2C19FF87877CFF98FF
      FFFF6EDCFEFF0A49BAFF0034B0FF85ACE0FF0000000000000000000000000000
      0000000000000000000000000000000000006B98DAFF9EEFF8FFBEFFFFFFA5FF
      FFFF9CFBFFFFBBFFFFFF68BAE0FF006ADBFF22AEFFFF1D9EF4FF2673CBFF0000
      0000000000000000000000000000000000000000000000000000798183FF0D64
      C7FF72DEFFFF66D2FFFF68D7FFFF3B9FE4FF0058C7FF0080DFFF007ADBFF0079
      DBFF007BDDFF007DDDFF0067CAFFE3EDF8FF000000008ED7DFFF7274C4FF7A48
      39FFB89D96FFFFFFFFFF805043FFC1A9A5FF8C6155FFAA8A80FF6E392AFFE7DE
      DCFF794738FFD1C0BBFF6F392AFF966E63FF9B766BFF91675CFFC2ABA6FF5C1F
      0DFFD7C8C4FF551504FFBCA49DFF85574CFFAF9188FF8B5F52FFFFFFFFFFB093
      8BFF835448FF5763BAFF005DB6FF000000000000000000000000000000000000
      000000000000FDFDFDFFECF3FCFFB3D4F2FF44947CFF338533FF309E5FFF1EB2
      83FF2DB688FF3BC8A3FF39D4B9FF36DDC7FF36DFCBFF35D8C0FF30CBA8FF50C5
      A1FF7AC8A6FF3A9A62FF257634FF20602FFF8CBDE0FFE8F1FAFFF9FBFDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F1F0FFC3A7A1FF9F7469FF946155FF9C644CFFB1794DFFC6ADA5FF9B83
      96FF776389FFECCFABFF75301BFFDDAAA3FFFFF8F3FFF4C3BFFF97361CFF7F81
      7AFF004CDEFF0E43C8FFC1D4F1FF000000000000000000000000000000000000
      0000000000000000000000000000000000008DACE2FF7ED7F3FFB4FFFFFF9CFB
      FFFF9CFBFFFFB9FFFFFF72BFE3FF0065D7FF21ADFFFF22AAFEFF0C7BD9FF6070
      A4FF00000000000000000000000000000000000000000000000000000000556E
      8FFF2B8ADAFF7BE7FFFF61CDFFFF6ADBFFFF095FC5FF005CCCFF0071D8FF0077
      DAFF0079DBFF007CDCFF006CCFFFCBDEF3FF0000000070BFD8FF8E8CDAFF6329
      18FFD2C2BCFFFFFFFFFF7F4F42FFC1A9A5FF8C6155FFAA8A80FF6F392AFFE7DF
      DCFF794838FFD5C5C0FFC3ADA8FF966E64FF8A5F52FFBBA29CFFE4DAD8FF5C1F
      0DFFC7B2ADFF551604FFDDD0CDFFB59A94FF6D3626FFA48379FFFFFFFFFFCAB6
      B1FF6B3324FF7F81D5FF0061B9FF000000000000000000000000000000000000
      000000000000FDFDFDFFECF2FAFFB5D6F3FF489B88FF328636FF2F9A58FF65C0
      97FF81D3B7FF3ECAA8FF37D6BCFF36E2CEFF37E4D3FF35DCC6FF34CEAFFF2CBA
      90FF23A56EFF2A9558FF267634FF246838FF91C0E3FFE8F1FAFFF9FBFDFF0000
      000000000000000000000000000000000000000000000000000000000000D4C0
      BBFF814538FFA37167FFD1ABA2FFE8C1BAFFF0C1BCFFE5B6ADFFD39C82FFA565
      3DFF8E502DFFFCF9F7FFD2C1C1FF672416FFDEABA3FFFFF7F3FFF5C7BEFF9C41
      24FF57476AFFE6EDF9FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6C9ECFF64BCE7FFC9FFFFFFA1FF
      FFFF9EFCFFFFB1FFFFFF94DEEFFF0059CBFF1FAEFFFF21A7FAFF20A8FBFF0761
      C3FF855035FF0000000000000000000000000000000000000000000000000000
      0000154BA8FF60CBF6FF6DD9FFFF68D7FFFF47B0EEFF146DCDFF0D66CDFF005F
      C6FF0076D8FF007BDCFF0071D5FF9EC2E8FF000000005AA9CFFF9894DCFF5C1F
      0DFFDFD3D0FFFFFFFFFF7F4F42FFC1A9A5FF8C6155FFAA8A80FF6F392AFFE7DF
      DCFF794838FFD8C9C5FFFFFFFFFF966E64FF591B08FFA8877EFFFCFBFBFF5E21
      0FFF5B1E0BFF622715FFE1D5D2FF5E2210FFAC8D84FFFEFDFDFFFFFFFFFFD6C7
      C3FF632819FF9190DDFF0066C0FF000000000000000000000000000000000000
      000000000000FDFDFDFFEDF4FCFFC1DCF6FF56A5A4FF318637FF359B5AFFDEF0
      E5FFFFFFFFFF6FDAC2FF2ED4B9FF37E3D0FF37E6D7FF35DDC8FF34CEB0FF32BD
      93FF2FAA77FF2B9459FF297936FF2E7856FFA1CAEDFFE9F1FBFFF9FBFDFF0000
      0000000000000000000000000000000000000000000000000000C1A69FFF864B
      3EFFDBC3BEFFFFFDFBFFFFF2EEFFFFE3DEFFFFD9D5FFFFD7D1FFFFDCD6FFFFDB
      D7FFB47D74FF6B2B1CFFEFE9E9FFDED2CFFF74372AFFDEB1A7FFFFF5F1FFF9CC
      C4FFA15939FFC89E8AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCDAF2FF4194DAFFC1FFFFFFB3FF
      FFFFB3FFFFFFA5FFFFFFBAFFFFFF1464C6FF0E95F5FF24ABFCFF22A9FDFF199B
      F2FF1D5CB0FF682C20FF00000000000000000000000000000000000000000000
      000077555BFF3290E0FF7BE8FFFF5EC9FFFF65D2FFFF68D9FFFF6BDDFFFF1C7D
      D5FF0066CFFF007CDCFF0075D8FF6FA6DEFF000000003C88C9FF9694DDFF5D21
      0FFFDBCEC9FFFFFFFFFF7F4F42FFC1A9A5FF8C6155FFAA8A80FF6F392AFFE7DF
      DCFF794838FFD8C9C5FFFFFFFFFF966F64FF987166FFB99F99FFD8C9C7FF5C1E
      0DFFD1C0BBFF551504FFC2ACA5FF733F2FFFD4C4C1FFA98981FFFFFFFFFFD4C4
      BFFF642A1CFF8C8CDDFF006CC8FF000000000000000000000000000000000000
      00000000000000000000EEF5FCFFCFE3F7FF60ADBEFF388A41FF2F9854FFCFEA
      DCFFFFFFFFFF8FE2CFFF2BD2B6FF37E1CDFF37E4D3FF35DCC6FF34CEAFFF32BC
      93FF2FA874FF2B9257FF2E7937FF3E8D87FFBAD8F5FFEBF2FAFFFDFDFDFF0000
      00000000000000000000000000000000000000000000D8C5C1FF854B3BFFEBDF
      DDFFFFFFFFFFFFEAE7FFFFF0ECFFFFF0EBFFFFDAD6FFFFCCC6FFFFC6C1FFFFCF
      C8FFFFE9E5FFC18C82FF6A2B1CFFF8F4F2FFBDA299FF6E3324FFE2B3ABFFFFF4
      F0FFF6CDC6FF925848FFAF8E84FF000000000000000000000000000000000000
      000000000000000000000000000000000000F5F8FCFF4C7FC2FF1957AAFF1F65
      C6FF73C9ECFFB7FFFFFFBBFFFFFF69B3DEFF005BD1FF28B8FFFF21A3F8FF24AE
      FFFF1690EBFF225FB1FF652C23FF000000000000000000000000000000000000
      0000F0C9C5FF1C67C0FF7AE4FFFF66D1FFFF5FC9FFFF5CC7FFFF68D8FFFF2E93
      E1FF0060CBFF007FDFFF007AD9FF3583D3FF00000000497ABAFF7A78D3FF6C35
      24FFC7B2ACFFFFFFFFFF7E4F42FF895D51FF6D3625FF91685CFF5E2210FFA888
      7FFF612614FF997369FFDED2CFFF6C3525FF744031FF733F2FFF99736AFF591A
      08FF8F6458FF561605FFC2ACA6FF602513FF825446FF7B493AFFFFFFFFFFC1AA
      A4FF744031FF6F77D3FF0076D1FF000000000000000000000000000000000000
      00000000000000000000F2F7FCFFDFEBF9FF75B9D7FF489756FF269149FF94D0
      B1FFFFFFFFFFA9E8D9FF2DD1B2FF37DDC7FF37E0CBFF36DAC0FF35CCABFF32BA
      90FF2FA672FF299053FF307A3AFF4E99A9FFD0E3F7FFEDF4FCFF000000000000
      000000000000000000000000000000000000FDFDFDFF864B3CFFD7C1BCFFFFFF
      FFFFFFEFEDFFFFFFFFFFC9A7A0FFA6766BFFFFF5F2FFFFE2DCFFFFCEC7FFFFC7
      C1FFFFC7C0FFFFE7E2FFA36C5FFF783F32FF9D6E63FFCBB4AFFF7D483BFFDEAF
      A7FFFFF3EEFFF7CFC9FF8D574BFFA68179FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F3
      FAFF1368CAFFBDFFFFFFACFFFFFFBBFFFFFF1561C2FF0D8CEFFF28B6FFFF20A2
      F7FF23AEFEFF1796ECFF0F5DB8FF594555FF0000000000000000000000000000
      0000000000004277C5FF71DAFEFF6FD8FFFF60CCFFFF5BC7FFFF64D3FFFF40A5
      E8FF005DC8FF0186E4FF016ED1FF90BAE6FF00000000844A3BFF746BB6FF895D
      50FFA6857BFFFFFFFFFF946D63FF591A07FF581A07FF8A5E51FF581A07FF7E4E
      42FF571806FF744131FFC1AAA4FF581A07FF581A07FF581A07FF815246FF591B
      08FF591B08FF581908FFCDBAB5FF571805FF591B08FF805043FFFFFFFFFFA17E
      75FF91685DFF3D5BB8FF016DCFFF000000000000000000000000000000000000
      00000000000000000000F7FAFCFFE8F1FAFF98C9EEFF5CAC81FF289045FF5EB7
      87FFFFFFFFFFCAF1E7FF35CEAFFF36D7BEFF36DAC2FF36D4B9FF34C7A4FF32B6
      8AFF2EA16DFF298B4FFF2F7A3BFF6EACCBFFDFECFAFFF2F7FCFF000000000000
      000000000000000000000000000000000000D9C7C3FF956154FFFFFFFFFFFFFF
      FEFFFFFFFFFFD2BEB6FF7D4436FF8A584CFFAA7B70FFFFF6F4FFFFE3DFFFFFCE
      C8FFFFC9C0FFFFD4CEFFEEC1BBFF80483BFFEBE2E0FF00000000D6C5C0FF8048
      39FFDDB2A8FFFFF9F6FFF7CEC7FF91594EFFAA877FFF00000000000000000000
      0000F3EDECFF0000000000000000000000000000000000000000000000000000
      00008EA9E1FF61B7E7FFB9FFFFFFB5FFFFFF9AE3F2FF0047BCFF17A4FAFF26AF
      FFFF1EA0F7FF24ADFFFF1FA2F9FF0972D2FF4C84C8FFCADBF1FFD3C3BFFF0000
      000000000000407DCEFF6FD9FCFF74DBFFFF65CDFFFF67D1FFFF6FDDFFFF5AC2
      F5FF0060CAFF017BDCFF4E8FD5FF0000000000000000000000008683B7FFAF93
      8EFF754132FFFEFEFEFFF7F4F4FFD1C0BBFFD5C5C1FFEFE9E7FFD0BFB9FFDBCD
      CAFFD0BEB9FFD8C9C5FFEFEAE8FFC9B5AFFFC5B0AAFFD4C4BFFFDDD1CEFFD0BF
      BAFFD0BFBAFFE0D5D1FFFEFEFEFFD7C8C3FFD0BFBAFFEDE6E4FFFEFEFEFF733E
      2FFFB59D9CFF0D46A6FF00000000000000000000000000000000000000000000
      00000000000000000000FBFCFDFFEBF2FBFFC1DCF6FF66B8B7FF329249FF42AA
      70FFE8F5EFFFEDFAF6FF41CDACFF33D0B2FF36D3B7FF35CEAFFF34C29CFF30B1
      83FF2D9C66FF298345FF318362FFA6CEEEFFE8F1FAFFF9FBFDFF000000000000
      000000000000000000000000000000000000B6928BFFC2A39DFFFFFFFFFFFFFF
      FFFFCAADA7FF7B3C2DFFECE3E1FF000000008D5A4EFFA37368FFFFF8F6FFFFE3
      DFFFFFCEC8FFFFCDC8FFFFDAD4FF9C675BFFE3D6D3FF0000000000000000DBCB
      C7FF7F4839FFD9B5ADFFFFFFFFFFFADCD6FF8F564BFFAB877EFFEBE3E0FFAA82
      79FF885044FFCDB6B1FF00000000000000000000000000000000000000000000
      0000BCA5A8FF0451BDFFB1FFFFFFA2FFFFFFBDFFFFFF7DC4E6FF0048C0FF15A2
      F7FF29B8FFFF20A3F8FF20A6FBFF22ACFFFF1695EDFF0A76D6FF1E75CEFF3078
      C5FF125DB4FF075BC5FF81E8FFFF73D9FFFF6FD8FFFF5EC5F7FF58BCEEFF68D1
      FCFF0565CBFF2570C1FF00000000000000000000000000000000C8C7D4FFABA2
      D1FF5A1C0AFFD8CAC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD2C1BDFF744032FF561705FF561604FF652B1BFFAF9189FFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8C9C6FF5C1F
      0EFFABA3D9FF1F5BA7FF00000000000000000000000000000000000000000000
      00000000000000000000FDFDFDFFF0F5FBFFDDEAF8FF7BC1DFFF50A46DFF2E9C
      5AFFCAE8DAFFFCFFFEFF4ECCAAFF30C9A6FF36CCABFF35C7A3FF33BC92FF30AA
      7AFF2B965DFF2E7F40FF4E9BAAFFCEE3F7FFEBF2FAFF00000000000000000000
      000000000000000000000000000000000000A67B71FFDCCDC7FFFFFFFFFFCAAF
      AAFF793628FFE2D4D1FF0000000000000000F9F6F5FF8F5E53FFA57669FFFFF7
      F4FFFFE2DDFFFFD0CAFFFFE0DAFFB07B71FFC3A9A3FF00000000000000000000
      0000D8C6C1FF7D4335FFDCBCB8FFFFFFFFFFF9E2E0FF8E5447FF76392BFFC7A0
      97FFCFA99FFF885449FF0000000000000000000000000000000000000000B1A4
      ADFF155CB6FF8DD9F3FFB1FFFFFF9EFCFFFF9FFEFFFFC5FFFFFF81C7E6FF0048
      BCFF0A85EAFF25B7FFFF25ADFCFF21A5F8FF20A7FCFF20A8FBFF1DA4F8FF1FAE
      FFFF0070DDFF3085D6FF91F7FFFF71D6FFFF83EFFFFF237FD4FF0046BEFF026B
      CEFF005DC4FF6E5560FF00000000000000000000000000000000FEFEFEFF6D64
      BCFF91685CFF835547FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD3C3BFFF5C1F0EFFA8877EFFD9D5D7FFD7D9DEFFC4AEA8FF682F1FFFA381
      78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85574BFF9A75
      6BFF4050BCFF6E5560FF00000000000000000000000000000000000000000000
      0000000000000000000000000000F7FAFDFFE8F1FAFF9FCCF0FF6EBEA6FF2693
      4BFF96D0B2FFFFFFFFFF5BCBA8FF2CC198FF35C49FFF33BF97FF31B487FF2EA3
      6FFF2A8C54FF318246FF7BB5D8FFE2EEFAFFF4F8FCFF00000000000000000000
      000000000000000000000000000000000000A87F76FFE5D8D6FFD3BEB8FF7839
      2BFFE6DBD8FF00000000000000000000000000000000FDFDFDFF9F7369FF9866
      5AFFF9E4E0FFFFDCD8FFFFE6E3FFB17D74FFC2A9A3FF00000000000000000000
      000000000000DFD0CDFF7C4133FFD7BBB5FFFFFFFFFFF6E1DCFFE6CDC8FFFFFF
      FFFFFFFBF7FF91594CFFD7C5C0FF000000000000000000000000000000005541
      57FF1C76CEFFC7FFFFFFB8FFFFFF9DFCFFFF9FFBFFFF9EFEFFFFBCFFFFFFA1E9
      F3FF226BC4FF0055CCFF0688ECFF19A4FEFF1EAAFEFF1CA7FDFF18A3FCFF0071
      E0FF0453C0FF85E7F8FF85E9FFFF7ADFFFFF7EE7FEFF0E68CAFF0283E8FF0B8E
      E9FF0886E3FF0B63C0FFB9B7C1FF000000000000000000000000000000003F30
      57FFB4A9CFFF5D200EFFBFA7A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFF744032FFAE8F88FF8EB7D7FF0660A9FF015DA7FF5390C2FFDDD4D3FF5D20
      0EFFE6DDDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3ACA7FF612514FFB3AB
      D6FF0963BBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFDFFEEF5FCFFD0E3F7FF75C3D7FF3F9E
      61FF54B17CFFF1FAF6FF6DCBAAFF29B889FF34BC90FF32B78AFF31AC7BFF2C9A
      64FF2A8244FF3D928BFFBBD8F4FFEAF2FAFFFBFCFDFF00000000000000000000
      000000000000000000000000000000000000BB9B93FFA2776DFF874D40FFE5D8
      D5FF000000000000000000000000000000000000000000000000C7AEA7FF773A
      2CFFF1DCD8FFFFE8E6FFFFECE7FF9C685CFFD8C6C1FF00000000000000000000
      00000000000000000000E2D4D1FF773929FFD8BCB5FFFFFFFFFFFFF6F5FFFFE3
      E1FFFFFFFFFFC6A49CFF97685CFF000000000000000000000000000000000000
      0000ACC4EAFF1E6CCBFFB6FDFEFFB3FFFFFF9CFCFFFFA0FCFFFFA2FFFFFFB2FF
      FFFFBEFFFFFF7DC2E6FF2675CBFF065BC7FF005ECDFF005DCFFF0056C7FF2978
      CBFF8BEBF5FF92F9FFFF7ADDFFFF84EAFFFF66C8F1FF0043BDFF0B96F0FF1294
      EEFF0E93EDFF0369CBFF716676FF000000000000000000000000000000000000
      00006062BCFFB09594FF5E2210FFDBCECAFFFFFFFFFFFFFFFFFFFFFFFFFFECE5
      E4FF571807FFE5E6E9FF0561A9FF005FA8FF005FA8FF005EA7FFB0CBE3FF8557
      49FFB69B93FFFFFFFFFFFFFFFFFFFFFFFFFFDFD4D0FF602412FFB9A2A3FF2A52
      BCFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F9FDFFE5EFFAFF8FC7EBFF6EBE
      9FFF3DA161FFE6F4ECFF8AD3B6FF26AF7AFF32B482FF30AF7CFF2FA46FFF2991
      57FF328246FF68ACCBFFDCEBF9FFEEF4FBFF0000000000000000000000000000
      000000000000000000000000000000000000DAC9C5FF8D574BFFE7DCD9FF0000
      00000000000000000000000000000000000000000000BFA29BFF8A4F43FFEDE3
      E2FFFFF7F4FFFFF0ECFFEDD4D1FF834A3CFFFAF8F8FF00000000000000000000
      00000000000000000000FAF8F8FF83483BFFDECBC9FFFFFFFFFFFFEDEAFFFFED
      EBFFFFF7F6FFFEF8F7FF874C3EFFE8DDDAFF0000000000000000000000000000
      000000000000ADC1E9FF1D6BCCFFB7FDFEFFB9FFFFFFB3FFFFFFAEFFFFFFBBFF
      FFFFA9FFFFFFB8FFFFFFBEFFFFFFA9EFF6FF8DDCEFFF84D7ECFF93E9F5FFA8FF
      FFFF96F7FFFF84E4FFFF7FE2FFFF7DE1FFFF86EDFFFF368AD7FF0058CBFF109B
      F2FF0369CDFFB1C9E6FF00000000000000000000000000000000000000000000
      0000EBEBEDFF7472CDFF9C786FFF632818FFD8CAC6FFFFFFFFFFFFFFFFFFE9E1
      DEFF561707FFE7E8EBFF0561A9FF005FA8FF005FA8FF005EA7FFB1CCE3FF8659
      4BFFB1948BFFFFFFFFFFFFFFFFFFDBCECAFF652C1BFFA6867EFF565DC8FF0F91
      E4FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFDFFEDF3FBFFC7DEF6FF74C3
      D5FF3F9F62FFC5E2CFFFA1D9BFFF27A76CFF30AA73FF30A66EFF2D9B61FF2C86
      48FF398E7CFFAED1F1FFEAF2FAFFF9FBFDFF0000000000000000000000000000
      00000000000000000000000000000000000000000000F1EBEAFF000000000000
      000000000000000000000000000000000000BEA099FF864E40FFEFEAE8FFFFFF
      FFFFFFEBE8FFFFFFFFFFAD7F73FFAB877CFF0000000000000000000000000000
      00000000000000000000B28D85FFB59087FFFFFFFFFFFFFFFFFFFFFAF8FFFFF7
      F5FFFFF5F3FFFFFFFFFFC1A49DFFA77E74FF0000000000000000000000000000
      00000000000000000000AFC3E9FF1D6FCDFFCBFFFFFF76C5EBFF0A51BFFF66B9
      E7FFBEFFFFFFB3FFFFFFA1FFFFFFABFFFFFFB3FFFFFFAFFFFFFFA2FFFFFF93F2
      FFFF8FEFFFFF95F7FFFF86E7FFFF7EE1FFFF7EE4FFFF9CFFFFFF409DDEFF0055
      C3FFADC4E3FF0000000000000000000000000000000000000000000000000000
      000000000000D9D8E2FF7F7BD9FFA38178FF5D200EFFB69B93FFFDFCFCFFFCFB
      FBFF662D1CFFC5B0AAFF6099C8FF005FA8FF005FA8FF2271B2FFECECEEFF5F23
      12FFD5C6C1FFFCFBFBFFB59991FF5D210FFFAA8B84FF797EDBFF3887C7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F8FCFFE0EDF9FF97C8
      EDFF56AF8FFF5EAE77FF7EC59DFF2DA264FF2EA265FF2E9D60FF2B8F51FF2F85
      49FF74B3D7FFD7E7F7FFF0F6FCFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BB9B93FF8A5243FFF0E8E6FFFFFFFFFFFFFB
      FAFFFFFFFFFFCEAFAAFF7C4031FFF6F1F0FF0000000000000000000000000000
      00000000000000000000AC867BFF98675CFFCCAFACFFF2EEEDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFA3736AFFAC847BFF0000000000000000000000000000
      00000000000000000000000000007A80A2FF1A78CFFF2D73CAFFEBEFF9FF89A6
      DDFF1567C9FF7BCFEEFFB3FFFFFF9EFBFFFF9EFBFFFF9BF9FFFFA1FFFFFFB5FF
      FFFFAAFFFFFF7FDCF3FF99FCFFFF88ECFFFF89ECFFFF95FFFFFF2E89D9FF98B8
      E5FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DDDCE3FF635FC0FFBBA6ABFF672E1EFF774436FFC7B2
      ADFFB1958DFF6F392AFFE5EAEFFF166AAEFF005EA7FFB9D1E6FFA07D73FF7846
      37FFBEA6A0FF733F31FF6A3223FFBEABB3FF6571D0FF83E0E5FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFDFFEDF3FAFFCFE3
      F7FF6AB8CEFF3C9A57FF329A55FF329D5CFF2E9959FF2C9353FF2B8440FF3C8F
      87FFB9D7F3FFE8F1FAFFF9FBFDFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFA099FF956357FFFDFBFBFFFFFFFFFFFFFFFFFFFFFF
      FFFFC19E99FF7F4135FFE0D2CFFF000000000000000000000000000000000000
      00000000000000000000FBF9F9FFDAC9C5FF9D6D62FF874D40FFB38E84FFEDE5
      E1FFFFFFFFFF9A6A5EFFA07166FFFEFEFEFF0000000000000000000000000000
      000000000000000000000000000000000000B6CDEBFFEFF4FBFF000000000000
      0000AA919DFF226AC5FFB9FFFFFF9EFFFFFF9CFAFFFFA9FFFFFF96F0FAFF3F8D
      D5FF1570CFFF0047C2FF3F95D8FFB2FFFFFFA1FFFFFF2279D2FF6B6F99FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F5F54FF676DC0FFA69FDBFFAB8D87FF6A33
      23FF612615FF591C08FFA5837AFF9DBFDCFF5893C4FFDBCDCAFF5A1C0AFF581A
      08FF6E3829FFB0938EFFA19CDDFF6583C3FF9BF6F6FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F5F9FDFFEBF2
      FCFFAFD2F1FF4EA588FF309044FF30964FFF2E934EFF2A8841FF2C8149FF86BB
      DFFFE3EEFAFFEEF5FCFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9968FFF8F584CFFE6D9D5FFF9F8F8FFE8DDDAFFC5ABA5FF945F
      54FF925E53FFE9DEDCFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEE7E5FFB28E86FF8B53
      46FF905C4FFFA57970FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002977CDFFCCFFFFFFC3FFFFFFB4FFFFFFC3FFFFFF92DBEFFF004C
      C9FF16A8F8FF1472D2FF5981CFFF52ADE3FF3993DBFF88A1D2FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4B9C2FF6E5FACFF9289
      D8FFB8A9C1FFB39791FF9C776EFFF1EFF0FFE5EEF5FFB89D96FFB49893FFBAAC
      C5FF898BE0FF2848B6FF4D6EBAFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFC
      FDFFEDF4FCFF94C2E2FF3E8F52FF2D8A3EFF2C8940FF28782BFF589CADFFE4EF
      FAFFEFF4FBFFFBFCFDFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDB4AEFFA47A70FF936054FF8B5247FF8D564AFFA2786DFFD3BE
      BAFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1EB
      EAFFCEB7B2FFFDFCFCFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004486D3FF4899DBFF62BEEAFF7FD8F1FFA7EFFAFFB5F7FAFF107B
      D5FF056ED1FFCDDEF2FF00000000598DD5FF7AA5DFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCB8
      B6FFCAC8E2FF5371D3FF6F88DCFF859EE4FF8EA5E5FF90A6E7FF8CA9E7FF216C
      C5FF076CCCFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFDFFFDFD
      FDFF0000000000000000A8C8E0FF3D7D64FF31724CFF7BA9BCFFEDF3FCFFFBFC
      FDFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F2F6FCFFCCD9F2FFB4C7EBFFA5BFE7FF7CA7DFFF5394D8FF307D
      CFFFCBDDF2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFAFFF4F4F4FFF2F2F2FFEFEF
      EFFFEBEBEBFFECECECFF6A6B6DFF30383CFF50545AFF84878AFFE9E9E9FFEBEB
      EBFFEDEDEDFFF1F1F1FFF3F3F3FFF6F6F6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000008400000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFDFFB0C3D2FF214A64FF17395DFF253C67FF364C73FFA1B0C1FFF6F6
      F7FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000008400000084000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7FA
      FBFFA9C8E7FF468CCCFF3D87C9FF3275BDFF4D82C0FF5F8EC5FF3F70ABFF5E7E
      A8FFF5F6F7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000008400000084000000840000000000
      0000848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFCFFF3F3
      F3FFEAEAEAFFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE9E9E9FFEDED
      EDFFF4F4F4FFFBFBFBFFFEFEFEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D0FF949494FF949494FF9494
      94FF949494FF949494FF949494FF949494FF949494FF949494FF949494FF9494
      94FF949494FFD0D0D0FFD0D0D0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F7
      FBFF85B0D5FF3B7CBCFF387EBBFF347BB8FF5C99C8FF79ACD0FF5389BCFF295A
      9AFFB5C2D2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFF00008400000084000000840000008400
      0000000000008484840084848400848484008484840084848400000000000000
      00000000000000000000000000000000000000000000F6F6F6FFDADADAFFBABA
      BAFFA6A6A6FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA3A3A3FFACAC
      ACFFB9B9B9FFC9C9C9FFD9D9D9FFE9E9E9FFF6F6F6FFFEFEFEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949494FF8F4D2CFF8F4D2CFF834B
      32FF834B32FF834B32FF834B32FF834B32FF834B32FF794A36FF6F4B3AFF8F4D
      2CFF8F4D2CFF949494FF949494FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBF3
      F9FF87B3D7FF3E7FBEFF387DBCFF3074B5FF538BC1FF72A0CAFF5283B3FF2B59
      93FFBAC9D2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFF0000FFFF0000FF000000FF00000084000000840000008400
      0000840000000000000084848400848484008484840084848400848484000000
      00000000000000000000000000000000000000000000E0E0E0FF9F8073FF8C4F
      35FF85482EFF84472DFF84472DFF84472DFF84472DFF84472DFF784B37FF7253
      46FF6A625FFF707070FF848484FFA2A2A2FFC6C6C6FFE2E2E2FFE9E9E9FFE3E3
      E3FFDCDCDCFFD6D6D6FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD7D7
      D7FFE1E1E1FFF0F0F0FFFBFBFBFF000000000000000000000000000000000000
      000000000000000000000000000000000000CD572FFFC1491EFFCC4E26FFCF59
      31FFE36345FFF0644DFFF76652FFFA6855FFFA6855FFC94C23FFCC4E26FFCD52
      2AFFAB4C21FF834B32FF54575EFF949494FFD0D0D0FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEE2
      F8FF8FBDD9FF4480C0FF397ABEFF2F6CB5FF4372B5FF547AB8FF3F63A0FF2241
      6FFFBFC5DFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000084000000FF000000FF000000FF000000FF000000840000008400
      0000840000000000000084848400848484008484840084848400848484008484
      84000000000000000000000000000000000000000000B9562DFFC14115FFD14B
      26FFDB5130FFE8583FFFF35F4AFFF96350FFFD6554FFFD6554FFCD4821FFD24B
      26FFD44D29FFA53F19FF7D4026FF65554FFF777777FF989898FFA1A1A1FF9595
      95FF888888FF7C7C7CFF737373FF707070FF707070FF707070FF737373FF7D7D
      7DFF929292FFBBBBBBFFE9E9E9FFFEFEFEFF0000000000000000000000000000
      000000000000000000000000000000000000BC481DFFCC4E26FFCF5931FFF064
      4DFFFA6855FFFB6A56FFFB735DFFFC755FFFF2654FFFD8886BFFCF5931FFFA68
      55FFF76652FFE36345FFB9481DFF644A3EFF949494FFD0D0D0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFEFF00000000D7DA
      F8FF7CA7DDFF346EC9FF316ECAFF2F6CC9FF4375CDFF5985D6FF588AD8FF2F5A
      A5FF7F89BFFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000FF000000FF000000FF000000FF0000008400
      0000840000000000000084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000000000BB3D0EFFD24C27FFDD52
      33FFEF5D46FFFC6453FFFD6957FFFD715CFFFD745EFFEF6A4EFFD38B57FFCD5B
      30FFFD6755FFF96350FFE6573CFFB84117FF5F4528FF305C30FF256625FF1C6C
      1CFF1D791DFF229122FF1F8F1FFF1F8F1FFF1D8E1DFF168A16FF127212FF1863
      18FF385738FF7E7E7EFFCCCCCCFFF9F9F9FF0000000000000000000000000000
      000000000000000000000000000000000000C1491EFFCF5931FFF0644DFFFA68
      55FFFB735DFFFC7961FFFC7F66FFFB8369FFCD572FFFFAD9ADFFCF876CFFFB6D
      58FFFB6D58FFFA6855FFE36345FF9C4F25FF949494FFD0D0D0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFEFFF6F6FEFFB5BC
      F1FF3554A5FF1C3995FF1E3A96FF1A3294FF162890FF14298EFF1C3695FF1A2B
      7DFF6D6DB2FFF4F4FEFFF9F9FEFFFEFEFEFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000840000008400000084000000FF000000FF000000FF000000FF00
      0000840000000000000084848400848484008484840084848400848484000000
      00000000000000000000000000000000000000000000C34317FFDB5130FFEF5D
      46FFFD6655FFFD725CFFFD7760FFFD7D64FFFD8368FFC85A2CFFFAE2AFFFD386
      53FFF36D53FFFD6B58FFFC6453FFEC5B42FF9A5819FF40B340FF4FC14FFF2F92
      2CFF248E24FF52C252FF52C252FF4ABE4AFF40B940FF3BB73BFF2DAF2DFF21A9
      21FF0A850AFF596659FFBCBCBCFFF5F5F5FF0000000000000000000000000000
      000000000000000000000000000000000000CD552DFFE36345FFFA6855FFFB73
      5DFFFC7962FFFB846AFFF8876AFFD7633EFFEFC9A0FFF8DBB2FFEFC9A0FFE363
      45FFFC7961FFFB6B57FFF76652FFA44E23FF949494FFD0D0D0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFEFFF3F3FDFFE4E4FDFF878A
      D9FF111A63FF172481FF192992FF162798FF15299BFF142597FF122087FF111A
      6BFF5A5DB7FFDCDCFBFFF3F3FDFFFCFCFEFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FFFF000000000000FF000000FF000000FF000000FF000000FF00
      0000FF00000084000000840000008400000084000000FF000000FF0000000000
      0000000000008484840084848400848484008484840000000000000000000000
      00000000000000000000000000000000000000000000C05329FFE8583FFFFC64
      53FFFD725CFFFD7961FFFD856AFFFD8C6EFFD7633AFFEBB784FFFFE3B0FFF0C4
      91FFE06642FFFD7760FFFD6A57FFF96350FFA76226FF56C456FF59C359FF70A9
      5FFF80B36DFF4DB34DFF64CB64FF5CC75CFF53C353FF45BC45FF3CB73CFF2DAF
      2DFF1A991AFF506950FFC2C2C2FFF8F8F8FF0000000000000000000000000000
      000000000000000000000000000000000000D8886BFFE36345FFFB6D58FFFC79
      61FFFB846AFFF8876AFFEA886BFFD8886BFFFCD8A8FFFCD8A8FFFCD8A8FFD05C
      35FFFB8369FFFC755FFFFA6855FF949494FFD0D0D0FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFEFFF7F7FEFFEFEFFDFFACACEEFF242B
      83FF18258AFF1C30A4FF1B34B1FF1832B4FF1731B5FF1730B2FF162BA7FF1322
      8FFF121B77FF8E8FE3FFE8E8FDFFF6F6FEFFFDFDFEFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FF00000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000008400000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4977DFFE5573BFFFD6B
      58FFFD7760FFFD866AFFFE9272FFEB8059FFD88754FFFFD9A6FFFFD9A6FFFFDA
      A7FFD25A31FFFD8368FFFD755EFFFD6655FFB0672FFF67CD67FF44A844FFBFD9
      ACFFFFFFE5FF479842FF74D374FF6ACE6AFF62CA62FF56C456FF45BC45FF39B6
      39FF1A921AFF6B7E6BFFD7D7D7FFFDFDFDFF0000000000000000000000000000
      00000000000000000000000000000000000000000000D4613BFFFB6F5AFFFC7F
      66FFF8876AFFF8876AFFCF5931FFFACE9EFFFBCF9EFFFBCF9EFFFBCF9EFFDB64
      41FFF8876AFFFC7D64FFF2654FFFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FAFAFEFFF2F2FDFFCDCDF9FF4146A8FF1A24
      88FF1C2FA6FF1E38B6FF1B3ABEFF1737C2FF1737C3FF1736BFFF1730B7FF1529
      A5FF131F85FF242B8AFFB6B7F4FFEFEFFDFFF8F8FEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000008400000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7603AFFF86F
      57FFFD7D64FFFD8B6EFFF9926FFFC96230FFFFCE9BFFFFCF9CFFFFCF9CFFFFD0
      9DFFD77647FFFD896CFFFD7B63FFF3664EFF917930FF76D476FF3E9A3DFFFFFF
      F2FFFFFFF2FFCFE2C5FF389838FF7BD77BFF6ED06EFF62CA62FF51C151FF3EB9
      3EFF1B7A1BFFB0B0B0FFEEEEEEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DB6441FFFC77
      60FFF8876AFFCD572FFFEA886BFFBF8876FFBF8876FFEFC9A0FFFACE9EFFDB64
      41FFF8876AFFFC7B63FFD0D0D0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFEFFF5F5FDFFE7E7FDFF8081DBFF181F82FF1C2A
      A0FF193BB7FF1A43C4FF1B3BC6FF173ACAFF173ACBFF1638C7FF1734BFFF152D
      B1FF15249CFF141C77FF5B5EBDFFDADAFCFFF2F2FDFFFCFCFEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000008400000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F1EEFFC965
      3FFFEF7656FFF98C6BFFCD5B2EFFE99A7AFFBF8A83FFBF8C84FFEEAD8AFFFFBF
      91FFD77143FFFD8E70FFF87B5FFFBA4C1AFF7ACA6FFF81D981FF64AB63FFFFFF
      FCFFFFFFFFFFFFFFFFFF80B380FF67C067FF7AD67AFF69CD69FF5BC65BFF2E9D
      2EFF6A8A6AFFDDDDDDFFFBFBFBFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0D0D0FF949494FFDB64
      41FFB6481EFF4D474BFF0D1C69FF0A1E74FF0B1D70FF0D1C69FF6C6970FFD35D
      37FFD35D37FFD0D0D0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFEFFF1F1FDFFBCBCF5FF2D3299FF1B2496FF1A33
      AEFF1744C1FF1A45C9FF1A3DCCFF173DD1FF173ED3FF163CCFFF1737C6FF0F29
      B6FF0F21A3FF18248FFF161C71FF9C9CE6FFEDEDFDFFF7F7FDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFDFFEFEFEFFFCCC4
      C1FFA96648FFB4451EFF4C214FFF01046AFF040D73FF030B71FF110C69FF7F4C
      6EFFD26034FFD25E33FF85601AFF6DC462FF7AD67AFF8CDF8CFF70A669FFFFF6
      EDFFFFF3E7FFFFF2E5FFFFEFDFFF59974CFF71CB71FF70D170FF50B850FF3F80
      3FFFD7D7D7FFF8F8F8FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D0FF949494FF4D474BFF191A
      1CFF020307FF020307FF0C2681FF103394FF103394FF103394FF0B237CFF1D24
      4EFF949494FFD0D0D0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F6F6FDFFE7E7FDFF8282DCFF1B1F89FF1B29A1FF163B
      B6FF1644C5FF1C41CAFF1A3FD2FF1640D8FF1640DAFF163ED6FF0E32C9FF5569
      D1FF3A4AB8FF0E1B94FF192078FF5F60BDFFDEDEFCFFF4F4FDFFFDFDFEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFEFFEFEFEFFFB3B3B3FF4A4A
      4AFF181818FF020202FF010215FF0C257EFF102F95FF102F95FF0F2D93FF0616
      7BFF331A4AFF645C59FF668C66FF379B37FF75D075FF92E192FF80A360FFDFD1
      BCFF709EAFFF458BAFFF6196ACFF9FB0A4FF489037FF43A443FF457E45FFD6D6
      D6FFF9F9F9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0D0D0FF949494FF151618FF08080BFF0D0D
      10FF08080BFF0E1C67FF123899FF143EA0FF143EA0FF143EA0FF143EA0FF0B20
      78FF192356FF949494FFD0D0D0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFEFFF5F5FEFFDBDBFCFF5F63C8FF1B208FFF192BA5FF153F
      BAFF1842C4FF1C40CDFF1943D8FF1643DFFF1644E1FF1440DCFF062ECCFFA3B0
      EAFFF1F1F9FF2230A2FF121D81FF2F318BFFC4C4F8FFF3F3FDFFFCFCFEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F9FFAAAAAAFF121212FF0808
      08FF0B0B0BFF05070EFF0C2464FF133898FF143CA2FF143CA2FF143CA2FF143A
      A0FF051A7AFF2E3356FF838383FFACBFACFF64A164FF449B44FF307B59FF0D73
      B3FF1B81CFFF1D83D2FF1C82CFFF1076B9FF026876FF36553FFF868686FFD2D2
      D2FFF9F9F9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949494FF191A1CFF0D0D10FF111114FF0D0D
      10FF0C1D6DFF184AADFF184AADFF194DB1FF194DB1FF194DB1FF184AADFF1440
      A2FF0C1D6DFF6C6970FFD0D0D0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFEFFF5F5FEFFD1D1FAFF5055BCFF1A2192FF192EA8FF0C35
      B8FF0E31BFFF1940D0FF1844DCFF1544E4FF1546E7FF1543E0FF1139D3FF3752
      CEFF6878CFFF2432A6FF101982FF1F2179FFB4B4F2FFF2F2FDFFFCFCFEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDFFF171717FF0D0D0DFF1313
      13FF0E0E0EFF0E2B6AFF1846ACFF1949AFFF1A4DB3FF1A4DB3FF1A4DB3FF1949
      AFFF143FA4FF081D6BFF6A6A6AFFBFBFBFFFF2F2F2FF91B0C0FF187EC9FF2C92
      F0FF2D93F2FF2D93F2FF2D93F2FF2B91EFFF1F85D7FF125F88FF5F5F5FFFA4A4
      A4FFE7E7E7FFFEFEFEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000918F8EFF111114FF151618FF191A1CFF0D0D
      10FF1C54B8FF1E59BCFF1E59BCFF205FC1FF205FC1FF205FC1FF1E59BCFF1E59
      BCFF0D2A87FF50545DFF949494FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFEFFF5F4FDFFD2D2FAFF555BC3FF1A2294FF1425A6FF5165
      C7FF6D81D9FF1E45D3FF1543DEFF1547E9FF1548ECFF1544E4FF153FD7FF0E30
      C5FF0721B0FF1122A1FF121A82FF232583FFB8B8F3FFF2F2FDFFFCFCFEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FFFF
      0000FFFF0000FF00000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008D8D8DFF111111FF171717FF1A1A
      1AFF0C0C0CFF1B51B7FF1C55BBFF1E59BFFF1F5CC2FF1F5EC4FF1E5AC0FF1D57
      BDFF1C55BBFF052983FF4D5263FFADADADFFE0E0E0FF237CB6FF3399FFFF359B
      FFFF359BFFFF359BFFFF359BFFFF349AFFFF3399FFFF258BE4FF23556FFF7979
      79FFCBCBCBFFF9F9F9FF00000000000000000000000000000000000000000000
      00000000000000000000000000004D474BFF191A1CFF202022FF242526FF191A
      1CFF2162C7FF2265CCFF2368CFFF256DD3FF256DD3FF256DD3FF2265CCFF2265
      CCFF1440A2FF4D4D57FF949494FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFEFFF5F5FEFFDADAFCFF6A6FD2FF172094FF1929A8FFD8DB
      F2FFFFFFFFFF5775E0FF0A3BDDFF1448EBFF144AEEFF1445E5FF143ED8FF1436
      C7FF142CB5FF1223A0FF151E84FF383B9DFFC4C4F8FFF3F2FDFFFCFCFEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FFFF0000FFFF0000FF00
      0000FF000000FF000000FF000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000464646FF191919FF1F1F1FFF2323
      23FF0E192CFF2060C6FF2265CBFF2368CEFF246AD0FF246AD0FF246AD0FF2266
      CCFF2163C9FF10429EFF374564FFA3A3A3FF8FAFBEFF288DDFFF3BA1FFFF3CA1
      FFFF3CA1FFFF3CA1FFFF3CA1FFFF3CA1FFFF3AA0FFFF379DFFFF1676BAFF5A60
      63FFAEAEAEFFEFEFEFFF00000000000000000000000000000000000000000000
      00000000000000000000000000004D4646FF222324FF28282AFF2A292DFF1516
      18FF256DD3FF2876DBFF2978DEFF2A7BE0FF2A7BE0FF2A7BE0FF2978DEFF2671
      D7FF194DB1FF4D4D57FF949494FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F6F6FEFFE3E3FCFF7E82E0FF1D2898FF1222A6FFC8CD
      ECFFFFFFFFFF7C93E7FF0737DCFF1547E9FF1448ECFF1444E4FF133CD7FF1334
      C7FF122BB4FF11219FFF1A2285FF585AC1FFD5D5FBFFF4F4FDFFFEFEFEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FFFF0000FFFF0000FF000000840000008400
      00008400000084000000FF000000FF0000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF212121FF272727FF2C2C
      2CFF171717FF246BD1FF2774DAFF2877DDFF297AE0FF297BE1FF2979DFFF2877
      DDFF2671D7FF1653B0FF2C436AFFA0A0A0FF6396AFFF3EA3FFFF42A7FFFF44A9
      FFFF44AAFFFF44AAFFFF44AAFFFF43A8FFFF40A6FFFF3DA2FFFF2D92E6FF345A
      6EFF979797FFE3E3E3FF00000000000000000000000000000000000000000000
      00000000000000000000000000004F4A51FF29292BFF2A2930FF292834FF2425
      26FF205FC1FF2D82E8FF308CF2FF328FF3FF328FF3FF328FF3FF308CF2FF2B7E
      E4FF205FC1FF4D4D57FF949494FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8F8FEFFEDECFDFF989CECFF2C39A1FF0616A1FF848F
      D7FFFFFFFFFF98AAECFF0735DAFF1443E5FF1344E8FF1341E2FF133AD5FF1331
      C5FF112AB2FF0F1F9CFF1C2487FF7475D5FFE4E3FCFFF5F5FEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FF000000FF00000000000000000000000000
      000000000000840000008400000084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4DFF292929FF2F2F2FFF3636
      36FF242424FF2162B5FF2C83E9FF2F8DF3FF3193F9FF3295FBFF3092F8FF2E8B
      F1FF2A7DE3FF1C63C0FF2D476DFFA6A6A6FF3E8BB8FF44AAFFFF47ADFFFF4AB0
      FFFF4BB1FFFF4BB1FFFF4BB1FFFF49AFFFFF46ACFFFF44A9FFFF40A5FFFF1F5F
      81FF858585FFDADADAFF00000000000000000000000000000000000000000000
      00000000000000000000000000006B737CFF29292BFF292834FF4D4646FF4D46
      46FF15215AFF308CF2FF328FF3FF3590F2FF3590F2FF3590F2FF3590F2FF328F
      F3FF1E59BCFF4F525BFF949494FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFEFFF2F2FDFFBBBDF7FF4C5BB8FF09179FFF4456
      C1FFFFFFFFFFC1CBF3FF0F3AD7FF123EE0FF1340E2FF133EDDFF1337D1FF1230
      C1FF1128ADFF101E97FF1A2288FF999AE9FFEDEDFDFFF8F8FEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000084000000840000008400
      000084000000000000000000000084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7BFF2A2A2AFF383838FF3E3E
      3EFF3F3F3FFF14355CFF2F8DF6FF3090F9FF359BFFFF3AA0FFFF369CFFFF3399
      FFFF3296FCFF1763BAFF324F73FFB9B9B9FF4692C0FF4CB2FFFF4DB3FFFF50B6
      FFFF51B7FFFF51B7FFFF50B6FFFF4EB4FFFF4DB3FFFF49AFFFFF45ABFFFF216E
      9DFF777777FFD4D4D4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E1E20FF4D4646FF4D4646FF4F49
      4EFF2A292DFF15215AFF1440A2FF1E59BCFF256DD3FF2D82E8FF3590F2FF328F
      F3FF1544A5FF6B737CFF949494FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFEFFF4F4FDFFDADAFCFF727ED9FF14239FFF2438
      B5FFE5E8F7FFE9EDFBFF1F45D7FF0F3ADAFF123DDCFF123BD8FF1236CDFF112E
      BCFF1025A8FF101F90FF363DA8FFC8C8F9FFF2F2FDFFFCFCFEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDEFF1C1C1CFF3F3F3FFF4545
      45FF4C4C4CFF2C2C2CFF0B2259FF16419EFF1D56D2FF2368DDFF2E80EAFF3694
      F7FF3190F9FF1258A2FF5B6C7DFFD1D1D1FF4B97C4FF50B6FFFF55BBFFFF56BC
      FFFF57BDFFFF57BDFFFF56BCFFFF55BBFFFF52B8FFFF4EB4FFFF4BB1FFFF197E
      BAFF797979FFD4D4D4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4646FF4D4646FF4D474BFF4D47
      4BFF5A5E66FF656669FF4F494EFF202022FF101D63FF0E2E8DFF123899FF0D1C
      69FF151618FFA0A0A0FFD0D0D0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFEFFF7F7FDFFEBEBFCFF9CA2F0FF364AAEFF0C20
      ABFFC1C8ECFFFBFDFFFF2E50D5FF0C34D3FF1239D6FF1238D1FF1233C7FF102C
      B6FF0F22A2FF17258CFF7275D7FFE3E3FCFFF4F4FDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000404040FF404040FF4B4B
      4BFF494949FF5D5D5DFF666666FF4D4D4DFF1F2029FF07155BFF0D268DFF1132
      9EFF0E2B69FF08111CFF9E9E9EFFE6E6E6FF5A99B9FF56BCFFFF53B9F9FF3DA2
      DFFF399FD9FF4DB3F2FF55BBFFFF56BCFFFF53B9FFFF51B7FFFF43A8EDFF1570
      A0FF8B8B8BFFDDDDDDFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002A292DFF4F525BFF5457
      5EFF656669FF958886FF9C9C9CFFA5A5A5FF6D6F77FF4D4646FF2A2930FF2929
      2BFF4D4646FFD0D0D0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFEFFF2F2FDFFC1C2F9FF657ACDFF0317
      A3FF8590D8FFFFFFFFFF3E5BD4FF072ECCFF1237CFFF1134CBFF112FC0FF1029
      B0FF0E209AFF1A2690FFA5A5EFFFEFEFFDFFF9F9FEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000FF000000FF000000FF0000008400
      0000FF0000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDEFF2A2A2AFF5151
      51FF575757FF666666FF848484FF9B9B9BFFA5A5A5FF717171FF464646FF2E2E
      2EFF2A2A2AFF3A3F43FFCCCCCCFFF8F8F8FF9BC1D4FF1C82B9FF1073A6FF2D8A
      BCFF3F98CAFF308ABAFF2183C1FF1D83CCFF2086D2FF2587CBFF247FAFFF1763
      89FFA8A8A8FFECECECFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000222324FF5F61
      67FF6D6F77FF958886FF918F8EFFA2A2A2FFA5A5A5FF6B737CFF4D474BFF191A
      1CFFD0D0D0FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFEFFF6F6FEFFE4E4FCFF8D97EBFF2037
      AAFF3849BDFFEFF1FAFF536AD5FF0427C5FF1232C8FF1130C4FF102BB9FF0F24
      A8FF112090FF5258C3FFD6D6FBFFF3F3FDFFFDFDFEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009D9D9DFF2121
      21FF616161FF737373FF848484FF8F8F8FFFA2A2A2FFA5A5A5FF7E7E7EFF4949
      49FF1A1A1AFFB6B6B6FFEFEFEFFFFEFEFEFFEEF4F7FF1170A0FF3792C4FF479F
      D0FF56A9D8FF75B9E0FF97CAE8FF9DCCE8FF64A5C7FF4C97BCFF1876A6FF4874
      8BFFCECECEFFF8F8F8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002929
      2BFF656669FF908E8DFF939291FF958886FF6D6C74FF4D474BFF2A2930FFD0D0
      D0FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFEFFF0F0FDFFB3B6F7FF5C76
      C7FF1D2FAFFFE2E4F5FF7687DBFF0221BDFF102DC0FF102BBCFF0F28B1FF0D20
      9FFF1B2891FF9193E8FFEBEBFDFFF6F6FDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BDFF282828FF636363FF8E8E8EFF939393FF838383FF6D6D6DFF474747FF2F2F
      2FFFADADADFFF2F2F2FFFDFDFDFF00000000000000007CAFC8FF2E8BBDFF61AF
      DBFF7ABBE1FF84C0E4FF9FCEEAFF9ECCE6FF64ACD3FF3992C2FF1471A1FFB0B6
      B9FFEFEFEFFFFEFEFEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000908D8CFF4F494EFF5A5E66FF565961FF565961FF92908FFFD0D0D0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFEFFF5F5FDFFDEDDFCFF8994
      E9FF2037ADFFBCC0E8FF919DDFFF031EB5FF1028B9FF0F28B4FF0E23A9FF1121
      95FF474FBBFFCDCDFAFFF3F3FDFFFCFCFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FF000000FF00000000000000FF000000FF00
      0000FF0000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEEEEEFF8B8B8BFF4B4B4BFF5B5B5BFF575757FF5A5A5AFF8E8E8EFFEFEF
      EFFFFBFBFBFF00000000000000000000000000000000000000005D9CBCFF4B9B
      C6FF94C8E7FFA3D0EAFF94C8E7FF7EBDE2FF57A8D6FF237EAEFFA1B4BDFFEDED
      EDFFFDFDFDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9FEFFEEEEFDFFBBBC
      F8FF475BC1FF4553BBFF6776CFFF0A21B1FF0E24B1FF0F22ADFF0D1F9FFF1724
      95FF9F9FEEFFE8E8FCFFF7F7FEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007CAF
      C8FF4992B7FF5CA1C4FF4F9AC1FF3D8EB8FF5795B4FFC7D3DAFFF5F5F5FFFEFE
      FEFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFEFFF5F5FDFFE3E3
      FCFF868EE8FF1E30A8FF1123ABFF1125AEFF0F21AAFF0E1EA4FF0F1E94FF5359
      C4FFD5D5FAFFF2F2FDFFFCFCFEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008400000084000000FF000000FF0000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFEFFF4F4
      FEFFCDCEFAFF4856C1FF1120A1FF0F21A7FF0F1EA4FF0D1C99FF1E289CFFAEAF
      F2FFEFEFFDFFF6F6FEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FEFFF5F5FEFFB8BAF3FF2735A5FF0E1C9EFF0E1B9CFF0D198CFF8386DCFFF0F0
      FDFFF6F6FDFFFDFDFEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFEFFFEFE
      FEFF0000000000000000C9CAF3FF5C62BBFF4A50AEFFA7A9E5FFF5F5FEFFFDFD
      FEFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000A00000000100010000000000000A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFC3C3FFFF1FFFFFFFFF
      FFFFFFFFFFFFFC018033F00FFFFFFFFFFFFFFFFFFFFFF00380008007FFFFFFFF
      FFFFFFFFFFFFC00180000007FFFFFFFFFFFC7FFFFFFF000180000003FFFFFFFF
      FFF81FFFFFFC006080000003FFFF01FFFFE007FFFFE0700080000001FFF0007F
      FFC001FFFF83000080000000FF80007FFF00007FE008000080000000FE00007F
      FE00003F8040000080000000FC00007FFE00003F8000000080000000F000003F
      FE00003FF000000080000000E000003FFE00003FF0000000800000008000003F
      FC00003FE0000001800000000000001FF000000FE00000038000000100000003
      C0000003E0000003800000010000000380000001C00000070000000700000001
      800000018000001F0000000F00000001800000018000000F0000003F80000000
      80000001000000070000003F8000000080000001000000070000003F80000000
      80000001000000070000003F8000000080000001C00000030000003FC0000000
      C0000003800000038000007FC0000000E0040007C0400007800700FFE0000004
      F01E701FC0E0000FC00FFFFFF8000000F83FFC3FFFF0000FF01FFFFFFFFC8007
      FEFFFE7FFFFF804FFFFFFFFFFFFFFFFFFFFFFFFFFFFF807FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0007FFE0001FFFFFFFFFFFFFFFFFF
      FFE0001FFC00007FFFC003FFFFC003FFFFE00007F800001FFE00007FFE00007F
      FFE00003F800000FF800003FFC00001FFFE00001F800000FF800001FF800001F
      FFE00001F0000007F800001FF800001FFFC00001F3000007F800001FF800001F
      FFC00001FF80000FF800001FF800001FFF800001FF00000FF800001FF800001F
      FF800001FF00000FFC00001FF800003FFF000001FE000007FC00003FFC00003F
      FF000001FC000007FE00003FFC00007FFE000001F8000007FE00007FFC00007F
      FC000001F000001FFF00007FFE0000FFF8000001F000001FFF8000FFFF0001FF
      F8000003C000001FFFE001FFFF8003FFE0000003C000003FFFE007FFFFC00FFF
      E0000003C000003FFFE007FFFFC00FFF80000003C000003FFFE003FFFF800FFF
      80000007E000003FFFC003FFFF8007FF80000007F000007FFFC003FFFF8007FF
      80000007F800007FFF8003FFFE0003FF80000007FC00003FFF8003FFFE0003FF
      C0000007F800003FFF0001FFFF0003FFC000000FF80000FFFF0001FFFF0003FF
      E000000FF80000FFFF0001FFFF8003FFF000000FF80001FFFF8003FFFF8007FF
      FC000007FC0003FFFF8003FFFF8007FFFF000007FC0003FFFF8003FFFFC00FFF
      FF80001FFF0003FFFFC007FFFFE01FFFFFE0003FFF8007FFFFE00FFFFFF03FFF
      FFFC007FFFE3FFFFFFFFFFFFFFFFFFFFFF0000FFF07FFFFFFFF81FFFFFFC3FFF
      FFF00FFFC03FFE1FFE601FFFFFC003FFFFE007FFC03FFC07FC001FFFFF0000FF
      FFE007FF801FF803F8000CFFFE00007FFFE007FF800FF001F000007FF800003F
      FFE007FF8007E001E000003FF800001FFFA007FF8003C001C000001FF000000F
      FF8000FF8001C0018000000FE0000007FF0000FFE000800180000007C0000003
      FE00007FF0000001C0000007C0000003FE00007FF80000078000001FC0000003
      FC00003FFC00000F003C000F80000001FC00003FFF00001F001F000780000001
      FC00001FFF80007F001F800180000001F800001FFE4000FF001FC00080000001
      F800001FF00001FF000FE00080000001F800001FE00003FF0007F00080000001
      F800001FC00003FF0003F00080000001FC00001F800001FF0001F00080000001
      FC00003F000000FFE000F80080000001FC00003F00004077F0001801C0000003
      FC00003F01006003F0000003C0000003FC00007F03007003E0000003C0000003
      FE00007F07807801E0000001E0000007FE00007F0FC07C01F0000001F000000F
      FF0000FF1F807C00F8000003F000000FFF0000FFBF00FC00FC000007F800001F
      FF8001FFFE00FC00FE00000FFC00003FFF8001FFFC01FC00FF30001FFE00007F
      FFC003FFF803FF83FFF8003FFF8001FFFFE003FFF80FFFE3FFF8027FFFE007FF
      FFCC0FFFFFFFFFFFFFF807FFFFFFFFFFFFFE03FFFFFFFFFFFFFFFFFFFF0000FF
      FFF801FFFFFFFFFFFFFFFFFFFFF00FFFFFE000FFFFFFFFFFFF8007FFFFE007FF
      FF80007FC001FFFFFF0001FFFFE007FFFE00003F80003FFFFF0000FFFFE007FF
      F800001F80000001FF00007FFFE007FFE000000F80000000FF00003FFFA007FF
      C000000780000000FF00003FFF8000FFC000001F80000000FF00003FFF0000FF
      C000007F80000000FF00007FFE00007FC00001FF80000000FF8000FFFE00007F
      E00007FFC0000001FFC001FFFC00003FF0001FFFC0000001FF8003FFFC00003F
      F8003FFF80000003FF0003FFFC00001FFC003FFF00000007FE0001FFF800001F
      FC003FFF00000007FE0001FFF800001FFC003FFF00000003FE0000FFF800001F
      FC003FFF00000003FE0000FFF800001FF8003FFF00000003FE0000FFFC00001F
      F0003FFF00000003FE0000FFFC00003FF0003FFF00000003FE0000FFFC00003F
      F0003FFF00000003FF0001FFFC00003FF8007FFF00000003FF0001FFFC00007F
      FC00FFFF80000003FF8003FFFE00007FF8007FFF80000003FFC007FFFE00007F
      F8007FFFC0000003FFE00FFFFF0000FFF8007FFFE0018003FFF01FFFFF0000FF
      F8407FFFF007C007FFFFFFFFFF8001FFFC00FFFFFFFFE00FFFFFFFFFFF8001FF
      FC00FFFFFFFFFFFFFFFFFFFFFFC003FFFE01FFFFFFFFFFFFFFFFFFFFFFE003FF
      FF87FFFFFFFFFFFFFFFFFFFFFFCC0FFF00000000000000000000000000000000
      000000000000}
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 296
    Top = 96
  end
  object ShortcutBarPanelPopupMenu: TPopupMenu
    Left = 152
    Top = 176
    object LargeIcons1: TMenuItem
      Caption = 'Lar&ge Icons'
      ImageIndex = 15
      RadioItem = True
    end
    object SmallIcons1: TMenuItem
      Caption = 'S&mall Icons'
      ImageIndex = 17
      RadioItem = True
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object AddGroup1: TMenuItem
      Caption = '&Add Group'
      Visible = False
    end
    object RemoveGroup1: TMenuItem
      Caption = 'R&emove Group'
      Visible = False
    end
    object RenameGroup1: TMenuItem
      Caption = '&Rename Group'
      Visible = False
    end
    object N2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object OutlookBarShortcut1: TMenuItem
      Caption = 'Outlook &Bar Shortcut ...'
      OnClick = OutlookBarShortcut1Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object HideShortcutBar1: TMenuItem
      Caption = '&Hide Outlook Bar'
    end
  end
  object SmallImageList: TImageList
    Left = 136
    Top = 224
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7A2
      88FFA03703FFB96431FFCA7B48FFCC804DFFC57441FFB75E2BFFA44310FFA548
      18FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CBCBCB00DADADA00F9F9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBBBBB00D8D8D800F6F6F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A34823FFE4A4
      71FFDE9D6AFFD99360FFD68E5BFFD08653FFCA7C49FFC2713EFFAE521FFFB45A
      27FFA94B17FF00000000000000000000000000000000E7E7E700D1D1D100C2C2
      C200C1C1C100A1A1A10080808000D4D4D400CCCCCC00D1D1D100D1D1D100D4D4
      D400CBCBCB00000000000000000000000000CFCFCF00C6C6C600C4C4C400D2D2
      D200D1D1D100BFBFBF0071717100D4D4D400E3E3E300E6E6E600E0E0E000DEDE
      DE00B8B8B8000000000000000000000000000000000000000000000000000000
      00000000000000000000CFCFCFFF9C9C9CFF8D8D8DFF8B8B8BFF828282FFA0A0
      A0FF00000000000000000000000000000000000000000000000095310BFFE2A1
      6EFFE4A673FFE4A370FFDE9B68FFD89360FFD08653FFC77946FFBF6C39FFB55D
      2AFFAA4D19FF000000000000000000000000ECECEC00E1E1E100DFDFDF00DDDD
      DD00DBDCDB00D9DAD900EBEBEB0069696900A8A8A800D7DAD200D2D8CC00C6C6
      C600C5C5C500000000000000000000000000E0E0E000DDDDDD00DBDBDA00D9D9
      D800D7D6D500D0D0CE00D6D6D6006D6D6D00888989008E94C3006C6FBA00CFCE
      CD00B5B5B500000000000000000000000000000000000000000000000000F7F7
      F7FF848484FF8A8A8AFF3E47C0FF101DFCFF040CB3FF03087FFF13186AFF1A1A
      17FF000000000000000000000000000000000000000000000000AD5B3EFFECB0
      7DFFEDB17EFFECB07DFFE6A774FFDE9B68FFD58D5AFFCC7F4CFFC2703DFFB862
      2FFFA2410EFF0000000000000000000000009D9D9D00BEBEBE00FBF7FF00F8F3
      FF00EFE3FE00E0CBFC00A4A1A700E8E8E800666666008E3BC8007605EF00C9CD
      C400CACACA000000000000000000000000008E8E8E00BCBDC000EBF1F900E3EB
      F800CCDAF200ADC0EA009297A600F2F2F2006E6F6F0039418700040AAF00C9C9
      C300BCBCBC000000000000000000000000000000000000000000868686FF9090
      90FF2E3AFBFF0408AEFF060204FF000350FF020354FF010352FF00005FFF1817
      00FFC0C0BEFF000000000000000000000000000000000000000000000000FBC5
      92FFF8C18EFFF6BE8BFFECB07DFFE2A16EFFD8925FFFCE824FFFC47340FFBC67
      34FFBC633DFF00000000000000000000000000000000D0D0D000F0E5FF00ECE0
      FD00E5D3FC00D9BDFA00C9A1F900A09CA800C7BDBE00884C3000770DDB00BDC3
      B800D3D3D30000000000000000000000000000000000CCCBCB00CCDBF400C7D6
      F100B5C7EC009BB0E5007A94DC007E829A00ACA3A3004B4B4B00262A9600C0C0
      B900C1C1C100000000000000000000000000FAFAFAFF858585FF2A35CCFF1417
      A8FF060400FF00049FFF030465FF030B88FF040C87FF050C8EFF020877FF1413
      32FF29261FFF000000000000000000000000000000000000000000000000A440
      0CFFFCC794FFF9C390FFF6C08DFFEDB17EFFDE9B68FFCF8451FFC57643FFA84A
      17FF0000000000000000000000000000000000000000AAAAAA00BEB2CD00DEC6
      FB00D8BBF800CCA7F800BE8DF700AC6BF600B5778200DBC4C300874C2E00ACA3
      B100D0D0D00000000000000000000000000000000000C0C0C000A0AECF00A6BA
      E80097ADE4008199DE00667FD3004A60CB004E547C00ACACAC0049494900A8A8
      A700C9C9C900000000000000000000000000787878FF0818FFFF0B0700FF030A
      A9FF0A0C2CFF03086DFF0004C3FF0004E4FF0003FFFF0D13F4FF232CC4FF0004
      FFFF4B4610FF6469A3FFE9E9E9FF000000000000000000000000000000000000
      0000B05722FF962000FF9E8E8EFF9B98A0FFBB5010FFA74613FFA2420EFF0000
      0000000000000000000000000000000000000000000000000000B3B5B100CAA2
      F800C399F700BC8AF700AF72F6009F54F4008B30F100AD688600DCC7C6008649
      2D00CDCECE0000000000000000000000000000000000F1F1F100ABABAA00A5B7
      E700708BD900617AD3004E65CD003449C4001B2AB9003B3D7D00ACACAC004545
      4500CBCBCB00000000000000000000000000151ED1FF060C5BFF08083AFF060D
      B1FF161DBEFF000000FF4D63FFFF747000FF656433FF43462AFF4E5036FF0000
      BEFF4F4A32FF252A47FF33346BFF000000000000000000000000000000000000
      00000000000023A2FFFF5EB4FFFF62B7FFFF38A7FFFFA33000FF000000000000
      0000000000000000000000000000000000000000000000000000CACACA00F5F2
      FD00F8F3FE00F7F2FD00AC6CF5008D33F0007C11EE007401EF00A85F8D00DDC8
      C900884B2F000000000000000000000000000000000000000000C9C9C900EDF3
      FC00EAEFF900EDF2F9008795DB001928B9000910B000070CB00035378400ABAB
      AB0044444400E4E4E4000000000000000000474878FF111470FF0C14A2FF2723
      1DFF3B4FFFFF4E5FFFFF0000DEFF0000FFFF00023AFF1F230EFF363532FF0000
      F0FFE8F0FFFF24297CFF000018FFDADADAFF0000000000000000000000000000
      0000BDE3FFFF64B7FFFF6DBCFFFF72C0FFFF73BFFFFF34A1FFFF000000000000
      0000000000000000000000000000000000000000000000000000B1B1B100BAB4
      C000E2CEFB00E1CCFB00DFC9F900E1CFFA00A65FF4007200EE007100EF00AB64
      9600DFCACA008B4E32000000000000000000000000000000000093939300A5AF
      C300AABDE900A7BBE800A3B7E700A0B7E6008598DD00343EC0001F26B800747B
      9E00A9A9A90043434300F3F3F30000000000595A8EFF0006B4FF000EFFFF0000
      CDFFB8C5FFFF0709E5FF000BE2FF000DE2FF0009E2FF0000F4FF3132D0FF6C69
      C6FF060BDBFF2737FFFF565EB6FF353B9DFF0000000000000000000000000000
      00005ABCFFFF6CBDFFFF7AC6FFFF8ED6FFFF5E94EAFF86D6FFFF000000000000
      000000000000000000000000000000000000000000000000000000000000D6D8
      D400B57DF700B379F600AE71F400AF75F600B178F600B47CF600B781F600B789
      ED00C69F9600E0CBCB008E4E330000000000000000000000000000000000D4D3
      CF005068CE004C63CB004A61CA004D64CB005069CE00536BCF005770D0007386
      CD00ABAAAA00ABABAB00404040000000000000000000454000FF0002FFFF000E
      D5FF0B07CFFFFFFFFFFF3230D5FF4C48E5FF4949EBFF8286FFFF7880FEFF0206
      31FF000000FF6870C8FF353997FFB9BCE1FF0000000000000000000000008494
      FCFF092DEAFF000EE0FF000BD8FF001AD7FF255BFFFF0006B9FFA9E4FFFF0000
      000000000000000000000000000000000000000000000000000000000000A1A1
      A1007C24DB007D13F1008019F000821DF0008421F2008625F100882AF1008625
      F300E5E5E500857A7B00E4E3E400D8D8D800000000000000000000000000A9A9
      A900040CAA00030CAF00050EB0000711B1000A16B2000D19B400101CB6001A25
      B200E1E1E1006B626300F8F8F800CECECE0000000000C8C8CFFF8491FFFF6D6E
      F1FF484BD3FF3840D8FF1723DFFF060B6DFF1B1C31FF767843FF6C6A44FF0603
      00FF1C1C06FF7581FFFF00000000A9ABC5FF0000000000000000000000000000
      00000533F6FF3B6AFEFF4A7BFFFF396BFFFF204EF8FF071ECAFF7373D6FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAF900F9FAF800FAFBF800FAFBF800FAFBF900FAFBF900FBFCF900FBFC
      F900F5F5F5000000000000000000000000000000000000000000000000000000
      0000FBFBF900F9FAF800FAFBF800FAFBF800FAFBF900FAFBF900FBFBF900FBFB
      F900F4F4F4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8F8FCFFB4B5C4FFAFB6F3FFA9B0FEFF7D81
      CBFFD8D9E6FFE0E0E7FF00000000000000000000000000000000000000000000
      00001C37DFFF3E6EFFFF3D6DFFFF3466FFFF295EFFFF1B54FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002351FAFF4C7BFFFF3A69FFFF2D5FFFFF0714BEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D56EFFF142BDCFF7984E4FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C600E7008400420042212100A5A5A500848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8E8E800F6F6F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C600C60042002100C6000000FF000000840000004221210084A5A50084A5
      6300C621E70000000000000000000000000000000000000000000000000077B0
      77000163010035AE35004DCD4D0050D4500047CB47002EAE2E00138613002782
      2700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A6A6A6003030
      3000181616000D0C0A00E2E2E200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C600E7004200
      2100C6000000FF000000C6420000C6A500008400000084000000422121008484
      840084A56300C621E700000000000000000000000000000000002070200050D4
      50002C9F2C0061DC61005ED75E005AD55A0052D0520047C847003BBF3B000069
      000018A018000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5005B5B5B00A7A8A8001E1D
      1A00151515001A1817001F1C1B00000000000000000000000000000000000000
      00000000000000000000DADADA00ECECEC00FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000042002100C6000000FF00
      0000FF000000FF000000C6000000C6000000FF00000084000000420000008484
      A5008484840084A56300C621E700000000000000000000000000498A49005BD8
      5B0066DD66006EE16E0071E371006BE06B0060D9600052D0520043C6430036C0
      360025B725000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD009B9B9B009595950000000000000000000E0C0C009392
      9300FFFEFF000D0C0A00211D1C0071706F00F4F4F400E8E8E800DCDCDC00D5D5
      D500DADADA00BEBEBE008F8F8F00DBDBDB00D4D4D400D7D7D700DCDCDC00E3E3
      E300DDDDDD000000000000000000000000000000000084000000C6630000C600
      0000FF000000FF000000C600000084000000FF000000C60000004221210084A5
      84008463A500C621E70000000000000000000000000000000000A8C8A80069E5
      690071E371007EEC7E0081EF810079EB79006BE06B005BD65B004ACA4A0039BF
      39001FA51F0000000000000000000000000000000000F7F7F700E2E2E200A6A6
      A60078787800DFDFDF00D7D7D700675F5700442F1E004C423A00131213002121
      21004B4A4A005A5958004B4B480037353300E6E6E600E0E0E000DCDCDC00DBDB
      DB00D9D9D900D9D9D900E9E9E9006A6A6A00A1A1A100C6C5C400B6B4AA00CCCC
      CC00DBDBDB000000000000000000000000000000000042632100C64200004200
      0000FF000000FF000000C60000008400000042000000428463008484A500C621
      E700000000000000000000000000000000000000000000000000000000003FB0
      3F0077E9770089F3890095FB950084F0840071E471005FD85F004DCC4D003CC0
      3C00036D0300000000000000000000000000FEFEFE00DFDFDF004A4844001717
      18006C6A68006C5D50004A3829003E1C0500696B6600211A140000364400441A
      0000CDCDCD0038373500242221008B8A8800BFBFBF00BDBFBD00F4F6F500F0F2
      F000DFE2DE00C8CDC600A1A0A000EAEAEA006A6A6A004D5950004E3F0300C8C9
      CB00D9D9D9000000000000000000000000000000000000000000420021008400
      0000FF000000FF000000C6000000840000004200000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000076AF
      760083F7830086F3860095FF950088F588007AEE7A0064DE64004DCD4D003FC7
      3F0000000000000000000000000000000000000000000000000000000100838A
      8B00333332005E33150055331E0089949A001D191800352C260025292C004319
      0F001B1C1F00B2B0AF0059565500F6F6F60000000000CDCCCD00E0E4E000DCDF
      DB00CFD3CD00BCC0B800A5A89B0097979500B3B2BB00155DA70047431A00BEBF
      C100D7D7D7000000000000000000000000000000000000000000000000008400
      0000FF000000FF000000C6000000840000004200000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000067A567002891270029AC370048E3840032C87000007A00004BCD4B006AAC
      6A000000000000000000000000000000000000000000A2A1A000484643007171
      700013171B00716455009EAAAD007C7C7A007C7C7D0000000000779698004218
      000000000000552C0900252628000000000000000000CACACA00B4B9B300C4C9
      C200BABEB600AAADA10097988600828067004F84AE0093BEDD00125BA800A7AC
      B100DDDDDD000000000000000000000000000000000000000000000000004200
      0000FF000000C6630000C6630000840000004200000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006500003291FF0065B7FF005EB4FF00399CFF00000000000000
      0000000000000000000000000000000000000000000060605E0004030600635E
      5600746C6400755944004B545800605449003A1C07003E3025005A777E008862
      4400915E3A00D3B29B00000000000000000000000000F9F9F900ACACAC00B0B2
      A7009EA193009496830085826D00756F500061562B004B7A990096BFDD001059
      A500DBDCDC00000000000000000000000000000000000000000042002100C642
      0000C6A50000C6420000C6000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003C9FFF0073C1FF0073C0FF006BBCFF0063B7FF00A3D9FF000000
      000000000000000000000000000000000000737170006C6B65006D5A4A000D04
      05004E4F4E002F0A00006D5A4600260C000027120100184F8100290C00004B59
      58000E0401003B5D830000000000000000000000000000000000C9C9C900F4F5
      F600F1F3F100F4F5F400918E750062582E0053450D00503F03004A748C0099C1
      DE000F58A600FCFCFC000000000000000000000000000000000084630000C642
      0000420000004200000042000000420000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000074C1FF0081C9FF0084CBFF007AC5FF006BBBFF003DA3FF000000
      00000000000000000000000000000000000086868300595B5C00150500007C47
      200000000000605E590090857D0047322400401D02004E270A00352317000A00
      00007B726B003017080000000000000000000000000000000000C7C7C700B5B7
      B300C9CEC700C7CCC500C5C9C200C5CBC500928F7200594B13004C3B00006188
      A4009AC2DF001059A80000000000000000000000000000000000C600E7000000
      000084000000840000008400000000000000C600E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000089BD0072BEF70094D4FF0098D6FF0084CAFF0071BEFF00258CDE000000
      0000000000000000000000000000000000000000000040291900969AA600A6B0
      C0001C2C39006F4A30002E323300FFFFFF00C7C7C60069878B00190400005C5E
      62003D1B030077431C00FCFCFB0000000000000000000000000000000000D2D2
      D3008A8A74008787710084826B0085847000888772008A8A77008E8E7A009B9B
      8C0085AACB009DC3DF000D59AC00000000000000000000000000840084008400
      0000FF000000C6000000C6000000840000008400840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009FD20000BAED0079C4F5008DD1FF0080C8FF0070BFFF00006A9A000000
      00000000000000000000000000000000000000000000AC611F0043464B00211F
      20000000000062371400ECC6AC005A525F00000000004E6E720046281800985C
      2A008F4A1300A96C39000000000000000000000000000000000000000000C4C4
      C4004D400A005246100053471200564B1700574C1A005A4F20005C5023005C52
      2900E1E1E100A1AEB800EAE9E800EBEBEB00000000000000000042008400C600
      0000C6006300FF000000C6000000840000004200630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000095C90000C3F600007AAE0084CAFF007AC4FF005BB0F500017CB0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBA99900E8DDD500EEEEED00F1F0ED0000000000D9DC
      D2009899990084888C0000000000000000000000000000000000000000000000
      0000FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFE00FDFDFE00FDFDFE00FEFE
      FE00FAFAFA000000000000000000000000000000000000000000000000004200
      0000FF000000FF000000C6000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007CCBE80000CFFF0000C6F90000A4D7000094C60000B3E5008AC8E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D7CFC90024252500FFFFFF00B2B0
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C600
      E700420042004200000042004200C600E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000092CFE3003CA5CC0041A4CA002090BF00A0D0E500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFDFFFFFFE00F
      FC7FFC7FFFFFC00780070007FC0FC00700070007E00FC00700070007C007E007
      800780070007E00F800780070001F01FC00780070001F83FC007C0030000F03F
      C003C0010000F03FE001E0018000E01FE000E0008002F01FF007F007FE03F03F
      FFFFFFFFFFFFF83FFFFFFFFFFFFFFC7FFC1FFFFFFFF9FFFFF007E00FFFC1FFFF
      C003C007FF01FC7F8001C007F8C000078003C00780000007800FE00700000007
      C07FE00FC0008007E07FF00F80018007E07FF83F80038007C07FF81F0003C003
      C07FF81F0003C003C07FF01F8001E001C07FF01F8803E000C07FF01FFC03F007
      E0FFF01FFF0FFFFFE0FFF83FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 264
    Top = 96
  end
  object ShortcutBarButtonPopupMenu: TPopupMenu
    Left = 96
    Top = 96
    object Open1: TMenuItem
      Caption = '&Open'
    end
    object OpeninNewWindow1: TMenuItem
      Caption = 'Open in New &Window'
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object RemovefromOutlookBar1: TMenuItem
      Caption = '&Remove from Outlook Bar'
    end
    object RenameShortcut1: TMenuItem
      Caption = 'Rena&me Shortcut'
    end
  end
  object WinXP1: TWinXP
    Left = 328
    Top = 104
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.Dat'
    Filter = '*.Dat|*.Dat'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofCreatePrompt, ofEnableSizing]
    Title = 'Buka database dari ...'
    Left = 440
    Top = 80
  end
  object SaveDialog1: TSaveDialog
    Ctl3D = False
    DefaultExt = '*.Dat'
    Filter = '*.dat|*.Dat'
    Title = 'Backup database ke ...'
    Left = 472
    Top = 80
  end
end
