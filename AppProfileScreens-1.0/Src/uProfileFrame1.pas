//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uProfileFrame1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Effects, FMX.Filter.Effects, FMX.Objects,
  FMX.Layouts;

type
  TProfileFrame1 = class(TFrame)
    HeaderLayout: TLayout;
    BackgroundRect: TRectangle;
    GaussianBlurEffect1: TGaussianBlurEffect;
    ProfileLayout: TLayout;
    NameText: TText;
    OutlineCircle: TCircle;
    ImageCircle: TCircle;
    StatsGridPanelLayout: TGridPanelLayout;
    StatsGoalsLayout: TLayout;
    StatsFollowingLayout: TLayout;
    StatsFollowersLayout: TLayout;
    StatsLikesLayout: TLayout;
    GoalsSubtitleText: TText;
    FollowingSubtitleText: TText;
    FollowersSubtitleText: TText;
    LikesSubtitleText: TText;
    GoalsTitleText: TText;
    FollowingTitleText: TText;
    FollowersTitleText: TText;
    LikesTitleText: TText;
    VertScrollBox1: TVertScrollBox;
    HeaderProfileLayout: TLayout;
    HeaderPremiumLayout: TLayout;
    NameLayout: TLayout;
    EmailLayout: TLayout;
    PremiumLayout: TLayout;
    GoalsLayout: TLayout;
    UploadLayout: TLayout;
    NotificationLayout: TLayout;
    Rectangle2: TRectangle;
    HeaderProfileText: TLabel;
    Rectangle3: TRectangle;
    HeaderPremiumLabel: TLabel;
    FormLayout: TLayout;
    NameLabel: TLabel;
    EmailLabel: TLabel;
    PremiumLabel: TLabel;
    PremiumSwitch: TSwitch;
    NotificationLabel: TLabel;
    NotificationSwitch: TSwitch;
    GoalsLabel: TLabel;
    GoalsSwitch: TSwitch;
    UploadLabel: TLabel;
    UploadSwitch: TSwitch;
    DarkTintBackgroundRect: TRectangle;
    UserImage: TImage;
    MailImage: TImage;
    PremiumImage: TImage;
    NotificationImage: TImage;
    GoalsImage: TImage;
    UploadImage: TImage;
    HeaderToolBar: TToolBar;
    NameEditImageBTN: TImage;
    EmailEditImageBTN: TImage;
    CaptureImageBTN: TImage;
    BackImageBTN: TImage;
    FormFooterLayout: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.

