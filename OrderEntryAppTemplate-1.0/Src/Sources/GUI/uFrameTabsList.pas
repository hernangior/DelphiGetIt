unit uFrameTabsList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Objects, Generics.Collections;

type

  TOrderType = (otRestaurant, otRemote);
  TTabsItem = class
  private
    fOrderType : TOrderType;
    fCustomerName : string;
    fAmount : Currency;
    fDate : TDateTime;
    fOrderNumber : integer;

  public

    constructor Create(const CustomerName : string; const Amount : Currency;
                          const aDate : TDateTime; const OrderNumber : integer;
                          const OrderType : TOrderType);

    property OrderType : TOrderType read fOrderType write fOrderType;
    property CustomerName : string read fCustomerName write fCustomerName;
    property Amount : Currency read fAmount write fAmount;
    property Date : TDateTime read fDate write fDate;
    property OrderNumber : integer read fOrderNumber write fOrderNumber;
  end;

  TOrderingType = (otAZ, otZA, otNewest, otOldest);

  TFrameTabsList = class(TFrame)
    LayoutMainInfo: TLayout;
    TopButtonsLayout: TLayout;
    ButtonsGPL: TGridPanelLayout;
    btnNewest: TSpeedButton;
    btnOldest: TSpeedButton;
    btnAZ: TSpeedButton;
    btnZA: TSpeedButton;
    Tabslb: TListBox;
    procedure TabslbCompare(Item1, Item2: TListBoxItem; var Result: Integer);
    procedure btnOrderingClick(Sender: TObject);
  private
    { Private declarations }
    fMyTabs : TList<TTabsItem>;
    fOrdering : TOrderingType;
    fOnTabClick : TNotifyEvent;

    procedure DoTableClick(Sender : TObject);

  public
    { Public declarations }

    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure Clear;

    procedure AddListItem(const Item : TTabsItem);

    property OnTabClick : TNotifyEvent read fOnTabClick write fOnTabClick;
  end;

implementation

{$R *.fmx}

{ TFrameTabsList }

procedure TFrameTabsList.AddListItem(const Item : TTabsItem);
var
  LItem : TListBoxItem;
begin
  LItem := TListBoxItem.Create(Tabslb);
  case Item.OrderType of
    otRestaurant: LItem.StyleLookup := 'TabsListboxItemRestaurantStyle';
    otRemote: LItem.StyleLookup := 'TabsListboxItemTabletStyle';
  end;
  LItem.StylesData['Amount.Text'] := Format('%8.2m', [Item.Amount]);
  LItem.StylesData['DateTime.Text'] := DateTimeToStr(Item.Date);
  LItem.StylesData['OrderNumber.Text'] := '#' + Item.OrderNumber.ToString;
  LItem.Text := Item.CustomerName;
  LItem.TagObject := Item;
  LItem.OnClick := DoTableClick;
  fMyTabs.Add(Item);
  Tabslb.AddObject(LItem);
end;

procedure TFrameTabsList.btnOrderingClick(Sender: TObject);
var
  btn : TFmxObject;
begin
  btn := Sender as TFmxObject;
  fOrdering := TOrderingType(btn.Tag);
  Tabslb.ClearSelection;
  Tabslb.Sorted := false;
  Tabslb.Sorted := true;
end;

procedure TFrameTabsList.Clear;
begin
  Tabslb.Clear;
end;

constructor TFrameTabsList.Create(AOwner: TComponent);
begin
  inherited;
  fMyTabs := TList<TTabsItem>.Create;
  fOrdering := otNewest;
end;

destructor TFrameTabsList.Destroy;
begin
  fMyTabs.Clear;
  FreeAndNil(fMyTabs);
  inherited;
end;

procedure TFrameTabsList.DoTableClick(Sender: TObject);
begin
  if Assigned(fOnTabClick) then
    fOnTabClick(TFmxObject(Sender).TagObject);
end;

procedure TFrameTabsList.TabslbCompare(Item1, Item2: TListBoxItem;
  var Result: Integer);
var
  itm1, itm2 : TTabsItem;
begin
  itm1 := TTabsItem(Item1.TagObject);
  itm2 := TTabsItem(Item2.TagObject);
  case fOrdering of
    otAZ: Result := CompareText(itm1.CustomerName, itm2.CustomerName);
    otZA: Result := -CompareText(itm1.CustomerName, itm2.CustomerName);
    otNewest: Result := -round((itm1.Date - itm2.Date) * 10000);
    otOldest: Result := round((itm1.Date - itm2.Date) * 10000);
  end;
end;

{ TTabsItem }

constructor TTabsItem.Create(const CustomerName: string; const Amount: Currency;
  const aDate: TDateTime; const OrderNumber: integer;
  const OrderType: TOrderType);
begin
  inherited Create;
  fOrderType := OrderType;
  fCustomerName := CustomerName;
  fAmount := Amount;
  fDate := aDate;
  fOrderNumber := OrderNumber;
end;

end.
