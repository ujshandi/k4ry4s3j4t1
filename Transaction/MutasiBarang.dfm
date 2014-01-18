object frmMutasiBarang: TfrmMutasiBarang
  Left = 156
  Top = 177
  Width = 540
  Height = 432
  Caption = 'frmMutasiBarang'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    532
    398)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 5
    Top = 11
    Width = 517
    Height = 81
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object l: TLabel
    Left = 22
    Top = 28
    Width = 48
    Height = 13
    Caption = 'No.Mutasi'
  end
  object TLabel
    Left = 22
    Top = 54
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object Bevel1: TBevel
    Left = 5
    Top = 103
    Width = 520
    Height = 218
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsFrame
  end
  object lblGudang: TLabel
    Left = 288
    Top = 28
    Width = 74
    Height = 13
    Caption = 'Gudang Tujuan'
  end
  object Label11: TLabel
    Left = 281
    Top = 333
    Width = 234
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '[Ctrl+DEL] = Hapus Baris;  [F8] = Menambah baris'
  end
  object sttNum: TStaticText
    Left = 72
    Top = 28
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
    TabOrder = 8
  end
  object dtpTrans: TDateTimePicker
    Left = 72
    Top = 52
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 38825.3586227083
    Time = 38825.3586227083
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    OnChange = dtpTransChange
  end
  object asgTerima: TAdvStringGrid
    Left = 12
    Top = 118
    Width = 506
    Height = 180
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
    TabOrder = 1
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
      245)
    RowHeights = (
      21
      21
      21
      21
      21)
  end
  object btnSave: TButton
    Left = 363
    Top = 363
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnBatal: TButton
    Left = 443
    Top = 363
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 4
    OnClick = btnBatalClick
  end
  object sttInfo: TStaticText
    Left = 21
    Top = 4
    Width = 180
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Dokumen Mutasi'
    Color = 15658719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 9
  end
  object StaticText2: TStaticText
    Left = 21
    Top = 97
    Width = 180
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Detail Mutasi'
    Color = 15658719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 10
  end
  object btnDelete: TButton
    Left = 175
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Delete Row'
    TabOrder = 6
    Visible = False
    OnClick = btnDeleteClick
  end
  object btnNew: TButton
    Left = 15
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&New Part'
    TabOrder = 7
    Visible = False
    OnClick = btnNewClick
  end
  object cmbGudang: TComboBox
    Left = 369
    Top = 27
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnKeyDown = cmbGudangKeyDown
  end
  object Panel1: TPanel
    Left = 8
    Top = 322
    Width = 337
    Height = 70
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    DesignSize = (
      337
      70)
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 55
      Height = 13
      Caption = 'Keterangan'
    end
    object mmNotes: TMemo
      Left = 8
      Top = 20
      Width = 256
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Lines.Strings = (
        'Memo1'
        'Memo1'
        'Memo1')
      TabOrder = 0
      WantReturns = False
      OnKeyDown = mmNotesKeyDown
    end
  end
end
