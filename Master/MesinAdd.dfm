object frmMesinAdd: TfrmMesinAdd
  Left = 211
  Top = 150
  BorderStyle = bsDialog
  Caption = 'frmMesinAdd'
  ClientHeight = 169
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    288
    169)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 7
    Top = 9
    Width = 274
    Height = 114
    Anchors = [akLeft, akTop, akRight]
  end
  object TLabel
    Left = 16
    Top = 90
    Width = 21
    Height = 13
    Caption = 'Tipe'
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
    Left = 118
    Top = 134
    Width = 75
    Height = 25
    Caption = '&Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnBatal: TButton
    Left = 198
    Top = 134
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnBatalClick
  end
  object txtKategori: TAdvEdit
    Left = 68
    Top = 89
    Width = 205
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
    Text = '0'
    Transparent = False
    Visible = True
  end
  object txtNama: TAdvEdit
    Left = 69
    Top = 61
    Width = 205
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
    Width = 148
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
    LengthLimit = 50
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
    MaxLength = 50
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
    Width = 153
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Master Mesin / Kategori'
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
