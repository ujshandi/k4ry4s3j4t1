object frmServiceAdd: TfrmServiceAdd
  Left = 338
  Top = 240
  BorderStyle = bsDialog
  Caption = 'frmServiceAdd'
  ClientHeight = 169
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    493
    169)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 7
    Top = 9
    Width = 479
    Height = 114
    Anchors = [akLeft, akTop, akRight]
  end
  object TLabel
    Left = 16
    Top = 90
    Width = 26
    Height = 13
    Caption = 'Biaya'
  end
  object TLabel
    Left = 16
    Top = 63
    Width = 28
    Height = 13
    Caption = 'Nama'
  end
  object Label1: TLabel
    Left = 16
    Top = 35
    Width = 25
    Height = 13
    Caption = 'Kode'
  end
  object btnSave: TButton
    Left = 326
    Top = 134
    Width = 75
    Height = 25
    Caption = '&Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnBatal: TButton
    Left = 406
    Top = 134
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnBatalClick
  end
  object txtPrice: TAdvEdit
    Left = 68
    Top = 89
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
    TabOrder = 2
    Text = '0'
    Transparent = False
    Visible = True
  end
  object txtNama: TAdvEdit
    Left = 69
    Top = 61
    Width = 404
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
  end
  object txtKode: TAdvEdit
    Left = 69
    Top = 33
    Width = 73
    Height = 21
    AutoFocus = False
    EditAlign = eaLeft
    EditType = etUppercase
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
  object StaticText1: TStaticText
    Left = 16
    Top = 4
    Width = 318
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Master Service'
    Color = 15658719
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
  end
end
