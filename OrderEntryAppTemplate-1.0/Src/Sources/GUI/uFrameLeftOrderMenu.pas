unit uFrameLeftOrderMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Ani, FMX.ListBox, FMX.Layouts, FMX.Objects, FMX.Effects,
  FMX.Controls.Presentation;

const
  ButtonTint = $FF909090;
  LabelHeight = 32;

type
  TFrameLeftOrderMenu = class(TFrame)
    pMenu: TPanel;
    btnMenu: TButton;
    LayoutUserInfo: TLayout;
    ProfilePhotoCircle: TCircle;
    ProfileCircleShadowEffect: TShadowEffect;
    tUserName: TText;
    LineUserInfo: TLine;
    lbMenu: TListBox;
    pMenuWidthAnimation: TFloatAnimation;
    LayoutTabsInfo: TLayout;
    cirOpenTabs: TCircle;
    labOpenTabs: TLabel;
    labTabs: TLabel;
    TabMgmtLbl: TText;
    BackCircle: TCircle;
    BackShadow: TShadowEffect;
    NewOrderItem: TListBoxItem;
    MyTabsItem: TListBoxItem;
    NoSaleItem: TListBoxItem;
    GratuityItem: TListBoxItem;
    ManageChecksItem: TListBoxItem;
    procedure pMenuWidthAnimationFinish(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
  private
    fIsNarrowMenu: Boolean;

    fOnNewOrderItemClick : TNotifyEvent;
    fOnShowMyTabsItemClick : TNotifyEvent;
    fOnNoSaleItemClick : TNotifyEvent;
    fOnGratuityItemClick : TNotifyEvent;
    fOnManageChecksItemClick : TNotifyEvent;

    procedure SetOnNoSaleItemClick(Value : TNotifyEvent);
    procedure SetOnNewOrderItemClick(Value : TNotifyEvent);
    procedure SetOnShowMyTabsItemClick(Value : TNotifyEvent);
    procedure SetOnGratuityItemClick(Value : TNotifyEvent);
    procedure SetOnManageChecksItemClick(Value : TNotifyEvent);
    procedure SetIsNarrowMenu(value : boolean);

    procedure CreateMenu();
//    procedure BuildMenu();
    procedure AnimateMenu;

  public
    public constructor Create(AOwner : TComponent); override;

    property IsNarrowMenu: Boolean read fIsNarrowMenu write SetIsNarrowMenu;

    property OnNewOrderItemClick : TNotifyEvent read fOnNewOrderItemClick write SetOnNewOrderItemClick;
    property OnShowMyTabsItemClick : TNotifyEvent read fOnShowMyTabsItemClick write SetOnShowMyTabsItemClick;
    property OnNoSaleItemClick : TNotifyEvent read fOnNoSaleItemClick write SetOnNoSaleItemClick;
    property OnGratuityItemClick : TNotifyEvent read fOnNoSaleItemClick write SetOnNoSaleItemClick;
    property OnManageChecksItemClick : TNotifyEvent read fOnNoSaleItemClick write SetOnNoSaleItemClick;
  published


  end;

implementation

uses System.Rtti;
{$R *.fmx}

{ TFrameLeftOrderMenu }

procedure TFrameLeftOrderMenu.AnimateMenu;
begin
  pMenuWidthAnimation.Inverse:= not IsNarrowMenu;
  pMenuWidthAnimation.Start;
end;

procedure TFrameLeftOrderMenu.btnMenuClick(Sender: TObject);
begin
  IsNarrowMenu:= not IsNarrowMenu;
  AnimateMenu;
end;

constructor TFrameLeftOrderMenu.Create(AOwner: TComponent);
begin
  inherited;
  CreateMenu;
end;

procedure TFrameLeftOrderMenu.CreateMenu;
var
  lMenuItem: TListBoxItem;
begin
  lMenuItem := NewOrderItem;
  lMenuItem.StylesData['Button.StyleLookUp'] := 'ButtonMenuOrderStyle';
  lMenuItem.StylesData['Button.IconTintColor'] := ButtonTint;

  lMenuItem := MyTabsItem;
  lMenuItem.StylesData['Button.StyleLookUp'] := 'ButtonMenuMyTabsStyle';
  lMenuItem.StylesData['Button.IconTintColor'] := ButtonTint;

  lMenuItem := NoSaleItem;
  lMenuItem.StylesData['Button.StyleLookUp'] := 'ButtonMenuNoSaleStyle';
  lMenuItem.StylesData['Button.IconTintColor'] := ButtonTint;

  lMenuItem := GratuityItem;
  lMenuItem.StylesData['Button.StyleLookUp'] := 'ButtonMenuGratuityStyle';
  lMenuItem.StylesData['Button.IconTintColor'] := ButtonTint;

  lMenuItem := ManageChecksItem;
  lMenuItem.StylesData['Button.StyleLookUp'] := 'ButtonMenuChecksStyle';
  lMenuItem.StylesData['Button.IconTintColor'] := ButtonTint;
end;

procedure TFrameLeftOrderMenu.pMenuWidthAnimationFinish(Sender: TObject);
begin
  LayoutUserInfo.Visible:= not IsNarrowMenu;
  if not IsNarrowMenu then
  begin
    TabMgmtLbl.Height := LabelHeight;
    TabMgmtLbl.Text := Translate('Tabs Management');
  end
  else
    begin
      TabMgmtLbl.Height := LabelHeight * 2;
      TabMgmtLbl.Text := Translate('Tabs Mgmt');
    end;
end;

procedure TFrameLeftOrderMenu.SetIsNarrowMenu(value: boolean);
begin
  fIsNarrowMenu := value;
  AnimateMenu;
end;

procedure TFrameLeftOrderMenu.SetOnGratuityItemClick(Value: TNotifyEvent);
begin
  fOnGratuityItemClick := Value;
  GratuityItem.OnClick := Value;
end;

procedure TFrameLeftOrderMenu.SetOnManageChecksItemClick(Value: TNotifyEvent);
begin
  fOnManageChecksItemClick := Value;
  ManageChecksItem.OnClick := Value;
end;

procedure TFrameLeftOrderMenu.SetOnNewOrderItemClick(Value: TNotifyEvent);
begin
  fOnNewOrderItemClick := Value;
  NewOrderItem.OnClick := Value;
end;

procedure TFrameLeftOrderMenu.SetOnNoSaleItemClick(Value: TNotifyEvent);
begin
  fOnNoSaleItemClick := Value;
  NoSaleItem.OnClick := Value;
end;

procedure TFrameLeftOrderMenu.SetOnShowMyTabsItemClick(Value: TNotifyEvent);
begin
  fOnShowMyTabsItemClick := Value;
  MyTabsItem.OnClick := Value;
end;

end.
