//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uProfileFrame3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Filter.Effects, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation, FMX.MultiView;

type
  TProfileFrame3 = class(TFrame)
    HeaderLayout: TLayout;
    BackgroundRect: TRectangle;
    NavBarLayout: TLayout;
    NavGridPanelLayout: TGridPanelLayout;
    LeftGridLayout: TLayout;
    EditImage: TImage;
    CenterGridLayout: TLayout;
    FundsImage: TImage;
    RightGridLayout: TLayout;
    InviteImage: TImage;
    HeadeBarLayout: TLayout;
    EditLabel: TLabel;
    AddFundsLabel: TLabel;
    InviteLabel: TLabel;
    CenterProfileLayout: TLayout;
    ProfileNameLabel: TLabel;
    ProfileImage: TImage;
    VertScrollBox1: TVertScrollBox;
    MobileLayout: TLayout;
    PhoneBackgroundRect: TRectangle;
    PhoneBodyLayout: TLayout;
    PhoneTextLayout: TLayout;
    PhoneButtonLayout: TLayout;
    PhoneTitleLabel: TLabel;
    PhoneSubtitleLabel: TLabel;
    PhoneCallImage: TImage;
    PhoneLeftTextLine: TLine;
    PhoneTextImage: TImage;
    PhoneLeftCallLine: TLine;
    WorkLayout: TLayout;
    WorkBackgroundRect: TRectangle;
    WorkBodyLayout: TLayout;
    WorkTextLayout: TLayout;
    WorkTitleLabel: TLabel;
    WorkSubtitleLabel: TLabel;
    WorkButtonLayout: TLayout;
    WorkCallImage: TImage;
    WorkLeftCallLine: TLine;
    HomeLayout: TLayout;
    HomeBackgroundRect: TRectangle;
    HomeBodyLayout: TLayout;
    HomeTextLayout: TLayout;
    HomeTitleLabel: TLabel;
    HomeSubtitleLabel: TLabel;
    HomeButtonLayout: TLayout;
    HomeCallImage: TImage;
    HomeLeftCallLine: TLine;
    PremiumUserImage: TImage;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    FillRGBEffect4: TFillRGBEffect;
    FillRGBEffect5: TFillRGBEffect;
    TitleLabel: TLabel;
    DrawerMultiView: TMultiView;
    LogoImage: TImage;
    FillRGBEffect6: TFillRGBEffect;
    HeaderToolBar: TToolBar;
    BackButton: TButton;
    BackImage: TImage;
    MenuButton: TButton;
    MenuImage: TImage;
    FillRGBEffect7: TFillRGBEffect;
    FillRGBEffect8: TFillRGBEffect;
    procedure VertScrollBox1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TProfileFrame3.VertScrollBox1Resize(Sender: TObject);
begin
DrawerMultiView.Width := VertScrollBox1.Width-(VertScrollBox1.Width/6);
end;

end.
