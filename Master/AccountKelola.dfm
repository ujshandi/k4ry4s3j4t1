object frmAccountKelola: TfrmAccountKelola
  Left = 241
  Top = 235
  Width = 725
  Height = 480
  Caption = 'Kelola Account'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlFilter: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 76
      Align = alTop
      TabOrder = 0
      DesignSize = (
        717
        76)
      object TBevel
        Left = 6
        Top = 5
        Width = 704
        Height = 64
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
      object TBevel
        Left = 11
        Top = 24
        Width = 162
        Height = 39
      end
      object cmbTipe: TComboBox
        Left = 17
        Top = 36
        Width = 150
        Height = 21
        BevelKind = bkFlat
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object l: TStaticText
        Left = 22
        Top = 14
        Width = 135
        Height = 15
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        BevelOuter = bvNone
        BorderStyle = sbsSingle
        Caption = 'Type Of Account'
        Color = 15658719
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object btnReset: TButton
        Left = 266
        Top = 40
        Width = 75
        Height = 25
        Caption = '&Reset'
        TabOrder = 2
        OnClick = btnResetClick
      end
    end
    object TPanel
      Left = 0
      Top = 76
      Width = 717
      Height = 370
      Align = alClient
      TabOrder = 1
      DesignSize = (
        717
        370)
      object Bevel1: TBevel
        Left = 5
        Top = 40
        Width = 703
        Height = 289
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
      object asgAccount: TAdvStringGrid
        Left = 11
        Top = 46
        Width = 691
        Height = 277
        Cursor = crDefault
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 10
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        TabOrder = 0
        GridLineColor = clSilver
        ActiveCellShow = False
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = clGray
        Bands.Active = True
        Bands.PrimaryColor = 15658719
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
        OnGetAlignment = asgAccountGetAlignment
        DragDropSettings.OleAcceptFiles = True
        DragDropSettings.OleAcceptText = True
        SortSettings.AutoColumnMerge = False
        SortSettings.Column = 1
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
        HintColor = 15658719
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
        FixedColWidth = 33
        FixedRowHeight = 21
        FixedRowAlways = True
        FixedColAlways = True
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        FixedAsButtons = False
        FloatFormat = '%.2f'
        IntegralHeight = False
        WordWrap = False
        ColumnHeaders.Strings = (
          'No     '
          'Kode ')
        Lookup = False
        LookupCaseSensitive = False
        LookupHistory = False
        BackGround.Top = 0
        BackGround.Left = 0
        BackGround.Display = bdTile
        BackGround.Cells = bcNormal
        Filter = <>
        ColWidths = (
          33
          64
          64
          90
          74
          85
          79
          64
          64
          64)
      end
      object btnFilter: TButton
        Left = 267
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Show &Filter'
        TabOrder = 1
        Visible = False
        OnClick = btnFilterClick
      end
      object btnAdd: TButton
        Left = 11
        Top = 8
        Width = 75
        Height = 25
        Caption = '&New'
        TabOrder = 2
        OnClick = btnAddClick
      end
      object btnEdit: TButton
        Left = 91
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 3
        OnClick = btnEditClick
      end
      object btnPrint: TButton
        Left = 630
        Top = 337
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Print'
        TabOrder = 4
        OnClick = btnPrintClick
      end
      object btnOK: TButton
        Left = 170
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Refresh'
        TabOrder = 5
        OnClick = btnOKClick
      end
    end
  end
  object WinXP1: TWinXP
    Left = 352
    Top = 224
  end
end
