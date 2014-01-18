object frmLOVNew: TfrmLOVNew
  Left = 155
  Top = 151
  Width = 391
  Height = 432
  Caption = 'frmLOVNew'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    383
    398)
  PixelsPerInch = 96
  TextHeight = 13
  object lblStok: TLabel
    Left = 11
    Top = 360
    Width = 191
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Posisi stok per tgl transaksi yg dilakukan'
    Color = 15921919
    ParentColor = False
  end
  object txtNama: TAdvEdit
    Left = 114
    Top = 9
    Width = 261
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
    TabOrder = 0
    Text = 'txtNama'
    Transparent = False
    Visible = True
    OnChange = txtNamaChange
  end
  object btnOK: TBitBtn
    Left = 219
    Top = 360
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancel: TBitBtn
    Left = 299
    Top = 360
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 3
    Kind = bkCancel
  end
  object asgList: TAdvStringGrid
    Left = 8
    Top = 39
    Width = 366
    Height = 314
    Cursor = crDefault
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 6
    DefaultRowHeight = 21
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 5
    FixedRows = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 1
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing, goRowSelect]
    ParentFont = False
    TabOrder = 1
    GridLineColor = clSilver
    ActiveCellShow = False
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = clGray
    Bands.PrimaryColor = clInfoBk
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
    OnGetCellColor = asgListGetCellColor
    OnGetAlignment = asgListGetAlignment
    OnDblClickCell = asgListDblClickCell
    OnCanEditCell = asgListCanEditCell
    DragDropSettings.OleAcceptFiles = True
    DragDropSettings.OleAcceptText = True
    SortSettings.AutoColumnMerge = False
    SortSettings.Column = 2
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
    HintColor = clInfoBk
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
    FixedRowHeight = 21
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
    FixedAsButtons = False
    FloatFormat = '%.2n'
    IntegralHeight = False
    WordWrap = False
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
      105
      0)
    RowHeights = (
      21
      21
      21
      21
      21)
  end
  object rdbNama: TRadioButton
    Left = 56
    Top = 10
    Width = 53
    Height = 17
    Caption = 'Nama'
    TabOrder = 4
    OnClick = rdbNamaClick
  end
  object rdbKode: TRadioButton
    Left = 8
    Top = 10
    Width = 47
    Height = 17
    Caption = 'Kode'
    TabOrder = 5
    OnClick = rdbKodeClick
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 296
    Top = 31
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT null, item_code, item_name, item_seq FROM item ')
    Left = 264
    Top = 31
  end
end
