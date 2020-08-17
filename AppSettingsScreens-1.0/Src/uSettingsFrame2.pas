//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSettingsFrame2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects;

type
  TSettingsFrame2 = class(TFrame)
    HeaderToolBar: TToolBar;
    VertScrollBox1: TVertScrollBox;
    BackButton: TButton;
    BackgroundRect: TRectangle;
    HeaderGeneralLayout: TLayout;
    GeneralBackgroundRect: TRectangle;
    GeneralLabel: TLabel;
    HeaderBackgroundRect: TRectangle;
    AutoAdjustLayout: TLayout;
    AutoAdjustLabel: TLabel;
    AutoAdjustSwitch: TSwitch;
    AutoBackgroundRect: TRectangle;
    FilterLayout: TLayout;
    FilterBackgroundRect: TRectangle;
    BlueLightLabel: TLabel;
    FilterSwitch: TSwitch;
    HeaderDisplayLayout: TLayout;
    DisplayBackgroundRect: TRectangle;
    DisplayLabel: TLabel;
    BrightnessLayout: TLayout;
    BrightnessBackgroundRect: TRectangle;
    BrightnessLabel: TLabel;
    ContrastLayout: TLayout;
    ContrastBackgroundRect: TRectangle;
    ContrastLabel: TLabel;
    HeaderSystemLayout: TLayout;
    SystemBackgroundRect: TRectangle;
    SystemLabel: TLabel;
    HeaderBatteryLayout: TLayout;
    BatteryBackgroundRect: TRectangle;
    BatteryLabel: TLabel;
    TimeoutLayout: TLayout;
    TimeoutBackgroundRect: TRectangle;
    TimeoutLabel: TLabel;
    TimeoutSwitch: TSwitch;
    ScreenLayout: TLayout;
    ScreenBackgroundRect: TRectangle;
    ScreenLabel: TLabel;
    ScreenSwitch: TSwitch;
    StatusLayout: TLayout;
    StatusBackgroundRect: TRectangle;
    StatusLabel: TLabel;
    PowerLayout: TLayout;
    PowerBackgroundRect: TRectangle;
    PowerSaveLabel: TLabel;
    BrightnessTrackBar: TTrackBar;
    ContrastTrackBar: TTrackBar;
    StatusBarCheckBox: TCheckBox;
    HeaderLabel: TLabel;
    RadioGroupGridPanelLayout: TGridPanelLayout;
    RGNoneLayout: TLayout;
    LowLabel: TLabel;
    RadioButton1: TRadioButton;
    RGLine1Layout: TLayout;
    RGLine1: TLine;
    RGLowLayout: TLayout;
    MediumLabel: TLabel;
    RadioButton2: TRadioButton;
    RGLine2Layout: TLayout;
    RGLine2: TLine;
    RGMediumLayout: TLayout;
    HighLabel: TLabel;
    RadioButton3: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
