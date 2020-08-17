//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSettingsFrame3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Filter.Effects, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation;

type
  TSettingsFrame3 = class(TFrame)
    BackgroundRect: TRectangle;
    HeaderToolBar: TToolBar;
    HeaderBackgroundRect: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Header1Layout: TLayout;
    Header1BackgroundRect: TRectangle;
    EmailLayout: TLayout;
    EmailLabel: TLabel;
    EmailImage: TImage;
    FillRGBEffect1: TFillRGBEffect;
    PrivacyLayout: TLayout;
    PrivacyLabel: TLabel;
    PrivacySwitch: TSwitch;
    PrivacyImage: TImage;
    FillRGBEffect2: TFillRGBEffect;
    Header2Layout: TLayout;
    Header2BackgroundRect: TRectangle;
    BrightnessLayout: TLayout;
    BrightnessImage: TImage;
    FillRGBEffect3: TFillRGBEffect;
    Header3Layout: TLayout;
    Header3BackgroundRect: TRectangle;
    CloudLayout: TLayout;
    CloudLabel: TLabel;
    CloudSwitch: TSwitch;
    CloudImage: TImage;
    FillRGBEffect4: TFillRGBEffect;
    EditModeLayout: TLayout;
    EditModeLabel: TLabel;
    EditModeImage: TImage;
    FillRGBEffect5: TFillRGBEffect;
    ChatLayout: TLayout;
    ChatLabel: TLabel;
    ChatImage: TImage;
    FillRGBEffect6: TFillRGBEffect;
    PremiumLayout: TLayout;
    PremiumLabel: TLabel;
    PremiumSwitch: TSwitch;
    PremiumImage: TImage;
    FillRGBEffect7: TFillRGBEffect;
    EmailButton: TButton;
    EditModeButton: TButton;
    ChatButton: TButton;
    EditModeColorLabel: TLabel;
    ChatColorLabel: TLabel;
    PaymentLayout: TLayout;
    PaymentLabel: TLabel;
    PaymentSwitch: TSwitch;
    PaymentImage: TImage;
    FillRGBEffect8: TFillRGBEffect;
    DoneButton: TButton;
    RadioGroupGridPanelLayout: TGridPanelLayout;
    RGNoneLayout: TLayout;
    NoneLabel: TLabel;
    RGLine1Layout: TLayout;
    RGLine1: TLine;
    RGLowLayout: TLayout;
    LowLabel: TLabel;
    RGLine2Layout: TLayout;
    RGLine2: TLine;
    RGMediumLayout: TLayout;
    MediumLabel: TLabel;
    RGLine3Layout: TLayout;
    RGLine3: TLine;
    RGHighLayout: TLayout;
    HighLabel: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Header4Layout: TLayout;
    Header4BackroundRect: TRectangle;
    BackgroundImage: TImage;
    HeaderLabel: TLabel;
    procedure VertScrollBox1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TSettingsFrame3.VertScrollBox1Resize(Sender: TObject);
begin
{$IF DEFINED(MSWINDOWS) OR (DEFINED(MACOS) AND NOT DEFINED(IOS))}
if DoneButton.Margins.Top=0 then
 begin
   DoneButton.Margins.Top := 5;
   DoneButton.Margins.Bottom := 5;
   DoneButton.Margins.Left := 5;
   DoneButton.Margins.Right := 5;
 end;
{$ENDIF}
end;

end.
