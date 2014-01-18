object frmItemEditPrice: TfrmItemEditPrice
  Left = 276
  Top = 237
  BorderStyle = bsDialog
  Caption = 'frmItemEditPrice'
  ClientHeight = 282
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    308
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 8
    Top = 11
    Width = 291
    Height = 231
    Anchors = [akLeft, akTop, akRight]
  end
  object Kode: TLabel
    Left = 17
    Top = 33
    Width = 25
    Height = 13
    Caption = 'Kode'
  end
  object TLabel
    Left = 17
    Top = 61
    Width = 28
    Height = 13
    Caption = 'Nama'
  end
  object TLabel
    Left = 17
    Top = 183
    Width = 55
    Height = 13
    Caption = 'Keterangan'
  end
  object TLabel
    Left = 17
    Top = 86
    Width = 34
    Height = 13
    Caption = 'Satuan'
  end
  object TLabel
    Left = 17
    Top = 161
    Width = 46
    Height = 13
    Caption = 'Limit Stok'
  end
  object TLabel
    Left = 17
    Top = 137
    Width = 30
    Height = 13
    Caption = 'H.Jual'
  end
  object TLabel
    Left = 17
    Top = 111
    Width = 28
    Height = 13
    Caption = 'H.Beli'
  end
  object txtKode: TAdvEdit
    Left = 77
    Top = 33
    Width = 124
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
    MaxLength = 15
    OleDropTarget = False
    OleDropSource = False
    Signed = False
    TabOrder = 0
    Text = 'ABCDEFGHIJKLMNOP'
    Transparent = False
    Visible = True
  end
  object txtNama: TAdvEdit
    Left = 77
    Top = 58
    Width = 213
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
  object mmNotes: TMemo
    Left = 77
    Top = 184
    Width = 213
    Height = 45
    Lines.Strings = (
      'Memo1'
      'Memo1'
      'Memo1')
    TabOrder = 6
    WantReturns = False
    OnKeyDown = mmNotesKeyDown
  end
  object btnSave: TButton
    Left = 143
    Top = 247
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Save'
    TabOrder = 7
    OnClick = btnSaveClick
  end
  object btnBatal: TButton
    Left = 223
    Top = 247
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 8
    OnClick = btnBatalClick
  end
  object sttInfo: TStaticText
    Left = 16
    Top = 4
    Width = 113
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = 'Master Item'
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
  object txtSatuan: TAdvEdit
    Left = 77
    Top = 84
    Width = 97
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
    Color = clWhite
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HintShowLargeText = False
    ParentFont = False
    OleDropTarget = False
    OleDropSource = False
    Signed = False
    TabOrder = 2
    Text = 'txtSatuan'
    Transparent = False
    Visible = True
  end
  object txtLimit: TAdvEdit
    Left = 77
    Top = 158
    Width = 41
    Height = 21
    AutoFocus = False
    EditAlign = eaLeft
    EditType = etNumeric
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
    Color = clWhite
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HintShowLargeText = False
    ParentFont = False
    OleDropTarget = False
    OleDropSource = False
    Signed = False
    TabOrder = 5
    Text = '0'
    Transparent = False
    Visible = True
  end
  object chkEdit: TCheckBox
    Left = 206
    Top = 38
    Width = 79
    Height = 17
    Caption = 'Edit Kode'
    TabOrder = 10
    Visible = False
  end
  object txtPrice: TAdvEdit
    Left = 77
    Top = 134
    Width = 97
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
    Color = clWhite
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HintShowLargeText = False
    ParentFont = False
    OleDropTarget = False
    OleDropSource = False
    Signed = False
    TabOrder = 4
    Text = '0'
    Transparent = False
    Visible = True
  end
  object txtPricePurchase: TAdvEdit
    Left = 77
    Top = 109
    Width = 97
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
    Color = clWhite
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
  end
end
