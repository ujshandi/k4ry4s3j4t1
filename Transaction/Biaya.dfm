object frmBiaya: TfrmBiaya
  Left = 119
  Top = 164
  Width = 529
  Height = 486
  Caption = 'frmBiaya'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    521
    452)
  PixelsPerInch = 96
  TextHeight = 13
  object TBevel
    Left = 5
    Top = 11
    Width = 504
    Height = 142
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object l: TLabel
    Left = 15
    Top = 33
    Width = 63
    Height = 13
    Caption = 'No.Transaksi'
  end
  object TLabel
    Left = 15
    Top = 59
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object TLabel
    Left = 15
    Top = 83
    Width = 55
    Height = 13
    Caption = 'Keterangan'
  end
  object Bevel1: TBevel
    Left = 5
    Top = 160
    Width = 504
    Height = 197
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsFrame
  end
  object Label11: TLabel
    Left = 268
    Top = 367
    Width = 234
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '[Ctrl+DEL] = Hapus Baris;  [F8] = Menambah baris'
  end
  object TStaticText
    Left = 21
    Top = 4
    Width = 164
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Dokumen Pengeluaran Biaya'
    Color = 15658719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object mmNotes: TMemo
    Left = 84
    Top = 83
    Width = 184
    Height = 54
    Lines.Strings = (
      'Memo1'
      'Memo1'
      'Memo1')
    TabOrder = 1
    WantReturns = False
    OnKeyDown = mmNotesKeyDown
  end
  object TStaticText
    Left = 21
    Top = 157
    Width = 164
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Detil Pengeluaran Biaya'
    Color = 15658719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object asgTerima: TAdvStringGrid
    Left = 12
    Top = 176
    Width = 490
    Height = 145
    Cursor = crDefault
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 5
    DefaultRowHeight = 21
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
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    ParentFont = False
    TabOrder = 3
    OnKeyDown = asgTerimaKeyDown
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
    OnGetAlignment = asgTerimaGetAlignment
    OnCanEditCell = asgTerimaCanEditCell
    OnCellValidate = asgTerimaCellValidate
    OnGetEditorType = asgTerimaGetEditorType
    DragDropSettings.OleAcceptFiles = True
    DragDropSettings.OleAcceptText = True
    SortSettings.AutoColumnMerge = False
    SortSettings.Column = 0
    SortSettings.Show = False
    SortSettings.IndexShow = False
    SortSettings.Full = True
    SortSettings.SingleColumn = False
    SortSettings.IgnoreBlanks = False
    SortSettings.BlankPos = blFirst
    SortSettings.AutoFormat = True
    SortSettings.Direction = sdAscending
    SortSettings.FixedCols = False
    SortSettings.NormalCellsOnly = False
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
    Navigation.AdvanceOnEnter = True
    Navigation.AutoComboDropSize = True
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
    SizeWhileTyping.Height = True
    SizeWhileTyping.Width = True
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
      229)
    RowHeights = (
      21
      21
      21
      21
      21)
  end
  object btnDelete: TButton
    Left = 207
    Top = 326
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Delete Row'
    TabOrder = 4
    Visible = False
    OnClick = btnDeleteClick
  end
  object btnNew: TButton
    Left = 15
    Top = 326
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&New Biaya'
    TabOrder = 5
    OnClick = btnNewClick
  end
  object Panel1: TPanel
    Left = 7
    Top = 358
    Width = 188
    Height = 81
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 6
    object TLabel
      Left = 8
      Top = 9
      Width = 39
      Height = 13
      Caption = 'Subtotal'
    end
    object TLabel
      Left = 8
      Top = 34
      Width = 42
      Height = 13
      Caption = 'Discount'
    end
    object TLabel
      Left = 8
      Top = 58
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object txtSubtotal: TAdvEdit
      Left = 56
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      AutoFocus = False
      EditAlign = eaRight
      EditType = etMoney
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
      ReadOnly = True
      Signed = False
      TabOrder = 0
      Text = '0'
      Transparent = False
      Visible = True
    end
    object txtDisc: TAdvEdit
      Left = 56
      Top = 31
      Width = 121
      Height = 21
      AutoFocus = False
      EditAlign = eaRight
      EditType = etMoney
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
      TabOrder = 1
      Text = '0'
      Transparent = False
      Visible = True
      OnChange = txtDiscChange
      OnKeyDown = txtDiscKeyDown
    end
    object txtTotal: TAdvEdit
      Left = 56
      Top = 56
      Width = 121
      Height = 21
      TabStop = False
      AutoFocus = False
      EditAlign = eaRight
      EditType = etMoney
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
      ReadOnly = True
      Signed = False
      TabOrder = 2
      Text = '0'
      Transparent = False
      Visible = True
    end
  end
  object btnSave: TButton
    Left = 347
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Save'
    TabOrder = 7
    OnClick = btnSaveClick
  end
  object btnBatal: TButton
    Left = 427
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 8
    OnClick = btnBatalClick
  end
  object sttNum: TStaticText
    Left = 84
    Top = 33
    Width = 185
    Height = 17
    AutoSize = False
    BiDiMode = bdLeftToRight
    BorderStyle = sbsSingle
    Caption = 'sttNum'
    Color = clWhite
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
    TabOrder = 9
  end
  object dtpTrans: TDateTimePicker
    Left = 84
    Top = 57
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 38825.3586227083
    Time = 38825.3586227083
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 10
  end
end
