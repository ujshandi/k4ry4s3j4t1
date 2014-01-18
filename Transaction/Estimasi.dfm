object frmEstimasi: TfrmEstimasi
  Left = 253
  Top = 94
  Width = 709
  Height = 654
  Caption = 'frmEstimasi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    701
    620)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 5
    Top = 11
    Width = 689
    Height = 184
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object lblNo: TLabel
    Left = 12
    Top = 28
    Width = 55
    Height = 13
    Caption = 'No.Estimasi'
  end
  object TLabel
    Left = 12
    Top = 52
    Width = 39
    Height = 13
    Caption = 'Tanggal'
  end
  object Label1: TLabel
    Left = 12
    Top = 72
    Width = 55
    Height = 13
    Caption = 'Keterangan'
  end
  object Bevel1: TBevel
    Left = 5
    Top = 199
    Width = 689
    Height = 303
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsFrame
  end
  object TLabel
    Left = 452
    Top = 510
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object TLabel
    Left = 335
    Top = 33
    Width = 72
    Height = 13
    Caption = 'Kode Customer'
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
    TabOrder = 10
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
    TabOrder = 3
    OnChange = dtpTransChange
    OnKeyDown = dtpTransKeyDown
  end
  object mmNotes: TMemo
    Left = 72
    Top = 76
    Width = 185
    Height = 85
    Lines.Strings = (
      'Memo1'
      'Memo1'
      'Memo1')
    TabOrder = 2
    WantReturns = False
    OnKeyDown = mmNotesKeyDown
  end
  object btnSave: TButton
    Left = 543
    Top = 586
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Save'
    TabOrder = 7
    OnClick = btnSaveClick
  end
  object btnBatal: TButton
    Left = 620
    Top = 586
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 8
    OnClick = btnBatalClick
  end
  object lblDok: TStaticText
    Left = 21
    Top = 4
    Width = 349
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Dokumen Estimasi'
    Color = 15658719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 11
  end
  object pgcCust: TPageControl
    Left = 332
    Top = 57
    Width = 333
    Height = 126
    ActivePage = tbsCust
    Images = frmMainMenu.SmallImageList
    TabIndex = 0
    TabOrder = 12
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
      Caption = 'Data Kendaraan'
      ImageIndex = 6
      object TLabel
        Left = 258
        Top = 35
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
      object TLabel
        Left = 12
        Top = 76
        Width = 48
        Height = 13
        Caption = 'No. Mesin'
      end
      object TLabel
        Left = 12
        Top = 35
        Width = 21
        Height = 13
        Caption = 'Tipe'
      end
      object lblTipeMotor: TLabel
        Left = 80
        Top = 35
        Width = 58
        Height = 13
        Caption = 'lblTipeMotor'
      end
      object lblTahun: TLabel
        Left = 295
        Top = 35
        Width = 24
        Height = 13
        Caption = '2000'
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
      object TLabel
        Left = 14
        Top = 11
        Width = 41
        Height = 13
        Caption = 'No.Polisi'
      end
      object cmbNoPol: TComboBox
        Left = 80
        Top = 8
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
        OnSelect = cmbNoPolSelect
      end
      object btnAddKendaraan: TButton
        Left = 227
        Top = 7
        Width = 86
        Height = 22
        Caption = 'Add Kendaraan'
        TabOrder = 1
        OnClick = btnAddKendaraanClick
      end
    end
  end
  object txtNoPol: TAdvEdit
    Left = 412
    Top = 30
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
    TabOrder = 0
    Text = 'txtNoPol'
    Transparent = False
    Visible = True
    OnKeyDown = txtNoPolKeyDown
  end
  object btnCust: TButton
    Left = 533
    Top = 32
    Width = 22
    Height = 18
    Caption = '...'
    TabOrder = 1
    OnClick = btnCustClick
  end
  object sttOperator: TStaticText
    Left = 512
    Top = 509
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
    TabOrder = 13
  end
  object pnlFooter: TPanel
    Left = 8
    Top = 502
    Width = 430
    Height = 116
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      430
      116)
    object TLabel
      Left = 8
      Top = 78
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
      Visible = False
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
      Visible = False
    end
    object TLabel
      Left = 8
      Top = 6
      Width = 39
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Subtotal'
    end
    object TLabel
      Left = 8
      Top = 52
      Width = 42
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Discount'
    end
    object TLabel
      Left = 8
      Top = 29
      Width = 56
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Uang Muka'
    end
    object txtSubtotal: TAdvEdit
      Left = 77
      Top = 6
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
      TabOrder = 3
      Text = '0'
      Transparent = False
      Visible = True
    end
    object txtDisc: TAdvEdit
      Left = 77
      Top = 52
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
      ReadOnly = True
      Signed = False
      TabOrder = 1
      Text = '0'
      Transparent = False
      Visible = True
      OnChange = txtDiscChange
    end
    object txtTotal: TAdvEdit
      Left = 77
      Top = 75
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
      TabOrder = 4
      Text = '0'
      Transparent = False
      Visible = True
    end
    object txtBayar: TAdvEdit
      Left = 309
      Top = 9
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
      Signed = False
      TabOrder = 2
      Text = '0'
      Transparent = False
      Visible = False
      OnChange = txtBayarChange
      OnKeyDown = txtBayarKeyDown
    end
    object txtkembali: TAdvEdit
      Left = 309
      Top = 50
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
      ReadOnly = True
      Signed = False
      TabOrder = 5
      Text = '0'
      Transparent = False
      Visible = False
      OnChange = txtDiscChange
    end
    object txtDP: TAdvEdit
      Left = 77
      Top = 29
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
      Signed = False
      TabOrder = 0
      Text = '0'
      Transparent = False
      Visible = True
      OnChange = txtDPChange
    end
  end
  object pgcDetail: TPageControl
    Left = 11
    Top = 205
    Width = 677
    Height = 290
    ActivePage = tbsReguler
    Anchors = [akLeft, akTop, akRight, akBottom]
    Images = frmMainMenu.SmallImageList
    TabIndex = 0
    TabOrder = 4
    OnChange = pgcDetailChange
    object tbsReguler: TTabSheet
      Caption = 'Detail Estimasi'
      ImageIndex = 3
      object Splitter1: TSplitter
        Left = 0
        Top = 110
        Width = 669
        Height = 10
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object pnlRegService: TPanel
        Left = 0
        Top = 0
        Width = 669
        Height = 110
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlRegService'
        TabOrder = 0
        object lblDetailService: TStaticText
          Left = 0
          Top = 0
          Width = 669
          Height = 17
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Detail Estimasi Service'
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
        object asgRegService: TAdvStringGrid
          Left = 0
          Top = 17
          Width = 669
          Height = 93
          Cursor = crDefault
          Align = alClient
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
          OnEnter = asgRegServiceEnter
          OnExit = asgCompanyServiceExit
          OnKeyDown = asgRegServiceKeyDown
          OnSelectCell = asgRegServiceSelectCell
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
          OnGetAlignment = asgRegServiceGetAlignment
          OnRightClickCell = asgRegServiceRightClickCell
          OnCanEditCell = asgRegServiceCanEditCell
          OnCellValidate = asgRegServiceCellValidate
          OnGetEditorType = asgRegServiceGetEditorType
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
            391)
          RowHeights = (
            21
            21
            21
            21
            21)
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 120
        Width = 669
        Height = 141
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 1
        object TLabel
          Left = 0
          Top = 0
          Width = 669
          Height = 13
          Align = alTop
          Alignment = taRightJustify
          Caption = '[Ctrl+DEL] = Hapus Baris;  [F8] = Menambah baris'
        end
        object lblDetailPart: TStaticText
          Left = 0
          Top = 13
          Width = 669
          Height = 17
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Detail Estimasi Part'
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
        object asgRegPart: TAdvStringGrid
          Left = 0
          Top = 30
          Width = 669
          Height = 111
          Cursor = crDefault
          Align = alClient
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
          OnEnter = asgRegServiceEnter
          OnExit = asgCompanyServiceExit
          OnKeyDown = asgRegPartKeyDown
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
          OnGetAlignment = asgRegPartGetAlignment
          OnRightClickCell = asgRegPartRightClickCell
          OnCanEditCell = asgRegPartCanEditCell
          OnCellValidate = asgRegPartCellValidate
          OnGetEditorType = asgRegPartGetEditorType
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
            408)
          RowHeights = (
            21
            21
            21
            21
            21)
        end
      end
    end
    object tbsKsg: TTabSheet
      Caption = 'Service KSG '
      ImageIndex = 4
      object Splitter2: TSplitter
        Left = 0
        Top = 105
        Width = 669
        Height = 10
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 669
        Height = 105
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel3'
        TabOrder = 0
        DesignSize = (
          669
          105)
        object asgKSGService: TAdvStringGrid
          Left = 0
          Top = 20
          Width = 669
          Height = 85
          Cursor = crDefault
          Align = alBottom
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
          TabOrder = 0
          OnEnter = asgRegServiceEnter
          OnExit = asgCompanyServiceExit
          OnKeyDown = asgKSGServiceKeyDown
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
          OnGetAlignment = asgKSGServiceGetAlignment
          OnRightClickCell = asgRegPartRightClickCell
          OnCanEditCell = asgKSGServiceCanEditCell
          OnCellValidate = asgKSGServiceCellValidate
          OnGetEditorType = asgRegPartGetEditorType
          OnCheckBoxClick = asgKSGServiceCheckBoxClick
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
            391)
          RowHeights = (
            21
            21
            21
            21
            21)
        end
        object TStaticText
          Left = 5
          Top = 1
          Width = 354
          Height = 17
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Detail Service KSG'
          Color = 15658719
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 115
        Width = 669
        Height = 146
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 1
        DesignSize = (
          669
          146)
        object TLabel
          Left = 431
          Top = 2
          Width = 234
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = '[Ctrl+DEL] = Hapus Baris;  [F8] = Menambah baris'
        end
        object TStaticText
          Left = 5
          Top = 2
          Width = 354
          Height = 17
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Detail Part KSG'
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
        object asgKSGPart: TAdvStringGrid
          Left = 0
          Top = 24
          Width = 669
          Height = 122
          Cursor = crDefault
          Align = alBottom
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
          OnEnter = asgRegServiceEnter
          OnExit = asgCompanyServiceExit
          OnKeyDown = asgKSGPartKeyDown
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
          OnGetAlignment = asgKSGPartGetAlignment
          OnRightClickCell = asgKSGPartRightClickCell
          OnCanEditCell = asgKSGPartCanEditCell
          OnCellValidate = asgKSGPartCellValidate
          OnGetEditorType = asgKSGPartGetEditorType
          OnCheckBoxClick = asgKSGPartCheckBoxClick
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
            391)
          RowHeights = (
            21
            21
            21
            21
            21)
        end
      end
    end
    object tbsCompany: TTabSheet
      Caption = 'Service Company '
      ImageIndex = 5
      object Splitter3: TSplitter
        Left = 0
        Top = 105
        Width = 669
        Height = 10
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 669
        Height = 105
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel5'
        TabOrder = 0
        DesignSize = (
          669
          105)
        object TStaticText
          Left = 5
          Top = 1
          Width = 354
          Height = 17
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Detail Service Company'
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
        object asgCompanyService: TAdvStringGrid
          Left = 0
          Top = 20
          Width = 669
          Height = 85
          Cursor = crDefault
          Align = alBottom
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
          OnEnter = asgRegServiceEnter
          OnExit = asgCompanyServiceExit
          OnKeyDown = asgCompanyServiceKeyDown
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
          OnGetAlignment = asgRegPartGetAlignment
          OnRightClickCell = asgRegPartRightClickCell
          OnCanEditCell = asgCompanyServiceCanEditCell
          OnCellValidate = asgCompanyServiceCellValidate
          OnGetEditorType = asgRegPartGetEditorType
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
            391)
          RowHeights = (
            21
            21
            21
            21
            21)
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 115
        Width = 669
        Height = 146
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel6'
        TabOrder = 1
        DesignSize = (
          669
          146)
        object TLabel
          Left = 431
          Top = 2
          Width = 234
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = '[Ctrl+DEL] = Hapus Baris;  [F8] = Menambah baris'
        end
        object TStaticText
          Left = 5
          Top = 2
          Width = 354
          Height = 17
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Detail Part Company'
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
        object asgCompanyPart: TAdvStringGrid
          Left = 0
          Top = 23
          Width = 669
          Height = 123
          Cursor = crDefault
          Align = alBottom
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
          OnEnter = asgRegServiceEnter
          OnExit = asgCompanyServiceExit
          OnKeyDown = asgCompanyPartKeyDown
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
          OnGetAlignment = asgRegPartGetAlignment
          OnRightClickCell = asgCompanyPartRightClickCell
          OnCanEditCell = asgCompanyPartCanEditCell
          OnCellValidate = asgCompanyPartCellValidate
          OnGetEditorType = asgCompanyPartGetEditorType
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
            391)
          RowHeights = (
            21
            21
            21
            21
            21)
        end
      end
    end
  end
  object btnCustNew: TButton
    Left = 563
    Top = 32
    Width = 87
    Height = 20
    Caption = '&Customer Baru'
    TabOrder = 14
    OnClick = btnCustNewClick
  end
  object chkPost: TCheckBox
    Left = 629
    Top = 530
    Width = 65
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akRight, akBottom]
    Caption = '  Posting'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnKeyDown = chkPostKeyDown
  end
  object btnPosting: TButton
    Left = 466
    Top = 586
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Posting'
    TabOrder = 9
    OnClick = btnPostingClick
  end
  object rgbPrint: TRadioGroup
    Left = 451
    Top = 533
    Width = 238
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Model Cetak'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Pisah'
      'Gabung')
    ParentFont = False
    TabOrder = 15
    Visible = False
  end
  object popReguler: TPopupMenu
    Left = 256
    Top = 80
    object DeleteRow1: TMenuItem
      Caption = 'Delete Row'
      OnClick = DeleteRow1Click
    end
  end
end
