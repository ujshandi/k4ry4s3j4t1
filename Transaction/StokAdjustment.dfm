object frmStokAdjustment: TfrmStokAdjustment
  Left = 174
  Top = 156
  Width = 588
  Height = 428
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Stok Adjustment'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    580
    394)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 7
    Top = 6
    Width = 203
    Height = 73
  end
  object Label1: TLabel
    Left = 12
    Top = 52
    Width = 45
    Height = 13
    Caption = 'Tanggal :'
  end
  object TLabel
    Left = 16
    Top = 340
    Width = 61
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Keterangan :'
  end
  object TBevel
    Left = 215
    Top = 7
    Width = 138
    Height = 72
  end
  object TLabel
    Left = 12
    Top = 27
    Width = 57
    Height = 13
    Caption = 'No.Opname'
  end
  object TBevel
    Left = 357
    Top = 7
    Width = 217
    Height = 72
    Anchors = [akLeft, akTop, akRight]
  end
  object TBevel
    Left = 7
    Top = 84
    Width = 567
    Height = 251
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object dtpTanggal: TDateTimePicker
    Left = 76
    Top = 50
    Width = 117
    Height = 21
    CalAlignment = dtaLeft
    Date = 37932.6873753356
    Time = 37932.6873753356
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    OnChange = dtpTanggalChange
  end
  object mmoKeterangan: TMemo
    Left = 16
    Top = 356
    Width = 361
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
  end
  object btnSave: TButton
    Left = 403
    Top = 360
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Save'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 483
    Top = 360
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object asgItem: TAdvStringGrid
    Left = 14
    Top = 94
    Width = 551
    Height = 204
    Cursor = crDefault
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 5
    Ctl3D = False
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
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    OnKeyDown = asgItemKeyDown
    GridLineColor = clSilver
    ActiveCellShow = False
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = clGray
    Bands.Active = True
    Bands.PrimaryColor = 15257794
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
    OnGetAlignment = asgItemGetAlignment
    OnAutoAddRow = asgItemAutoAddRow
    OnCanEditCell = asgItemCanEditCell
    OnCellValidate = asgItemCellValidate
    OnGetEditorType = asgItemGetEditorType
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
    Flat = True
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
    Navigation.AdvanceInsert = True
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
      292)
    RowHeights = (
      21
      21
      21
      21
      21)
  end
  object TStaticText
    Left = 216
    Top = 8
    Width = 134
    Height = 17
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = ' Data Cabang'
    Color = 9783838
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
  end
  object cmbBranch: TComboBox
    Left = 224
    Top = 31
    Width = 121
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 6
  end
  object TStaticText
    Left = 7
    Top = 6
    Width = 202
    Height = 17
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = ' Dokumen Transaksi'
    Color = 9783838
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 7
  end
  object sttNum: TStaticText
    Left = 76
    Top = 27
    Width = 45
    Height = 17
    BorderStyle = sbsSingle
    Caption = 'sttNum'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object TStaticText
    Left = 358
    Top = 8
    Width = 213
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BorderStyle = sbsSingle
    Color = 9783838
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 9
  end
  object btnDelete: TButton
    Left = 17
    Top = 304
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Hapus Baris'
    TabOrder = 10
    OnClick = btnDeleteClick
  end
end
