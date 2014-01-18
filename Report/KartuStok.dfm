object frmKartuStok: TfrmKartuStok
  Left = 4
  Top = 243
  Width = 696
  Height = 480
  Caption = '\'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 446
    Align = alClient
    Caption = 'MainPanel'
    TabOrder = 0
    object pnlFilter: TPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 100
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object d: TBevel
        Left = 7
        Top = 14
        Width = 146
        Height = 69
        Shape = bsFrame
        Style = bsRaised
      end
      object l: TLabel
        Left = 14
        Top = 58
        Width = 21
        Height = 13
        Caption = 'Until'
      end
      object Bevel1: TBevel
        Left = 160
        Top = 14
        Width = 177
        Height = 69
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 346
        Top = 13
        Width = 135
        Height = 83
        Shape = bsFrame
        Style = bsRaised
      end
      object Label15: TLabel
        Left = 166
        Top = 31
        Width = 25
        Height = 13
        Caption = 'Kode'
      end
      object Label14: TLabel
        Left = 166
        Top = 55
        Width = 28
        Height = 13
        Caption = 'Nama'
      end
      object btnReset: TButton
        Left = 575
        Top = 67
        Width = 75
        Height = 25
        Caption = '&Reset'
        TabOrder = 0
        OnClick = btnResetClick
      end
      object cmbOpr1: TComboBox
        Left = 14
        Top = 29
        Width = 48
        Height = 21
        BevelKind = bkFlat
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cmbOpr1Change
        Items.Strings = (
          '='
          '>='
          '<='
          'From')
      end
      object dtpDari1: TDateTimePicker
        Left = 65
        Top = 30
        Width = 85
        Height = 21
        BevelOuter = bvNone
        BevelKind = bkFlat
        CalAlignment = dtaLeft
        Date = 38611.9227067014
        Time = 38611.9227067014
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
      object dtpSampai1: TDateTimePicker
        Left = 65
        Top = 56
        Width = 85
        Height = 21
        BevelOuter = bvNone
        BevelKind = bkFlat
        CalAlignment = dtaLeft
        Date = 38611.9227327431
        Time = 38611.9227327431
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 3
      end
      object StaticText1: TStaticText
        Left = 12
        Top = 6
        Width = 134
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSingle
        Caption = 'Period'
        Color = 15658719
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
      end
      object btnOk: TButton
        Left = 496
        Top = 67
        Width = 75
        Height = 25
        Caption = 'Refres&h'
        TabOrder = 5
        OnClick = btnOkClick
      end
      object StaticText2: TStaticText
        Left = 166
        Top = 6
        Width = 164
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSingle
        Caption = 'Parts'
        Color = 15658719
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
      end
      object StaticText3: TStaticText
        Left = 352
        Top = 5
        Width = 94
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSingle
        Caption = 'Tipe Laporan'
        Color = 15658719
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
      end
      object rbKartu: TRadioButton
        Left = 360
        Top = 25
        Width = 110
        Height = 20
        Caption = 'Kartu Stok'
        TabOrder = 8
        OnClick = rbKartuClick
      end
      object rbRekap: TRadioButton
        Left = 360
        Top = 42
        Width = 110
        Height = 17
        Caption = 'Rekap Stok'
        TabOrder = 9
        OnClick = rbRekapClick
      end
      object rbGlobal: TRadioButton
        Left = 360
        Top = 58
        Width = 110
        Height = 17
        Caption = 'Global'
        TabOrder = 10
        OnClick = rbGlobalClick
      end
      object txtKode: TAdvEdit
        Left = 198
        Top = 31
        Width = 133
        Height = 21
        AutoFocus = False
        EditAlign = eaLeft
        EditType = etString
        ErrorColor = clRed
        ErrorFontColor = clWhite
        ExcelStyleDecimalSeparator = False
        Flat = False
        FlatLineColor = clBlack
        FlatParentColor = True
        FocusAlign = eaDefault
        FocusBorder = False
        FocusColor = clWindow
        FocusFontColor = clWindowText
        FocusLabel = False
        FocusWidthInc = 0
        ModifiedColor = clHighlight
        DisabledColor = clSilver
        URLColor = clBlue
        ReturnIsTab = True
        LengthLimit = 0
        TabOnFullLength = False
        Precision = 0
        LabelPosition = lpLeftTop
        LabelMargin = 4
        LabelTransparent = False
        LabelAlwaysEnabled = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Persistence.Enable = False
        Persistence.Location = plInifile
        Color = clWindow
        Enabled = True
        HintShowLargeText = False
        OleDropTarget = False
        OleDropSource = False
        Signed = False
        TabOrder = 11
        Text = 'txtKode'
        Transparent = False
        Visible = True
        OnKeyDown = txtKodeKeyDown
      end
      object txtNama: TAdvEdit
        Left = 198
        Top = 55
        Width = 133
        Height = 21
        AutoFocus = False
        EditAlign = eaLeft
        EditType = etString
        ErrorColor = clRed
        ErrorFontColor = clWhite
        ExcelStyleDecimalSeparator = False
        Flat = False
        FlatLineColor = clBlack
        FlatParentColor = True
        FocusAlign = eaDefault
        FocusBorder = False
        FocusColor = clWindow
        FocusFontColor = clWindowText
        FocusLabel = False
        FocusWidthInc = 0
        ModifiedColor = clHighlight
        DisabledColor = clSilver
        URLColor = clBlue
        ReturnIsTab = True
        LengthLimit = 0
        TabOnFullLength = False
        Precision = 0
        LabelPosition = lpLeftTop
        LabelMargin = 4
        LabelTransparent = False
        LabelAlwaysEnabled = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Persistence.Enable = False
        Persistence.Location = plInifile
        Color = clWindow
        Enabled = True
        HintShowLargeText = False
        OleDropTarget = False
        OleDropSource = False
        Signed = False
        TabOrder = 12
        Text = 'txtNama'
        Transparent = False
        Visible = True
        OnKeyDown = txtNamaKeyDown
      end
      object chkNol: TCheckBox
        Left = 496
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Tampilkan Stok 0'
        TabOrder = 13
      end
      object rbRekapDetail: TRadioButton
        Left = 360
        Top = 74
        Width = 110
        Height = 17
        Caption = 'Rekap Stok Detail'
        Enabled = False
        TabOrder = 14
        Visible = False
        OnClick = rbRekapDetailClick
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 101
      Width = 686
      Height = 344
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'Panel1'
      Color = 15921919
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 684
        Height = 342
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          684
          342)
        object Label1: TLabel
          Left = 560
          Top = 21
          Width = 113
          Height = 13
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = '?? Perbaikan Stock'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = Label1Click
        end
        object lblHal: TLabel
          Left = 199
          Top = 318
          Width = 26
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'lblHal'
          Transparent = True
        end
        object asgRekap: TAdvStringGrid
          Left = 9
          Top = 39
          Width = 667
          Height = 265
          Cursor = crDefault
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 6
          Ctl3D = False
          DefaultRowHeight = 18
          DefaultDrawing = False
          FixedColor = 14540253
          FixedCols = 1
          RowCount = 5
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 1
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          GridLineColor = clBlack
          ActiveCellShow = False
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'MS Sans Serif'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = clGray
          Bands.PrimaryColor = clWhite
          Bands.PrimaryLength = 1
          Bands.SecondaryColor = 16773862
          Bands.SecondaryLength = 1
          Bands.Print = False
          AutoNumAlign = False
          AutoSize = False
          VAlignment = vtaTop
          EnhTextSize = False
          EnhRowColMove = False
          SizeWithForm = False
          Multilinecells = False
          OnGetAlignment = asgRekapGetAlignment
          OnExpandNode = asgRekapExpandNode
          OnRightClickCell = asgRekapRightClickCell
          DragDropSettings.OleAcceptFiles = True
          DragDropSettings.OleAcceptText = True
          SortSettings.AutoColumnMerge = False
          SortSettings.Column = 2
          SortSettings.Show = False
          SortSettings.IndexShow = False
          SortSettings.Full = True
          SortSettings.SingleColumn = False
          SortSettings.IgnoreBlanks = True
          SortSettings.BlankPos = blLast
          SortSettings.AutoFormat = True
          SortSettings.Direction = sdAscending
          SortSettings.FixedCols = False
          SortSettings.NormalCellsOnly = True
          SortSettings.Row = 0
          FloatingFooter.Color = clBtnFace
          FloatingFooter.Column = 0
          FloatingFooter.FooterStyle = fsFixedLastRow
          FloatingFooter.Visible = False
          ControlLook.Color = clBlack
          ControlLook.CheckSize = 15
          ControlLook.RadioSize = 10
          ControlLook.ControlStyle = csClassic
          ControlLook.FlatButton = True
          EnableBlink = False
          EnableHTML = True
          EnableWheel = True
          Flat = True
          HintColor = clInfoBk
          SelectionColor = 15921919
          SelectionTextColor = clRed
          SelectionRectangle = False
          SelectionResizer = True
          SelectionRTFKeep = False
          HintShowCells = False
          HintShowLargeText = False
          HintShowSizing = True
          PrintSettings.FooterSize = 0
          PrintSettings.HeaderSize = 80
          PrintSettings.Time = ppNone
          PrintSettings.Date = ppNone
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.PageNr = ppNone
          PrintSettings.Title = ppNone
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWhite
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.Borders = pbSingle
          PrintSettings.BorderStyle = psSolid
          PrintSettings.Centered = True
          PrintSettings.RepeatFixedRows = True
          PrintSettings.RepeatFixedCols = False
          PrintSettings.LeftSize = 0
          PrintSettings.RightSize = 0
          PrintSettings.ColumnSpacing = 50
          PrintSettings.RowSpacing = 10
          PrintSettings.TitleSpacing = 50
          PrintSettings.Orientation = poPortrait
          PrintSettings.PageNumberOffset = 0
          PrintSettings.MaxPagesOffset = 0
          PrintSettings.FixedWidth = 0
          PrintSettings.FixedHeight = 0
          PrintSettings.UseFixedHeight = False
          PrintSettings.UseFixedWidth = False
          PrintSettings.FitToPage = fpNever
          PrintSettings.PageNumSep = '/'
          PrintSettings.NoAutoSize = False
          PrintSettings.NoAutoSizeRow = True
          PrintSettings.PrintGraphics = False
          HTMLSettings.Width = 100
          HTMLSettings.XHTML = False
          Navigation.AdvanceDirection = adLeftRight
          Navigation.AllowClipboardRowGrow = True
          Navigation.AllowClipboardColGrow = True
          Navigation.InsertPosition = pInsertBefore
          Navigation.CopyHTMLTagsToClipboard = True
          Navigation.HomeEndKey = heFirstLastColumn
          ColumnSize.Stretch = True
          ColumnSize.Location = clRegistry
          CellNode.Color = clSilver
          CellNode.NodeColor = clBlack
          CellNode.ShowTree = False
          MaxEditLength = 0
          IntelliPan = ipVertical
          URLColor = clBlue
          URLShow = False
          URLFull = False
          URLEdit = False
          ScrollType = ssFlat
          ScrollColor = clNone
          ScrollWidth = 17
          ScrollSynch = False
          ScrollProportional = False
          ScrollHints = shNone
          OemConvert = False
          FixedFooters = 0
          FixedRightCols = 0
          FixedColWidth = 64
          FixedRowHeight = 21
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clBlack
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FixedAsButtons = False
          FloatFormat = '%.2n'
          IntegralHeight = False
          WordWrap = False
          ColumnHeaders.Strings = (
            'No.'
            'Kode Item'
            'Nama Item'
            'Harga'
            'Keterangan')
          Lookup = False
          LookupCaseSensitive = False
          LookupHistory = False
          BackGround.Top = 0
          BackGround.Left = 0
          BackGround.Display = bdTile
          BackGround.Cells = bcNormal
          Filter = <>
          ColWidths = (
            64
            50
            86
            64
            90
            310)
          RowHeights = (
            21
            18
            18
            18
            18)
        end
        object btnPrint: TButton
          Left = 599
          Top = 309
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Print'
          TabOrder = 1
          OnClick = btnPrintClick
        end
        object btnFilter: TButton
          Left = 9
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Perlihatkan &Filter'
          TabOrder = 2
          OnClick = btnFilterClick
        end
        object btnAdd: TButton
          Left = 87
          Top = 7
          Width = 75
          Height = 25
          Caption = '&New...'
          TabOrder = 3
          Visible = False
        end
        object btnEdit: TButton
          Left = 393
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Edit'
          TabOrder = 4
          Visible = False
        end
        object btnDetail: TButton
          Left = 166
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Detail'
          TabOrder = 5
          Visible = False
        end
        object StaticText4: TStaticText
          Left = 531
          Top = 18
          Width = 143
          Height = 17
          Anchors = [akTop, akRight]
          BorderStyle = sbsSingle
          Caption = '  Stok tidak mencukupi  '
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 6
        end
        object txtLimit: TAdvEdit
          Left = 41
          Top = 314
          Width = 68
          Height = 21
          AutoFocus = False
          EditAlign = eaRight
          EditType = etNumeric
          ErrorColor = clRed
          ErrorFontColor = clWhite
          ExcelStyleDecimalSeparator = False
          Flat = False
          FlatLineColor = clBlack
          FlatParentColor = True
          FocusAlign = eaDefault
          FocusBorder = False
          FocusColor = clWindow
          FocusFontColor = clWindowText
          FocusLabel = False
          FocusWidthInc = 0
          ModifiedColor = clHighlight
          DisabledColor = clSilver
          URLColor = clBlue
          ReturnIsTab = False
          LengthLimit = 0
          TabOnFullLength = False
          Precision = 0
          Suffix = ' Rows'
          LabelCaption = 'Limit :'
          LabelPosition = lpLeftTop
          LabelMargin = 2
          LabelTransparent = False
          LabelAlwaysEnabled = False
          LabelFont.Charset = ANSI_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Persistence.Enable = False
          Persistence.Location = plInifile
          Anchors = [akLeft, akBottom]
          Color = clWindow
          Enabled = True
          HintShowLargeText = False
          OleDropTarget = False
          OleDropSource = False
          Signed = False
          TabOrder = 7
          Text = '0'
          Transparent = False
          Visible = True
        end
        object spdFirst: TsuiButton
          Left = 112
          Top = 316
          Width = 19
          Height = 18
          Anchors = [akLeft, akBottom]
          AutoSize = False
          UIStyle = DeepBlue
          TabOrder = 8
          Transparent = True
          ModalResult = 0
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C8A5D98127ED
            AC71FFFFFFFFFFFFEEB887D78126D47E24D4802BE8C3A5FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFBE5D4D97B16FFBD38E48414FFFFFFFFFFFFDE7602FFA400FFA1
            02FFAC12CF7621FFFFFFFFFFFFFFFFFFFFFFFFFDF8F3CE762AFFA414FFA104E2
            7B00FFFFFFFFFFFFD97300FF9E00FD9600FF9900CA6D15FFFFFFFFFFFFFFFFFF
            FFFFFFDC915BED8C0DF89200FE9700DE7900FFFFFFFFFFFFD56F00FE9800F58F
            00F79100C46715FFFFFFFFFFFFFFFFFFECB998D87913F08903EE8800F69000D7
            7200FFFFFFFAF3EECF6900F58F00ED8700EE8800C16315FFFFFFFFFFFFF2DBCE
            C46718EA9224E37E00E78100EF8900D26B00FFFFFFFFFFFFCA6400EF8900E57F
            00E88200BD5E15FFFFFFFFFFFFC0723DE7A356DD8521DD7600E07A00E88200CC
            6500FFFFFFFFFFFFC45E00E68000DD7700DF7900B75B15FFFFFFFFFFFFBA6932
            E8AB68DA882FD77407D97200E17A00C76100FFFFFFFFFFFFBF5900DD7700D56F
            00D67000B45615FFFFFFFFFFFFE2B8A4C67335DE974ED57D23D47006DA7300C0
            5B00FFFFFFFFFFFFB95300D56E00CE6700CF6C07B05418FFFFFFFFFFFFFFFFFF
            CC8969CE874BDA9048D4802BD87D1CBD5C0CFFFFFFFFFFFFB55005D07213CB70
            17D17D2EAE511BFFFFFFFFFFFFFFFFFFFEFAF9B26237DA9C65D99555DB9248BC
            6421FFFFFFFFFFFFB1520FD48840CE8241D59257A94E1DFFFFFFFFFFFFFFFFFF
            FFFFFFF6E7E2AD5321E4B488E2AC78BC6D36FFFFFFFFFFFFB1541BD9A06DD498
            68DBA982A84F21FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBC8BBB96635F5DCC1C3
            7A4EFFFFFFFFFFFFB25F2CE9C8ABE4BFA4ECD2BFAE5B2FFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFD6A08CB15E33C87F5BFFFFFFFFFFFFCF8F6FAE5B31AA57
            2BB1633CD2A591FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphLeft
          Spacing = 4
          MouseContinuouslyDownInterval = 100
          OnClick = spdFirstClick
          ResHandle = 0
        end
        object spdPrev: TsuiButton
          Left = 132
          Top = 316
          Width = 19
          Height = 18
          Anchors = [akLeft, akBottom]
          AutoSize = False
          UIStyle = DeepBlue
          TabOrder = 9
          Transparent = True
          ModalResult = 0
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFEACEC4AE5B33AF5B32D1A391FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F0EDC98165B35B2DDFB69AEFDB
            CAA85124FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5
            B8A3AB4E1CC87E46D79F70D7A37BE3BCA0A74D20FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF7E3DAC47144BC590ED17D2FD0813ED0894ED49563DFB1
            8AA74B1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF9F8DAA181B35208CD6700CE
            6904CB6C11CD7624D0813AD38E51DEA778A84D19FFFFFFFFFFFFFFFFFFFFFFFF
            F2DBCDBC6628CE6800DC7600D67000D16B00CE6800CF7010D17C28D48841DEA2
            67AB4E16FFFFFFFFFFFFFFFFFFFFFFFFBE6829E98300E37D00DD7700DA7400D8
            7200D56F00D36D01D4791AD78634E09F5BAF5116FFFFFFFFFFFFFFFFFFFFFFFF
            C16C2BF08A00EB8500E57F00E17B00DE7800DB7500D97300D9790FDB862CE39F
            52B15517FFFFFFFFFFFFFFFFFFFFFFFFF4DECFC66E29DD7700F18B00EB8500E5
            7F00E27C00DF7900DE7D09DF8927E7A24EB55816FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFBF9E4AB84CA670AEE8800F08A00EA8400E68000E48309E58F27ECA6
            4EB85B16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEADDD78748DC
            7401F79100F08900EB8B0FEB972BF3AD52BD5D15FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3C9A9CB6C1AEB8503F99D1CF2A235F7B7
            5BC06316FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFDF7F1E1A06DD57513FBB246FFCB71C36B1EFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DECBCE7F3CCD78
            26E5BD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphLeft
          Spacing = 4
          MouseContinuouslyDownInterval = 100
          OnClick = spdPrevClick
          ResHandle = 0
        end
        object spdNext: TsuiButton
          Left = 152
          Top = 316
          Width = 19
          Height = 18
          Anchors = [akLeft, akBottom]
          AutoSize = False
          UIStyle = DeepBlue
          TabOrder = 10
          Transparent = True
          ModalResult = 0
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5BD9FCD7826CE7F3CF6DECBFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            C36B1EFFCB71FBB246D57513E1A06DFDF7F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC06316F7B75BF2A235F99D1CEB8503CB
            6C1AF3C9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            BD5D15F3AD52EB972BEB8B0FF08900F79100DC7401D78748FBEADDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB85B16ECA64EE58F27E48309E68000EA
            8400F08A00EE8800CA670AE4AB84FEFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            B55816E7A24EDF8927DE7D09DF7900E27C00E57F00EB8500F18B00DD7700C66E
            29F4DECFFFFFFFFFFFFFFFFFFFFFFFFFB15517E39F52DB862CD9790FD97300DB
            7500DE7800E17B00E57F00EB8500F08A00C16C2BFFFFFFFFFFFFFFFFFFFFFFFF
            AF5116E09F5BD78634D4791AD36D01D56F00D87200DA7400DD7700E37D00E983
            00BE6829FFFFFFFFFFFFFFFFFFFFFFFFAB4E16DEA267D48841D17C28CF7010CE
            6800D16B00D67000DC7600CE6800BC6628F2DBCDFFFFFFFFFFFFFFFFFFFFFFFF
            A84D19DEA778D38E51D0813ACD7624CB6C11CE6904CD6700B35208DAA181FDF9
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA74B1EDFB18AD49563D0894ED0813ED1
            7D2FBC590EC47144F7E3DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            A74D20E3BCA0D7A37BD79F70C87E46AB4E1CE5B8A3FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA85124EFDBCADFB69AB35B2DC98165F9
            F0EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            D1A391AF5B32AE5B33EACEC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphRight
          Spacing = 4
          MouseContinuouslyDownInterval = 100
          OnClick = spdNextClick
          ResHandle = 0
        end
        object spdLast: TsuiButton
          Left = 172
          Top = 316
          Width = 19
          Height = 18
          Anchors = [akLeft, akBottom]
          AutoSize = False
          UIStyle = DeepBlue
          TabOrder = 11
          Transparent = True
          ModalResult = 0
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFE8C2A3D4802BD47E24D78126EEB989FFFFFFFF
            FFFFE9B180D57E23EEC19BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0761F
            FFAC12FFA102FFA400DD7703FFFFFFFFFFFFDA7E1CFFB628D97409F9E0CDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFCB6C13FF9900FD9600FF9E00D87300FFFFFFFF
            FFFFD37512FB9909FD9700CE7725FDF6F1FFFFFFFFFFFFFFFFFFFFFFFFC56713
            F79100F58F00FE9800D46F00FFFFFFFFFFFFCD6A0AF18C01F48E00EF8A00DC92
            58FFFFFFFFFFFFFFFFFFFFFFFFC16213F08A00ED8700F79100CE6900FFFFFFFF
            FFFFC76305EA8300E98300F18B00DF7801EFBD99FFFFFFFFFFFFFFFFFFBC5F13
            E78100E57F00EE8800C86300FFFFFFFFFFFFC15D05E17B00E27C00E68000EF89
            00C96509F4DFD0FFFFFFFFFFFFB95B13DE7900DD7700E68000C35E00FFFFFFFF
            FFFFBD5A09DA7501DA7400DE7800E27C00EA8400C5773EFFFFFFFFFFFFB45513
            D67000D67000DD7700BD5800FFFFFFFFFFFFB95A12D47208D36D00D67000DB75
            00E68000BF6B2DFFFFFFFFFFFFAF5317CF6C07CE6600D46E00B95300FFFFFFFF
            FFFFB75D1CD27A20CD6804CF6800D66F00C45D01E6BEA6FFFFFFFFFFFFAD5119
            D17D2ECC6F17D07213B45104FFFFFFFFFFFFB56026D2853ECC7422CD6F12C562
            05D2916BFFFFFFFFFFFFFFFFFFAA4F1DD59157CF8341D48840B15110FFFFFFFF
            FFFFB46332D5955DCF8645CE7D36B56536FEFAF9FFFFFFFFFFFFFFFFFFA84E1F
            DBA981D49868DBA06DAE5319FFFFFFFFFFFFB66B42DBA980D79F6FAE511CF6E7
            E0FFFFFFFFFFFFFFFFFFFFFFFFAD592FEDD4BFE4BFA4EAC9ABB25D2BFFFFFFFF
            FFFFBF7750EDD3BCB66233E8C3B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0A38F
            B1643BAA572BAF5C32CF9071FFFFFFFFFFFFCD8B6AB05C32D39A83FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphRight
          Spacing = 4
          MouseContinuouslyDownInterval = 100
          OnClick = spdLastClick
          ResHandle = 0
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 496
    Top = 88
    object BenerinStock1: TMenuItem
      Caption = 'Benerin Stock!'
      OnClick = BenerinStock1Click
    end
  end
end
