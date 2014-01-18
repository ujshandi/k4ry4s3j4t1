object frmClaim: TfrmClaim
  Left = 158
  Top = 94
  Width = 616
  Height = 575
  Caption = 'frmClaim'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    608
    541)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 5
    Top = 11
    Width = 596
    Height = 184
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object TLabel
    Left = 12
    Top = 28
    Width = 42
    Height = 13
    Caption = 'No.Klaim'
  end
  object TLabel
    Left = 12
    Top = 52
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object TLabel
    Left = 12
    Top = 126
    Width = 55
    Height = 13
    Caption = 'Keterangan'
  end
  object TBevel
    Left = 5
    Top = 208
    Width = 596
    Height = 217
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsFrame
  end
  object TLabel
    Left = 12
    Top = 78
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object TLabel
    Left = 335
    Top = 30
    Width = 65
    Height = 13
    Caption = 'ID Pelanggan'
  end
  object Label11: TLabel
    Left = 354
    Top = 435
    Width = 234
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '[Ctrl+DEL] = Hapus Baris;  [F8] = Menambah baris'
  end
  object TLabel
    Left = 12
    Top = 169
    Width = 39
    Height = 13
    Caption = 'No.PPG'
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
    TabOrder = 7
  end
  object dtpTrans: TDateTimePicker
    Left = 72
    Top = 50
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 38825.3586227083
    Time = 38825.3586227083
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    OnChange = dtpTransChange
  end
  object mmNotes: TMemo
    Left = 72
    Top = 126
    Width = 185
    Height = 35
    Lines.Strings = (
      'Memo1'
      'Memo1'
      'Memo1')
    TabOrder = 1
    WantReturns = False
    OnKeyDown = mmNotesKeyDown
  end
  object btnSave: TButton
    Left = 447
    Top = 506
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Save'
    TabOrder = 5
    OnClick = btnSaveClick
  end
  object btnBatal: TButton
    Left = 527
    Top = 506
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 6
    OnClick = btnBatalClick
  end
  object TStaticText
    Left = 21
    Top = 4
    Width = 256
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Dokumen Klaim'
    Color = 15658719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 8
  end
  object sttDetailInfo: TStaticText
    Left = 21
    Top = 202
    Width = 256
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Detail Klaim'
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
  object pgcCust: TPageControl
    Left = 332
    Top = 57
    Width = 256
    Height = 126
    ActivePage = tbsCust
    Images = frmMainMenu.SmallImageList
    TabIndex = 0
    TabOrder = 10
    object tbsCust: TTabSheet
      Caption = 'Data Pelanggan '
      ImageIndex = 1
      object TLabel
        Left = 12
        Top = 7
        Width = 28
        Height = 13
        Caption = 'Nama'
      end
      object TLabel
        Left = 12
        Top = 30
        Width = 32
        Height = 13
        Caption = 'Alamat'
      end
      object TLabel
        Left = 12
        Top = 54
        Width = 39
        Height = 13
        Caption = 'Telepon'
      end
      object lblAddress: TLabel
        Left = 80
        Top = 30
        Width = 48
        Height = 13
        Caption = 'lblAddress'
      end
      object lblNamaCust: TLabel
        Left = 80
        Top = 7
        Width = 59
        Height = 13
        Caption = 'lblNamaCust'
      end
      object lblTlp: TLabel
        Left = 80
        Top = 54
        Width = 25
        Height = 13
        Caption = 'lblTlp'
      end
    end
    object tbsMotor: TTabSheet
      Caption = 'Data Motor '
      ImageIndex = 2
      TabVisible = False
      object TLabel
        Left = 12
        Top = 30
        Width = 31
        Height = 13
        Caption = 'Tahun'
      end
      object TLabel
        Left = 12
        Top = 54
        Width = 58
        Height = 13
        Caption = 'No. Rangka'
      end
      object Label7: TLabel
        Left = 12
        Top = 76
        Width = 48
        Height = 13
        Caption = 'No. Mesin'
      end
      object TLabel
        Left = 12
        Top = 7
        Width = 21
        Height = 13
        Caption = 'Tipe'
      end
      object lblTipeMotor: TLabel
        Left = 80
        Top = 7
        Width = 58
        Height = 13
        Caption = 'lblTipeMotor'
      end
      object lblTahun: TLabel
        Left = 80
        Top = 30
        Width = 41
        Height = 13
        Caption = 'lblTahun'
      end
      object lblRangka: TLabel
        Left = 80
        Top = 54
        Width = 48
        Height = 13
        Caption = 'lblRangka'
      end
      object lblNoMesin: TLabel
        Left = 80
        Top = 76
        Width = 52
        Height = 13
        Caption = 'lblNoMesin'
      end
    end
  end
  object txtNoPol: TAdvEdit
    Left = 406
    Top = 29
    Width = 145
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
    TabOrder = 3
    Text = 'txtNoPol'
    Transparent = False
    Visible = True
  end
  object btnCust: TButton
    Left = 527
    Top = 31
    Width = 22
    Height = 18
    Caption = '...'
    TabOrder = 4
    Visible = False
    OnClick = btnCustClick
  end
  object sttOperator: TStaticText
    Left = 72
    Top = 77
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
    TabOrder = 11
  end
  object pnl: TPanel
    Left = 8
    Top = 432
    Width = 433
    Height = 105
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 12
    DesignSize = (
      433
      105)
    object TLabel
      Left = 8
      Top = 56
      Width = 60
      Height = 33
      Anchors = [akLeft, akBottom]
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 250
      Top = 13
      Width = 41
      Height = 20
      Caption = 'Bayar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 245
      Top = 53
      Width = 56
      Height = 20
      Caption = 'Kembali'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 8
      Top = 4
      Width = 39
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Subtotal'
    end
    object TLabel
      Left = 8
      Top = 28
      Width = 42
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Discount'
    end
    object txtSubtotal: TAdvEdit
      Left = 77
      Top = 4
      Width = 143
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
      Anchors = [akLeft, akBottom]
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
      Left = 77
      Top = 28
      Width = 143
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
      Anchors = [akLeft, akBottom]
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
    end
    object txtTotal: TAdvEdit
      Left = 77
      Top = 52
      Width = 143
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
      Anchors = [akLeft, akBottom]
      Color = clWindow
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HintShowLargeText = False
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      ReadOnly = True
      Signed = False
      TabOrder = 2
      Text = '0'
      Transparent = False
      Visible = True
    end
    object txtBayar: TAdvEdit
      Left = 309
      Top = 12
      Width = 116
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
      Anchors = [akLeft, akBottom]
      Color = clWindow
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HintShowLargeText = False
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 3
      Text = '0'
      Transparent = False
      Visible = True
      OnChange = txtBayarChange
    end
    object txtkembali: TAdvEdit
      Left = 309
      Top = 52
      Width = 116
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
      Anchors = [akLeft, akBottom]
      Color = clWindow
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HintShowLargeText = False
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      ReadOnly = True
      Signed = False
      TabOrder = 4
      Text = '0'
      Transparent = False
      Visible = True
      OnChange = txtDiscChange
    end
  end
  object txtReference: TAdvEdit
    Left = 72
    Top = 100
    Width = 185
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
    TabOrder = 14
    Text = 'txtReference'
    Transparent = False
    Visible = True
  end
  object btnReference: TButton
    Left = 234
    Top = 102
    Width = 21
    Height = 18
    Caption = '...'
    TabOrder = 13
    OnClick = btnReferenceClick
  end
  object btnDeleteClaim: TButton
    Left = 19
    Top = 391
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Delete Row'
    TabOrder = 15
    Visible = False
    OnClick = btnDeleteClaimClick
  end
  object asgClaim: TAdvStringGrid
    Left = 18
    Top = 224
    Width = 573
    Height = 176
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
    TabOrder = 16
    OnKeyDown = asgClaimKeyDown
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
    OnGetAlignment = asgClaimGetAlignment
    OnCanEditCell = asgClaimCanEditCell
    OnCellValidate = asgClaimCellValidate
    OnGetEditorType = asgClaimGetEditorType
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
      312)
    RowHeights = (
      21
      21
      21
      21
      21)
  end
  object chkRef: TCheckBox
    Left = 13
    Top = 101
    Width = 55
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Ref.'
    TabOrder = 17
    OnClick = chkRefClick
  end
  object txtPPG: TAdvEdit
    Left = 72
    Top = 166
    Width = 185
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
    TabOrder = 2
    Text = 'txtReference'
    Transparent = False
    Visible = True
  end
end
