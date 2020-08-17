//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uHomeFrame3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.MultiView;

type
  THomeFrame3 = class(TFrame)
    VertScrollBox1: TVertScrollBox;
    HeaderToolBar: TToolBar;
    HeaderBackgroundRect: TRectangle;
    StepsLayout: TLayout;
    StepsBackgroundRect: TRectangle;
    StepsImage: TImage;
    StepsBodyLayout: TLayout;
    StepsLabel: TLabel;
    SleepLayout: TLayout;
    SleepBackgroundRect: TRectangle;
    SleepBodyLayout: TLayout;
    SleepImage: TImage;
    SleepLabel: TLabel;
    NutritionLayout: TLayout;
    NutitionBackgrounRect: TRectangle;
    NutritionBodyLayout: TLayout;
    NutritionImage: TImage;
    NutritionLabel: TLabel;
    HydrationLayout: TLayout;
    HydrationBackgroundRect: TRectangle;
    HydrationBodyLayout: TLayout;
    HydrationImage: TImage;
    HydrationLabel: TLabel;
    CaloriesLayout: TLayout;
    CaloriesBackgroundRect: TRectangle;
    CaloriesBodyLayout: TLayout;
    CaloriesImage: TImage;
    CaloriesLabel: TLabel;
    HeartRateLayout: TLayout;
    HeartRateBackgroundRect: TRectangle;
    HeartRateBodyLayout: TLayout;
    HeartRateImage: TImage;
    HeartRateLabel: TLabel;
    BackgroundRect: TRectangle;
    MenuButtonCircle: TCircle;
    DrawerMultiView: TMultiView;
    NavigateButton: TButton;
    NavigateImage: TImage;
    Circle2: TCircle;
    Text1: TText;
    MenuBackgroundRect: TRectangle;
    Rectangle10: TRectangle;
    Layout13: TLayout;
    StepsBackgroundImageBTN: TImage;
    HydrationBackgroundImageBTN: TImage;
    NutritionBackgroundImageBTN: TImage;
    SleepBackgroundImageBTN: TImage;
    CaloriesBackgroundImageBTN: TImage;
    HeartRateBackgroundImageBTN: TImage;
    MenuButton: TButton;
    MenuImage: TImage;
    procedure VertScrollBox1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure THomeFrame3.VertScrollBox1Resize(Sender: TObject);
begin
DrawerMultiView.Width := VertScrollBox1.Width-(VertScrollBox1.Width/6);
end;

end.
