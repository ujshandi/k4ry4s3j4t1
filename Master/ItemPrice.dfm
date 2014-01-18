object frmItemPrice: TfrmItemPrice
  Left = 159
  Top = 210
  Width = 725
  Height = 480
  Caption = 'frmItemPrice'
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
      Left = 5
      Top = 4
      Width = 706
      Height = 436
      ActivePage = tbsPart
      Anchors = [akLeft, akTop, akRight, akBottom]
      Images = frmMainMenu.ImageList
      TabHeight = 40
      TabIndex = 0
      TabOrder = 0
      OnChange = pgcMainChange
      object tbsPart: TTabSheet
        Caption = 'Part  '
        ImageIndex = 6
        object Panel1: TPanel
          Left = 0
          Top = 120
          Width = 698
          Height = 266
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'Panel1'
          Color = 15921919
          TabOrder = 0
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 696
            Height = 264
            Align = alClient
            BevelOuter = bvLowered
            Caption = 'Panel2'
            Color = clSilver
            TabOrder = 0
            DesignSize = (
              696
              264)
            object asgPart: TAdvStringGrid
              Left = 9
              Top = 39
              Width = 679
              Height = 189
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
              OnGetAlignment = asgPartGetAlignment
              OnRightClickCell = asgPartRightClickCell
              OnDblClickCell = asgPartDblClickCell
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
                311)
              RowHeights = (
                21
                18
                18
                18
                18)
            end
            object btnPrintPart: TButton
              Left = 612
              Top = 235
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Print'
              TabOrder = 1
              OnClick = btnPrintPartClick
            end
            object btnAddPart: TButton
              Left = 84
              Top = 6
              Width = 75
              Height = 25
              Caption = '&New'
              TabOrder = 2
              OnClick = btnAddPartClick
            end
            object btnEditPart: TButton
              Left = 160
              Top = 6
              Width = 75
              Height = 25
              Caption = '&Edit'
              TabOrder = 3
              OnClick = btnEditPartClick
            end
            object rbActive: TRadioButton
              Left = 10
              Top = 236
              Width = 95
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'Active Only'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
            end
            object rbHistory: TRadioButton
              Left = 105
              Top = 236
              Width = 95
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'History H.Jual'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
            end
            object Button1: TButton
              Left = 328
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Button1'
              TabOrder = 6
              Visible = False
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 424
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Button2'
              TabOrder = 7
              Visible = False
              OnClick = Button2Click
            end
            object AdvStringGrid1: TAdvStringGrid
              Left = 120
              Top = 39
              Width = 553
              Height = 185
              Cursor = crDefault
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
              TabOrder = 8
              Visible = False
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
              FloatFormat = '%.2f'
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
            end
            object btnFilterPart: TButton
              Left = 8
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Filter'
              TabOrder = 9
              OnClick = btnFilterPartClick
            end
            object rbHistoryBeli: TRadioButton
              Left = 200
              Top = 236
              Width = 95
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'History H.Beli'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 10
            end
          end
        end
        object pnlFilter: TPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 120
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label6: TLabel
            Left = 8
            Top = 34
            Width = 27
            Height = 13
            Caption = 'Nama'
          end
          object Label4: TLabel
            Left = 8
            Top = 10
            Width = 24
            Height = 13
            Caption = 'Kode'
          end
          object Bevel1: TBevel
            Left = 1
            Top = 2
            Width = 259
            Height = 111
          end
          object Bevel2: TBevel
            Left = 264
            Top = 2
            Width = 369
            Height = 89
          end
          object Label10: TLabel
            Left = 8
            Top = 58
            Width = 52
            Height = 13
            Caption = 'Kendaraan'
          end
          object GroupBox4: TGroupBox
            Left = 272
            Top = 8
            Width = 345
            Height = 73
            Caption = 'Kriteria Edit Harga'
            TabOrder = 4
            object Label7: TLabel
              Left = 199
              Top = 11
              Width = 136
              Height = 56
              AutoSize = False
              Caption = '*) Harga yg akan berubah hanya harga2 yang muncul pada grid'
              WordWrap = True
            end
            object rbPercent: TRadioButton
              Left = 8
              Top = 16
              Width = 80
              Height = 17
              Caption = 'Persentase'
              TabOrder = 0
            end
            object rbValue: TRadioButton
              Left = 104
              Top = 16
              Width = 80
              Height = 17
              Caption = 'Rupiah'
              TabOrder = 1
            end
            object txtPricePart: TAdvEdit
              Left = 8
              Top = 38
              Width = 110
              Height = 21
              AutoFocus = False
              EditAlign = eaRight
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
              TabOrder = 2
              Text = 'txtPricePart'
              Transparent = False
              Visible = True
              OnKeyDown = txtPricePartKeyDown
            end
            object rbGenerate: TButton
              Left = 120
              Top = 37
              Width = 75
              Height = 25
              Caption = 'Proses!'
              TabOrder = 3
              OnClick = rbGenerateClick
            end
          end
          object btnReset: TButton
            Left = 178
            Top = 84
            Width = 75
            Height = 25
            Caption = '&Reset'
            TabOrder = 3
            OnClick = btnResetClick
          end
          object txtFilterNama: TAdvEdit
            Left = 65
            Top = 34
            Width = 188
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
            TabOrder = 1
            Text = 'txtNama'
            Transparent = False
            Visible = True
            OnKeyDown = txtFilterNamaKeyDown
          end
          object txtFilterKode: TAdvEdit
            Left = 65
            Top = 10
            Width = 188
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
            Text = 'txtKode'
            Transparent = False
            Visible = True
            OnKeyDown = txtFilterKodeKeyDown
          end
          object btnRefreshPart: TButton
            Left = 98
            Top = 84
            Width = 75
            Height = 25
            Caption = '&Refresh'
            TabOrder = 2
            OnClick = btnLoadClick
          end
          object Button3: TButton
            Left = 584
            Top = 48
            Width = 75
            Height = 25
            Caption = 'Edit dari File'
            TabOrder = 5
            Visible = False
            OnClick = Button3Click
          end
          object txtKendaraan: TAdvEdit
            Left = 65
            Top = 57
            Width = 188
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
            TabOrder = 6
            Text = 'txtNama'
            Transparent = False
            Visible = True
          end
        end
      end
      object tbsOli: TTabSheet
        Caption = 'Oli  '
        ImageIndex = 8
        object Panel3: TPanel
          Left = 0
          Top = 95
          Width = 698
          Height = 291
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'Panel1'
          Color = 15921919
          TabOrder = 0
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 696
            Height = 289
            Align = alClient
            BevelOuter = bvLowered
            Caption = 'Panel2'
            Color = clWhite
            TabOrder = 0
            DesignSize = (
              696
              289)
            object asgOli: TAdvStringGrid
              Left = 9
              Top = 39
              Width = 679
              Height = 214
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
              OnGetAlignment = asgOliGetAlignment
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
                311)
              RowHeights = (
                21
                18
                18
                18
                18)
            end
            object btnPrintOil: TButton
              Left = 612
              Top = 260
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Print'
              TabOrder = 1
              OnClick = btnPrintOilClick
            end
            object btnAddOil: TButton
              Left = 84
              Top = 6
              Width = 75
              Height = 25
              Caption = '&New'
              TabOrder = 2
              OnClick = btnAddOilClick
            end
            object btnEditOil: TButton
              Left = 160
              Top = 6
              Width = 75
              Height = 25
              Caption = '&Edit'
              TabOrder = 3
              OnClick = btnEditOilClick
            end
            object rbActiveOil: TRadioButton
              Left = 10
              Top = 261
              Width = 95
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'Active Only'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
            end
            object rbHistoryOil: TRadioButton
              Left = 105
              Top = 261
              Width = 95
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'History H.Jual'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
            end
            object btnOilFilter: TButton
              Left = 8
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Filter'
              TabOrder = 6
              OnClick = btnOilFilterClick
            end
            object rbHistoryBeliOil: TRadioButton
              Left = 200
              Top = 261
              Width = 95
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'History H.Beli'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 7
            end
          end
        end
        object pnlFilterOil: TPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 95
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlFilter'
          TabOrder = 1
          object Label1: TLabel
            Left = 8
            Top = 10
            Width = 24
            Height = 13
            Caption = 'Kode'
          end
          object Label2: TLabel
            Left = 8
            Top = 34
            Width = 27
            Height = 13
            Caption = 'Nama'
          end
          object Bevel3: TBevel
            Left = 1
            Top = 1
            Width = 216
            Height = 89
          end
          object Bevel4: TBevel
            Left = 224
            Top = 1
            Width = 441
            Height = 89
          end
          object txtOilCode: TAdvEdit
            Left = 48
            Top = 10
            Width = 153
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
            Text = 'txtKode'
            Transparent = False
            Visible = True
            OnKeyDown = txtOilCodeKeyDown
          end
          object Button4: TButton
            Left = 128
            Top = 62
            Width = 75
            Height = 25
            Caption = '&Reset'
            TabOrder = 1
            OnClick = btnResetClick
          end
          object GroupBox1: TGroupBox
            Left = 232
            Top = 8
            Width = 345
            Height = 73
            Caption = 'Kriteria Edit Harga Jual'
            TabOrder = 2
            object Label3: TLabel
              Left = 207
              Top = 11
              Width = 136
              Height = 56
              AutoSize = False
              Caption = '*) Harga yg akan berubah hanya harga2 yang muncul pada grid'
              WordWrap = True
            end
            object rbOilPercent: TRadioButton
              Left = 8
              Top = 16
              Width = 80
              Height = 17
              Caption = 'Persentase'
              TabOrder = 0
            end
            object rbOilValue: TRadioButton
              Left = 96
              Top = 16
              Width = 80
              Height = 17
              Caption = 'Rupiah'
              TabOrder = 1
            end
            object txtOilPrice: TAdvEdit
              Left = 8
              Top = 38
              Width = 110
              Height = 21
              AutoFocus = False
              EditAlign = eaRight
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
              TabOrder = 2
              Text = 'txtPricePart'
              Transparent = False
              Visible = True
              OnKeyDown = txtOilPriceKeyDown
            end
            object rbOilPrice: TButton
              Left = 120
              Top = 37
              Width = 75
              Height = 25
              Caption = 'Proses!'
              TabOrder = 3
              OnClick = rbGenerateClick
            end
          end
          object txtOilName: TAdvEdit
            Left = 48
            Top = 34
            Width = 153
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
            OnKeyDown = txtOilNameKeyDown
          end
          object btnRefreshOil: TButton
            Left = 44
            Top = 62
            Width = 75
            Height = 25
            Caption = '&Refresh'
            TabOrder = 4
            OnClick = btnRefreshOilClick
          end
          object Button5: TButton
            Left = 584
            Top = 56
            Width = 75
            Height = 25
            Caption = 'Edit dari File'
            TabOrder = 5
            Visible = False
            OnClick = Button3Click
          end
        end
      end
      object tbsService: TTabSheet
        Caption = 'Service  '
        ImageIndex = 5
        object Panel6: TPanel
          Left = 0
          Top = 95
          Width = 698
          Height = 291
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'Panel1'
          Color = 15921919
          TabOrder = 0
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 696
            Height = 289
            Align = alClient
            BevelOuter = bvLowered
            Caption = 'Panel2'
            Color = clWhite
            TabOrder = 0
            DesignSize = (
              696
              289)
            object asgService: TAdvStringGrid
              Left = 9
              Top = 39
              Width = 679
              Height = 214
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
              OnGetAlignment = asgServiceGetAlignment
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
                311)
              RowHeights = (
                21
                18
                18
                18
                18)
            end
            object btnPrintService: TButton
              Left = 612
              Top = 260
              Width = 75
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = '&Print'
              TabOrder = 1
              OnClick = btnPrintServiceClick
            end
            object btnAddService: TButton
              Left = 84
              Top = 6
              Width = 75
              Height = 25
              Caption = '&New'
              TabOrder = 2
              OnClick = btnAddServiceClick
            end
            object btnEditService: TButton
              Left = 160
              Top = 6
              Width = 75
              Height = 25
              Caption = '&Edit'
              TabOrder = 3
              OnClick = btnEditServiceClick
            end
            object rbActiveService: TRadioButton
              Left = 10
              Top = 261
              Width = 78
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'Active Only'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
            end
            object rbHistoryService: TRadioButton
              Left = 96
              Top = 261
              Width = 78
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'History'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
            end
            object btnServiceFilter: TButton
              Left = 8
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Filter'
              TabOrder = 6
              OnClick = btnServiceFilterClick
            end
          end
        end
        object pnlFilterService: TPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 95
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label5: TLabel
            Left = 8
            Top = 10
            Width = 24
            Height = 13
            Caption = 'Kode'
          end
          object Label8: TLabel
            Left = 8
            Top = 34
            Width = 27
            Height = 13
            Caption = 'Nama'
          end
          object Bevel5: TBevel
            Left = 1
            Top = 1
            Width = 216
            Height = 89
          end
          object Bevel6: TBevel
            Left = 224
            Top = 1
            Width = 369
            Height = 89
          end
          object txtServiceCode: TAdvEdit
            Left = 48
            Top = 10
            Width = 153
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
            Text = 'txtKode'
            Transparent = False
            Visible = True
          end
          object Button7: TButton
            Left = 128
            Top = 62
            Width = 75
            Height = 25
            Caption = '&Reset'
            TabOrder = 1
            OnClick = btnResetClick
          end
          object GroupBox2: TGroupBox
            Left = 232
            Top = 8
            Width = 345
            Height = 73
            Caption = 'Kriteria Edit Harga'
            TabOrder = 2
            object Label9: TLabel
              Left = 207
              Top = 11
              Width = 136
              Height = 56
              AutoSize = False
              Caption = '*) Harga yg akan berubah hanya harga2 yang muncul pada grid'
              WordWrap = True
            end
            object rbServicePercent: TRadioButton
              Left = 8
              Top = 16
              Width = 80
              Height = 17
              Caption = 'Persentase'
              TabOrder = 0
            end
            object rbServiceValue: TRadioButton
              Left = 96
              Top = 16
              Width = 80
              Height = 17
              Caption = 'Rupiah'
              TabOrder = 1
            end
            object txtServicePrice: TAdvEdit
              Left = 8
              Top = 38
              Width = 110
              Height = 21
              AutoFocus = False
              EditAlign = eaRight
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
              TabOrder = 2
              Text = 'txtPricePart'
              Transparent = False
              Visible = True
              OnKeyDown = txtServicePriceKeyDown
            end
            object btnServiceProses: TButton
              Left = 120
              Top = 37
              Width = 75
              Height = 25
              Caption = 'Proses!'
              TabOrder = 3
              OnClick = rbGenerateClick
            end
          end
          object txtServiceName: TAdvEdit
            Left = 48
            Top = 34
            Width = 153
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
          object btnRefreshService: TButton
            Left = 44
            Top = 62
            Width = 75
            Height = 25
            Caption = '&Refresh'
            TabOrder = 4
            OnClick = btnRefreshServiceClick
          end
        end
      end
    end
  end
  object WinXP1: TWinXP
    Left = 448
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
    Left = 32
    Top = 320
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    object HapusData1: TMenuItem
      Caption = 'Hapus Data'
      OnClick = HapusData1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Title = 'Update Price'
    Left = 504
  end
  object OpenDialog1: TOpenDialog
    Title = 'Update Price'
    Left = 480
  end
end
