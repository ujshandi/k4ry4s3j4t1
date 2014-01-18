object frmRugiLaba: TfrmRugiLaba
  Left = 2
  Top = 114
  Width = 696
  Height = 480
  Caption = 'frmRugiLaba'
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
      Height = 120
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object d: TBevel
        Left = 15
        Top = 16
        Width = 226
        Height = 97
        Shape = bsFrame
        Style = bsRaised
      end
      object l: TLabel
        Left = 22
        Top = 60
        Width = 21
        Height = 13
        Caption = 'Until'
      end
      object btnReset: TButton
        Left = 339
        Top = 86
        Width = 75
        Height = 25
        Caption = '&Reset'
        TabOrder = 0
      end
      object cmbOpr1: TComboBox
        Left = 22
        Top = 32
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
        Left = 73
        Top = 32
        Width = 150
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
        Left = 73
        Top = 58
        Width = 150
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
        Left = 20
        Top = 8
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
        Left = 260
        Top = 86
        Width = 75
        Height = 25
        Caption = 'Refres&h'
        TabOrder = 5
        OnClick = btnOkClick
      end
      object rbTanggal: TRadioButton
        Left = 32
        Top = 88
        Width = 90
        Height = 17
        Caption = 'Per Tanggal'
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
        OnClick = rbTanggalClick
      end
      object rbBulan: TRadioButton
        Left = 128
        Top = 88
        Width = 90
        Height = 17
        Caption = 'Per Bulan'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 7
        Visible = False
        OnClick = rbTanggalClick
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 121
      Width = 686
      Height = 324
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'Panel1'
      Color = 15921919
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 684
        Height = 322
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          684
          322)
        object btnPrint: TButton
          Left = 599
          Top = 289
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Print'
          TabOrder = 0
          OnClick = btnPrintClick
        end
        object btnFilter: TButton
          Left = 9
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Perlihatkan &Filter'
          TabOrder = 1
          OnClick = btnFilterClick
        end
        object asgLabaRugi: TAdvStringGrid
          Left = 10
          Top = 47
          Width = 660
          Height = 236
          Cursor = crDefault
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 9
          Ctl3D = False
          DefaultRowHeight = 21
          DefaultDrawing = False
          FixedCols = 0
          RowCount = 23
          FixedRows = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 1
          Options = [goFixedVertLine, goFixedHorzLine, goDrawFocusSelected, goColSizing]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
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
          VAlignment = vtaBottom
          EnhTextSize = False
          EnhRowColMove = False
          SizeWithForm = False
          Multilinecells = False
          OnGetCellColor = asgLabaRugiGetCellColor
          OnGetCellPrintColor = asgLabaRugiGetCellPrintColor
          OnGetCellPrintBorder = asgLabaRugiGetCellPrintBorder
          OnGetCellBorder = asgLabaRugiGetCellBorder
          OnGetAlignment = asgLabaRugiGetAlignment
          OnPrintPage = asgLabaRugiPrintPage
          OnPrintSetColumnWidth = asgLabaRugiPrintSetColumnWidth
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
          ControlLook.ControlStyle = csWinXP
          ControlLook.FlatButton = True
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
          PrintSettings.FooterFont.Color = clWhite
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.Borders = pbNoborder
          PrintSettings.BorderStyle = psSolid
          PrintSettings.Centered = True
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
          PrintSettings.PrintGraphics = True
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
          ColumnHeaders.Strings = (
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
            64)
        end
      end
    end
  end
  object AdvPreviewDialog1: TAdvPreviewDialog
    DialogCaption = 'Preview'
    DialogPrevBtn = 'Previous'
    DialogNextBtn = 'Next'
    DialogPrintBtn = 'Print'
    DialogCloseBtn = 'Close'
    Grid = asgLabaRugi
    PreviewFast = False
    PreviewWidth = 350
    PreviewHeight = 300
    PreviewLeft = 100
    PreviewTop = 100
    PreviewCenter = False
    PrinterSetupDialog = False
    PrintSelectedRows = False
    Left = 104
    Top = 144
  end
end
