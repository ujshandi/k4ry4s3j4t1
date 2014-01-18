object frmMekanikPendapatan: TfrmMekanikPendapatan
  Left = 2
  Top = 114
  Width = 696
  Height = 480
  Caption = 'frmMekanikPendapatan'
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
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object d: TBevel
        Left = 15
        Top = 16
        Width = 146
        Height = 69
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
      object Bevel1: TBevel
        Left = 168
        Top = 16
        Width = 177
        Height = 49
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 349
        Top = 15
        Width = 129
        Height = 66
        Shape = bsFrame
        Style = bsRaised
      end
      object btnReset: TButton
        Left = 567
        Top = 54
        Width = 75
        Height = 25
        Caption = '&Reset'
        TabOrder = 0
        OnClick = btnResetClick
      end
      object cmbOpr1: TComboBox
        Left = 22
        Top = 31
        Width = 48
        Height = 21
        BevelKind = bkFlat
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnSelect = cmbOpr1Select
        Items.Strings = (
          '='
          '>='
          '<='
          'From')
      end
      object dtpDari1: TDateTimePicker
        Left = 73
        Top = 32
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
        Left = 73
        Top = 58
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
        Left = 488
        Top = 54
        Width = 75
        Height = 25
        Caption = 'Refres&h'
        TabOrder = 5
        OnClick = btnOkClick
      end
      object StaticText2: TStaticText
        Left = 174
        Top = 11
        Width = 164
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSingle
        Caption = 'Mekanik'
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
      object cmbMekanik: TComboBox
        Left = 176
        Top = 36
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
      end
      object StaticText3: TStaticText
        Left = 355
        Top = 10
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
        TabOrder = 8
      end
      object rbItem: TRadioButton
        Left = 360
        Top = 32
        Width = 115
        Height = 17
        Caption = 'Global Per Mekanik'
        Checked = True
        TabOrder = 9
        TabStop = True
      end
      object rbTrans: TRadioButton
        Left = 360
        Top = 56
        Width = 115
        Height = 17
        Caption = 'Per Transaksi'
        TabOrder = 10
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 91
      Width = 686
      Height = 354
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'Panel1'
      Color = 15921919
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 684
        Height = 352
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          684
          352)
        object asgRekap: TAdvStringGrid
          Left = 9
          Top = 39
          Width = 667
          Height = 275
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
          DragDropSettings.OleAcceptFiles = True
          DragDropSettings.OleAcceptText = True
          SortSettings.AutoColumnMerge = False
          SortSettings.Column = 1
          SortSettings.Show = False
          SortSettings.IndexShow = False
          SortSettings.Full = True
          SortSettings.SingleColumn = False
          SortSettings.IgnoreBlanks = False
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
          SelectionResizer = False
          SelectionRTFKeep = False
          HintShowCells = False
          HintShowLargeText = False
          HintShowSizing = False
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
            64
            86
            64
            87
            299)
          RowHeights = (
            21
            18
            18
            18
            18)
        end
        object btnPrint: TButton
          Left = 599
          Top = 319
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
      end
    end
  end
end
