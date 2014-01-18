object frmPersonKelola: TfrmPersonKelola
  Left = 62
  Top = 164
  Width = 725
  Height = 480
  Caption = 'frmPersonKelola'
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
    Width = 717
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlFilter: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 93
      Align = alTop
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        717
        93)
      object TBevel
        Left = 7
        Top = 15
        Width = 212
        Height = 67
      end
      object Label1: TLabel
        Left = 16
        Top = 28
        Width = 22
        Height = 13
        Caption = 'Kota'
      end
      object TLabel
        Left = 16
        Top = 52
        Width = 32
        Height = 13
        Caption = 'Alamat'
      end
      object TBevel
        Left = 227
        Top = 15
        Width = 212
        Height = 67
      end
      object TLabel
        Left = 236
        Top = 28
        Width = 31
        Height = 13
        Caption = 'Phone'
      end
      object TLabel
        Left = 236
        Top = 52
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object btnReset: TButton
        Left = 634
        Top = 61
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Reset'
        TabOrder = 0
        OnClick = btnResetClick
      end
      object txtKota: TAdvEdit
        Left = 60
        Top = 26
        Width = 150
        Height = 21
        AutoFocus = False
        EditAlign = eaLeft
        EditType = etString
        ErrorColor = clRed
        ErrorFontColor = clWhite
        ExcelStyleDecimalSeparator = False
        Flat = False
        FlatLineColor = clGray
        FlatParentColor = False
        FocusAlign = eaDefault
        FocusBorder = False
        FocusColor = clWindow
        FocusFontColor = clWindowText
        FocusLabel = False
        FocusWidthInc = 0
        ModifiedColor = clHighlight
        DisabledColor = clSilver
        SoftBorder = True
        URLColor = clBlue
        ReturnIsTab = False
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
        TabOrder = 1
        Transparent = False
        Visible = True
      end
      object TStaticText
        Left = 6
        Top = 5
        Width = 213
        Height = 17
        AutoSize = False
        BevelKind = bkSoft
        BevelOuter = bvNone
        Caption = ' Filter Location'
        Color = 9783838
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
      end
      object StaticText1: TStaticText
        Left = 226
        Top = 5
        Width = 213
        Height = 17
        AutoSize = False
        BevelKind = bkSoft
        BevelOuter = bvNone
        Caption = ' Filter Contact'
        Color = 9783838
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
      object txtPhone: TAdvEdit
        Left = 280
        Top = 26
        Width = 150
        Height = 21
        AutoFocus = False
        EditAlign = eaLeft
        EditType = etString
        ErrorColor = clRed
        ErrorFontColor = clWhite
        ExcelStyleDecimalSeparator = False
        Flat = False
        FlatLineColor = clGray
        FlatParentColor = False
        FocusAlign = eaDefault
        FocusBorder = False
        FocusColor = clWindow
        FocusFontColor = clWindowText
        FocusLabel = False
        FocusWidthInc = 0
        ModifiedColor = clHighlight
        DisabledColor = clSilver
        SoftBorder = True
        URLColor = clBlue
        ReturnIsTab = False
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
        TabOrder = 4
        Transparent = False
        Visible = True
      end
      object txtAddress: TAdvEdit
        Left = 60
        Top = 50
        Width = 150
        Height = 21
        AutoFocus = False
        EditAlign = eaLeft
        EditType = etString
        ErrorColor = clRed
        ErrorFontColor = clWhite
        ExcelStyleDecimalSeparator = False
        Flat = False
        FlatLineColor = clGray
        FlatParentColor = False
        FocusAlign = eaDefault
        FocusBorder = False
        FocusColor = clWindow
        FocusFontColor = clWindowText
        FocusLabel = False
        FocusWidthInc = 0
        ModifiedColor = clHighlight
        DisabledColor = clSilver
        SoftBorder = True
        URLColor = clBlue
        ReturnIsTab = False
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
        TabOrder = 5
        Transparent = False
        Visible = True
      end
      object txtFax: TAdvEdit
        Left = 280
        Top = 50
        Width = 150
        Height = 21
        AutoFocus = False
        EditAlign = eaLeft
        EditType = etString
        ErrorColor = clRed
        ErrorFontColor = clWhite
        ExcelStyleDecimalSeparator = False
        Flat = False
        FlatLineColor = clGray
        FlatParentColor = False
        FocusAlign = eaDefault
        FocusBorder = False
        FocusColor = clWindow
        FocusFontColor = clWindowText
        FocusLabel = False
        FocusWidthInc = 0
        ModifiedColor = clHighlight
        DisabledColor = clSilver
        SoftBorder = True
        URLColor = clBlue
        ReturnIsTab = False
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
        TabOrder = 6
        Transparent = False
        Visible = True
      end
    end
    object TPanel
      Left = 0
      Top = 93
      Width = 717
      Height = 353
      Align = alClient
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        717
        353)
      object Bevel1: TBevel
        Left = 8
        Top = 37
        Width = 700
        Height = 277
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
      object Shape2: TShape
        Left = 10
        Top = 326
        Width = 12
        Height = 12
        Anchors = [akLeft, akBottom]
        Brush.Color = clYellow
        Visible = False
      end
      object TLabel
        Left = 27
        Top = 326
        Width = 40
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Warning'
        Visible = False
      end
      object TLabel
        Left = 100
        Top = 326
        Width = 37
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Banned'
        Visible = False
      end
      object TShape
        Left = 85
        Top = 326
        Width = 12
        Height = 12
        Anchors = [akLeft, akBottom]
        Brush.Color = clRed
        Visible = False
      end
      object btnContact: TButton
        Left = 252
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Input Kontak'
        Enabled = False
        TabOrder = 0
        Visible = False
        OnClick = btnContactClick
      end
      object btnAdd: TButton
        Left = 12
        Top = 6
        Width = 75
        Height = 25
        Caption = '&New..'
        TabOrder = 1
        OnClick = btnAddClick
      end
      object btnEdit: TButton
        Left = 91
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 2
        OnClick = btnEditClick
      end
      object btnFilter: TButton
        Left = 432
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Show Filter'
        TabOrder = 3
        Visible = False
        OnClick = btnFilterClick
      end
      object btnPrint: TButton
        Left = 631
        Top = 321
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Print'
        TabOrder = 4
        OnClick = btnPrintClick
      end
      object asgPerson: TAdvStringGrid
        Left = 14
        Top = 44
        Width = 689
        Height = 264
        Cursor = crDefault
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 14
        DefaultRowHeight = 18
        DefaultDrawing = False
        FixedCols = 1
        RowCount = 5
        FixedRows = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 1
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        TabOrder = 5
        GridLineColor = clBlack
        ActiveCellShow = False
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = clGray
        Bands.Active = True
        Bands.PrimaryColor = 16773862
        Bands.PrimaryLength = 1
        Bands.SecondaryColor = clWindow
        Bands.SecondaryLength = 1
        Bands.Print = False
        AutoNumAlign = False
        AutoSize = False
        VAlignment = vtaTop
        EnhTextSize = False
        EnhRowColMove = False
        SizeWithForm = False
        Multilinecells = False
        OnGetAlignment = asgPersonGetAlignment
        OnDblClickCell = asgPersonDblClickCell
        DragDropSettings.OleAcceptFiles = True
        DragDropSettings.OleAcceptText = True
        SortSettings.AutoColumnMerge = False
        SortSettings.Column = 1
        SortSettings.Show = True
        SortSettings.IndexShow = False
        SortSettings.Full = True
        SortSettings.SingleColumn = False
        SortSettings.IgnoreBlanks = True
        SortSettings.BlankPos = blFirst
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
        ControlLook.FlatButton = False
        EnableBlink = False
        EnableHTML = True
        EnableWheel = True
        Flat = False
        HintColor = 12615680
        SelectionColor = clHighlight
        SelectionTextColor = clHighlightText
        SelectionRectangle = False
        SelectionResizer = False
        SelectionRTFKeep = False
        HintShowCells = False
        HintShowLargeText = False
        HintShowSizing = False
        PrintSettings.FooterSize = 0
        PrintSettings.HeaderSize = 0
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
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.Borders = pbNoborder
        PrintSettings.BorderStyle = psSolid
        PrintSettings.Centered = False
        PrintSettings.RepeatFixedRows = False
        PrintSettings.RepeatFixedCols = False
        PrintSettings.LeftSize = 0
        PrintSettings.RightSize = 0
        PrintSettings.ColumnSpacing = 0
        PrintSettings.RowSpacing = 0
        PrintSettings.TitleSpacing = 0
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
        PrintSettings.NoAutoSizeRow = False
        PrintSettings.PrintGraphics = False
        HTMLSettings.Width = 100
        HTMLSettings.XHTML = False
        Navigation.AdvanceDirection = adLeftRight
        Navigation.AllowClipboardRowGrow = True
        Navigation.AllowClipboardColGrow = True
        Navigation.InsertPosition = pInsertBefore
        Navigation.CopyHTMLTagsToClipboard = True
        Navigation.HomeEndKey = heFirstLastColumn
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
        ScrollType = ssNormal
        ScrollColor = clNone
        ScrollWidth = 17
        ScrollSynch = False
        ScrollProportional = False
        ScrollHints = shNone
        OemConvert = False
        FixedFooters = 0
        FixedRightCols = 0
        FixedColWidth = 64
        FixedRowHeight = 20
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        FixedAsButtons = False
        FloatFormat = '%.2f'
        IntegralHeight = False
        WordWrap = False
        ColumnHeaders.Strings = (
          'No'
          'Kode'
          'Nama'
          'Alamat'
          'Kota'
          'Phone 1'
          'Phone 2'
          '')
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
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          101
          64)
        RowHeights = (
          20
          18
          18
          18
          18)
      end
      object btnOk: TButton
        Left = 172
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Refresh'
        TabOrder = 6
        OnClick = btnOkClick
      end
    end
  end
  object WinXP1: TWinXP
    Left = 488
    Top = 48
  end
end
