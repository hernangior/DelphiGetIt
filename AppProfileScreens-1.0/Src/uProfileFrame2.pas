//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uProfileFrame2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects, FMX.ListBox,
  FMX.MultiView, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListView, System.ImageList,
  FMX.ImgList, FMX.Effects, FMX.Filter.Effects;

type
  TProfileFrame2 = class(TFrame)
    HeaderLayout: TLayout;
    ActionButtonLayout: TLayout;
    BackgroundRect: TRectangle;
    ProfileCircle: TCircle;
    Circle2: TCircle;
    NameInfoLayout: TLayout;
    TopLayout: TLayout;
    BackButton: TButton;
    MenuButton: TButton;
    ActionGridPanelLayout: TGridPanelLayout;
    LeftGridLayout: TLayout;
    CenterGridLayout: TLayout;
    RightGridLayout: TLayout;
    TextCircleBTN: TCircle;
    CallCircleBTN: TCircle;
    MailCircleBTN: TCircle;
    NameLabel: TLabel;
    ProfileInfoLabel: TLabel;
    CallImage: TImage;
    MailImage: TImage;
    TextImage: TImage;
    StatsGridPanelLayout: TGridPanelLayout;
    ApptLayout: TLayout;
    LastVisitLayout: TLayout;
    DueDateLayout: TLayout;
    ApptTitleLabel: TLabel;
    LastVisitTitleLabel: TLabel;
    DueDateTitleLabel: TLabel;
    ApptSubtitleLabel: TLabel;
    LastVisitSubtitleLabel: TLabel;
    DueDateSubtitleLabel: TLabel;
    DrawerMultiView: TMultiView;
    DashboardLabel: TLabel;
    DashBackgroundRect: TRectangle;
    DashHeaderLayout: TLayout;
    TodaySpeedButton: TSpeedButton;
    YearSpeedButton: TSpeedButton;
    MonthSpeedButton: TSpeedButton;
    WeekSpeedButton: TSpeedButton;
    DashTitleLayout: TLayout;
    DashNameLabel: TLabel;
    DashTitleLabel: TLabel;
    DashGridPanelLayout: TGridPanelLayout;
    MyApptLayout: TLayout;
    MyApptTitleLabel: TLabel;
    MyApptSubtitleLabel: TLabel;
    MyStarsLayout: TLayout;
    MyStarsTitleLabel: TLabel;
    MyStarsSubtitleLabel: TLabel;
    MyTasksLayout: TLayout;
    MyTasksTitleLabel: TLabel;
    MyTasksSubtitleLabel: TLabel;
    MyTasksHeaderLabel: TLabel;
    MyTasksHeaderBackgroundRect: TRectangle;
    HeaderMyTasksLayout: TLayout;
    DashListView: TListView;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    VertScrollBox1: TVertScrollBox;
    HeaderContactLayout: TLayout;
    WorkLayout: TLayout;
    MobileLayout: TLayout;
    HomeLayout: TLayout;
    EmailLayout: TLayout;
    Label28: TLabel;
    EmailTitleLabel: TLabel;
    EmailSubtitleLayout: TLabel;
    HomeTitleLayout: TLabel;
    HomeSubtitleLayout: TLabel;
    MobileTitleLabel: TLabel;
    MobileSubtitleLabel: TLabel;
    WorkTitleLabel: TLabel;
    WorkSubtitleLabel: TLabel;
    Rectangle4: TRectangle;
    BackImage: TImage;
    MenuImage: TImage;
    DashFilterGridPanelLayout: TGridPanelLayout;
    TodayLayout: TLayout;
    WeekLayout: TLayout;
    MonthLayout: TLayout;
    YearLayout: TLayout;
    procedure VertScrollBox1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TProfileFrame2.VertScrollBox1Resize(Sender: TObject);
begin
DrawerMultiView.Width := VertScrollBox1.Width-(VertScrollBox1.Width/6);
end;

end.
