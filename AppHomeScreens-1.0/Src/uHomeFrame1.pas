//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uHomeFrame1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.TabControl, System.ImageList, FMX.ImgList,
  FMX.Controls.Presentation, FMX.Objects, FMX.Effects, FMX.Filter.Effects;

type
  THomeFrame1 = class(TFrame)
    TabControl1: TTabControl;
    HomeTab: TTabItem;
    ActivityTab: TTabItem;
    CalenderTab: TTabItem;
    NutritionTab: TTabItem;
    MenuGridPanelLayout: TGridPanelLayout;
    HeaderLayout: TLayout;
    VertScrollBox1: TVertScrollBox;
    MenuLayout1: TLayout;
    MenuLayout2: TLayout;
    MenuLayout3: TLayout;
    MenuLayout4: TLayout;
    MenuLayout5: TLayout;
    MenuLayout6: TLayout;
    HeaderText: TText;
    CheckInLayout: TLayout;
    CheckInImage: TImage;
    CheckInLabel: TLabel;
    ClassLayout: TLayout;
    ClassImage: TImage;
    ClassLabel: TLabel;
    TrainingLayout: TLayout;
    TrainingImage: TImage;
    TrainingLabel: TLabel;
    SearchLayout: TLayout;
    SearchImage: TImage;
    SearchLabel: TLabel;
    ClubsLayout: TLayout;
    ClubsImage: TImage;
    ClubsLabel: TLabel;
    InviteLayout: TLayout;
    InviteImage: TImage;
    InviteLabel: TLabel;
    BackgroundRect: TRectangle;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    FillRGBEffect4: TFillRGBEffect;
    FillRGBEffect5: TFillRGBEffect;
    FillRGBEffect6: TFillRGBEffect;
    UpperLeftRect: TRectangle;
    UpperVertRect: TRectangle;
    LowerLeftRect: TRectangle;
    MiddleVertRect: TRectangle;
    LowerRightRect: TRectangle;
    LowerVertRect: TRectangle;
    UpperRightRect: TRectangle;
    BackgroundImage: TImage;
    CheckInRectBTN: TRectangle;
    ClassRectBTN: TRectangle;
    TrainingRectBTN: TRectangle;
    SearchRectBTN: TRectangle;
    ClubsRectBTN: TRectangle;
    InviteRectBTN: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
