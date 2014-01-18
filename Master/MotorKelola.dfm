object frmMotorKelola: TfrmMotorKelola
  Left = 21
  Top = 121
  Width = 725
  Height = 480
  Caption = 'frmMotorKelola'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 446
    Align = alClient
    Caption = 'MainPanel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      717
      446)
    object pgcMain: TPageControl
      Left = 8
      Top = 8
      Width = 705
      Height = 433
      ActivePage = tbsMotor
      Anchors = [akLeft, akTop, akRight, akBottom]
      Images = frmMainMenu.ImageList
      TabHeight = 35
      TabIndex = 0
      TabOrder = 0
      OnChange = pgcMainChange
      object tbsMotor: TTabSheet
        Caption = 'Data Kendaraan'
        ImageIndex = 15
        object Panel1: TPanel
          Left = 0
          Top = 128
          Width = 697
          Height = 260
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          Color = 15921919
          TabOrder = 0
          DesignSize = (
            697
            260)
          object asgRekap: TAdvStringGrid
            Left = 9
            Top = 40
            Width = 682
            Height = 183
            Cursor = crDefault
            Anchors = [akLeft, akTop, akRight, akBottom]
            ColCount = 8
            Ctl3D = False
            DefaultRowHeight = 18
            DefaultDrawing = False
            FixedColor = 14540253
            FixedCols = 1
            RowCount = 5
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLineWidth = 1
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
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
            OnGetCellPrintColor = asgRekapGetCellPrintColor
            OnGetCellPrintBorder = asgRekapGetCellPrintBorder
            OnGetAlignment = asgRekapGetAlignment
            OnPrintPage = asgRekapPrintPage
            OnPrintSetColumnWidth = asgRekapPrintSetColumnWidth
            OnRightClickCell = asgRekapRightClickCell
            OnDblClickCell = asgRekapDblClickCell
            DragDropSettings.OleAcceptFiles = True
            DragDropSettings.OleAcceptText = True
            SortSettings.AutoColumnMerge = False
            SortSettings.Column = 1
            SortSettings.Show = True
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
            FloatFormat = '%.0f'
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
              86
              64
              87
              105
              64
              145)
            RowHeights = (
              21
              18
              18
              18
              18)
          end
          object btnPrint: TButton
            Left = 616
            Top = 229
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Print'
            TabOrder = 1
            OnClick = btnPrintClick
          end
          object btnEdit: TButton
            Left = 93
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Edit'
            TabOrder = 2
            OnClick = btnEditClick
          end
          object btnAdd: TButton
            Left = 12
            Top = 6
            Width = 75
            Height = 25
            Caption = '&New..'
            TabOrder = 3
            OnClick = btnAddClick
          end
          object btnOk: TButton
            Left = 175
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Refresh'
            TabOrder = 4
            OnClick = btnOkClick
          end
        end
        object pnlFilter: TPanel
          Left = 0
          Top = 0
          Width = 697
          Height = 128
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlFilter'
          TabOrder = 1
          DesignSize = (
            697
            128)
          object Label11: TLabel
            Left = 8
            Top = 88
            Width = 24
            Height = 13
            Caption = 'Jenis'
          end
          object Label6: TLabel
            Left = 8
            Top = 64
            Width = 27
            Height = 13
            Caption = 'Nama'
          end
          object Label4: TLabel
            Left = 8
            Top = 40
            Width = 24
            Height = 13
            Caption = 'Kode'
          end
          object cmbFilterType: TComboBox
            Left = 72
            Top = 88
            Width = 138
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'cmbFilterOperator'
            Items.Strings = (
              'Semua Jenis'
              'Custom'
              'Single')
          end
          object btnReset: TButton
            Left = 453
            Top = -190
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Reset'
            TabOrder = 1
            OnClick = btnResetClick
          end
          object btnLoad: TButton
            Left = 361
            Top = -190
            Width = 90
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Tampilkan Data'
            TabOrder = 2
            OnClick = btnLoadClick
          end
          object txtFilterNama: TAdvEdit
            Left = 72
            Top = 64
            Width = 137
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
            Text = 'txtNama'
            Transparent = False
            Visible = True
          end
          object txtFilterKode: TAdvEdit
            Left = 72
            Top = 40
            Width = 73
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
            TabOrder = 4
            Text = 'txtKode'
            Transparent = False
            Visible = True
          end
          object StaticText4: TStaticText
            Left = 0
            Top = 0
            Width = 697
            Height = 26
            Align = alTop
            AutoSize = False
            Caption = '  Filter Item'
            Color = 14540253
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
        end
      end
      object tbsGudang: TTabSheet
        Caption = 'Gudang '
        ImageIndex = 12
        object Panel2: TPanel
          Left = 0
          Top = 128
          Width = 697
          Height = 260
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          Color = 15921919
          TabOrder = 0
          DesignSize = (
            697
            260)
          object asgGudang: TAdvStringGrid
            Left = 9
            Top = 40
            Width = 682
            Height = 183
            Cursor = crDefault
            Anchors = [akLeft, akTop, akRight, akBottom]
            ColCount = 8
            Ctl3D = False
            DefaultRowHeight = 18
            DefaultDrawing = False
            FixedColor = 14540253
            FixedCols = 1
            RowCount = 5
            FixedRows = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLineWidth = 1
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
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
            OnGetAlignment = asgGudangGetAlignment
            DragDropSettings.OleAcceptFiles = True
            DragDropSettings.OleAcceptText = True
            SortSettings.AutoColumnMerge = False
            SortSettings.Column = 1
            SortSettings.Show = True
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
            FloatFormat = '%.0f'
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
              86
              64
              87
              105
              64
              145)
            RowHeights = (
              21
              18
              18
              18
              18)
          end
          object btnPrintGudang: TButton
            Left = 616
            Top = 229
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Print'
            TabOrder = 1
            Visible = False
            OnClick = btnPrintClick
          end
          object btnEditGudang: TButton
            Left = 93
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Edit'
            TabOrder = 2
            OnClick = btnEditGudangClick
          end
          object btnNewGudang: TButton
            Left = 12
            Top = 6
            Width = 75
            Height = 25
            Caption = '&New'
            TabOrder = 3
            OnClick = btnNewGudangClick
          end
          object btnRefreshGudang: TButton
            Left = 175
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Refresh'
            TabOrder = 4
            OnClick = btnRefreshGudangClick
          end
          object CheckBox1: TCheckBox
            Left = 8
            Top = 232
            Width = 49
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'Aktif '
            Checked = True
            Color = clWhite
            Enabled = False
            ParentColor = False
            State = cbChecked
            TabOrder = 5
          end
        end
        object pnlFilterGudang: TPanel
          Left = 0
          Top = 0
          Width = 697
          Height = 128
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlFilter'
          TabOrder = 1
          DesignSize = (
            697
            128)
          object Label1: TLabel
            Left = 8
            Top = 88
            Width = 24
            Height = 13
            Caption = 'Jenis'
          end
          object Label2: TLabel
            Left = 8
            Top = 64
            Width = 27
            Height = 13
            Caption = 'Nama'
          end
          object Label3: TLabel
            Left = 8
            Top = 40
            Width = 24
            Height = 13
            Caption = 'Kode'
          end
          object ComboBox1: TComboBox
            Left = 72
            Top = 88
            Width = 138
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'cmbFilterOperator'
            Items.Strings = (
              'Semua Jenis'
              'Custom'
              'Single')
          end
          object Button5: TButton
            Left = 453
            Top = -190
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Reset'
            TabOrder = 1
            OnClick = btnResetClick
          end
          object Button6: TButton
            Left = 361
            Top = -190
            Width = 90
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Tampilkan Data'
            TabOrder = 2
            OnClick = btnLoadClick
          end
          object AdvEdit1: TAdvEdit
            Left = 72
            Top = 64
            Width = 137
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
            Text = 'txtNama'
            Transparent = False
            Visible = True
          end
          object AdvEdit2: TAdvEdit
            Left = 72
            Top = 40
            Width = 73
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
            TabOrder = 4
            Text = 'txtKode'
            Transparent = False
            Visible = True
          end
          object StaticText1: TStaticText
            Left = 0
            Top = 0
            Width = 697
            Height = 26
            Align = alTop
            AutoSize = False
            Caption = '  Filter Item'
            Color = 14540253
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
        end
      end
    end
  end
  object WinXP1: TWinXP
    Left = 368
    Top = 24
  end
  object apd1: TAdvPreviewDialog
    DialogCaption = 'Preview'
    DialogPrevBtn = 'Previous'
    DialogNextBtn = 'Next'
    DialogPrintBtn = 'Print'
    DialogCloseBtn = 'Close'
    PreviewFast = False
    PreviewWidth = 800
    PreviewHeight = 600
    PreviewLeft = 112
    PreviewTop = 84
    PreviewCenter = True
    PrinterSetupDialog = True
    PrintSelectedRows = False
    Left = 176
    Top = 400
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 192
    object HapusData1: TMenuItem
      Caption = 'Hapus Data'
      OnClick = HapusData1Click
    end
  end
end
