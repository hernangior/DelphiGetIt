unit uOrderDetailsFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.Layouts, FMX.Objects, System.Generics.Collections;

const

  MaxSubItems = 10;
  FixedRowHeight = 28;
  _AnimationDuration = 0.2;
  FlyButtonWidth = 65;

type

  TBasicVisualOrderItem = class
  private
    fName : string;
    fQty : integer;
    fPrice : Currency;
    fID : integer;
    fParent : TBasicVisualOrderItem;
    fPosition : integer;
  protected
    procedure SetName(const Value: string);
    procedure SetPrice(const Value: Currency);
    procedure SetQty(const Value: integer);

    procedure RefreshVisualInfo(const Item : TBasicVisualOrderItem = nil); virtual; abstract;

    property Position : integer read fPosition write fPosition;
  public
    constructor Create(AParent : TBasicVisualOrderItem); overload; virtual;
    constructor Create(AParent : TBasicVisualOrderItem;
                       const Name : string;
                       const Qty : integer;
                       const Price : Currency); overload; virtual;

    property Name : string read fName write SetName;
    property Qty : integer read fQty write SetQty;
    property Price : Currency read fPrice write SetPrice;
    property ID : integer read fID write fID;
  end;

  TVisualOrderItem = class(TBasicVisualOrderItem)
  private
    fDisplay : TListBoxItem;
    fModifiers : TList<TBasicVisualOrderItem>;
    fOnSizeChanged : TNotifyEvent;

    procedure ReIndexModifiers;
    procedure RecalcHeight;
    procedure ModifiersChanged(Sender: TObject; const Item: TBasicVisualOrderItem; Action: TCollectionNotification);
    procedure SetDisplay(const Value: TListBoxItem);
  protected

    procedure RefreshVisualInfo(const Item : TBasicVisualOrderItem = nil); override;

    property Display : TListBoxItem read fDisplay write SetDisplay;
  public
    constructor Create; overload;
    constructor Create(const Name : string;
                       const Qty : integer;
                       const Price : Currency); overload;
    destructor Destroy; override;
    property Modifiers : TList<TBasicVisualOrderItem> read fModifiers;
    property OnSizeChanged : TNotifyEvent read fOnSizeChanged write fOnSizeChanged;
  end;

  TOrderDetailsFrame = class(TFrame)
    OrderLB: TListBox;
    Rectangle1: TRectangle;
    Text7: TText;
    Text8: TText;
    procedure OrderLBItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    { Private declarations }
    fOrderItems : TList<TVisualOrderItem>;

    procedure ItemsChanged(Sender: TObject; const Item: TVisualOrderItem; Action: TCollectionNotification);
    procedure OnItemHeightChanged(Sender : TObject);
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    property OrderItems : TList<TVisualOrderItem> read fOrderItems;
  end;

implementation

uses System.Rtti, FMX.Ani;

{$R *.fmx}

{ TBasicVisualOrderItem }

constructor TBasicVisualOrderItem.Create(AParent: TBasicVisualOrderItem;
  const Name: string; const Qty: integer; const Price: Currency);
begin
  inherited Create;
  fParent := AParent;
  Self.Name := Name;
  Self.Qty := qty;
  Self.Price := Price;
end;

constructor TBasicVisualOrderItem.Create(AParent: TBasicVisualOrderItem);
begin
  fParent := AParent;
end;

procedure TBasicVisualOrderItem.SetName(const Value: string);
begin
  fName := Value;
  if Assigned(fParent) then
    fParent.RefreshVisualInfo(Self)
  else
    RefreshVisualInfo();
end;

procedure TBasicVisualOrderItem.SetPrice(const Value: Currency);
begin
  fPrice := Value;
  if Assigned(fParent) then
    fParent.RefreshVisualInfo(Self)
  else
    RefreshVisualInfo();
end;

procedure TBasicVisualOrderItem.SetQty(const Value: integer);
begin
  fQty := Value;
  if Assigned(fParent) then
    fParent.RefreshVisualInfo(Self)
  else
    RefreshVisualInfo();
end;

{ TVisualOrderItem }

procedure TVisualOrderItem.RecalcHeight;
var
  lOneItemHeight : single;
  i : integer;
  row : TObject;
begin
  if Assigned(fDisplay) then
  begin
    row := fDisplay.FindStyleResource('Row0');
    if Assigned(row) then
      lOneItemHeight := (row as TLayout).Height
    else
      lOneItemHeight := FixedRowHeight;
    fDisplay.Height := lOneItemHeight * (fModifiers.Count + 1);
    for i := 1 to MaxSubItems  do
      if i <= fModifiers.Count then
        fDisplay.StylesData['SubItem' + i.ToString + '.Opacity'] := TValue.From(1)
      else
        fDisplay.StylesData['SubItem' + i.ToString + '.Opacity'] := TValue.From(0);
    if Assigned(fOnSizeChanged) then
      fOnSizeChanged(Self);
  end;
end;

procedure TVisualOrderItem.RefreshVisualInfo(const Item: TBasicVisualOrderItem);
begin
  if Assigned(fDisplay) then
  begin
    if (Item <> Self) and (Item <> nil) then
    begin
      fDisplay.StylesData['SubItemName' + Item.Position.ToString + '.Text'] := Item.Name;
      fDisplay.StylesData['SubItemQty' + Item.Position.ToString + '.Text'] := ''; //Item.Qty.ToString;
      fDisplay.StylesData['SubItemPrice' + Item.Position.ToString + '.Text'] := Format('%8.2m', [Item.Price]);
    end
    else
    begin
      fDisplay.StylesData['ItemName.Text'] := Name;
      fDisplay.StylesData['ItemQty.Text'] := Qty.ToString;
      fDisplay.StylesData['ItemPrice.Text'] := Format('%8.2m', [Price]);
    end;
  end;
end;

procedure TVisualOrderItem.ReIndexModifiers;
var
  i : integer;
begin
  for i := 0 to fModifiers.Count - 1 do
    fModifiers[i].Position := i + 1;
end;

procedure TVisualOrderItem.SetDisplay(const Value: TListBoxItem);
var
  i : integer;
begin
  fDisplay := Value;
  RefreshVisualInfo();
  for i := 0 to fModifiers.Count - 1 do
    RefreshVisualInfo(fModifiers[i]);
  RecalcHeight;
end;

constructor TVisualOrderItem.Create;
begin
  inherited Create(nil);
  fModifiers := TList<TBasicVisualOrderItem>.Create;
  fModifiers.OnNotify := ModifiersChanged;
end;

constructor TVisualOrderItem.Create(const Name: string; const Qty: integer;
  const Price: Currency);
begin
  inherited Create(nil, Name, Qty, Price);
  fModifiers := TList<TBasicVisualOrderItem>.Create;
  fModifiers.OnNotify := ModifiersChanged;
end;

destructor TVisualOrderItem.Destroy;
begin
  FreeAndNil(fModifiers);
  inherited;
end;

procedure TVisualOrderItem.ModifiersChanged(Sender: TObject;
  const Item: TBasicVisualOrderItem; Action: TCollectionNotification);
begin
  case Action of
    cnAdding: ;
    cnAdded:
          begin
            if fModifiers.Count > MaxSubItems then
            begin
              fModifiers.Remove(Item);
              raise Exception.Create('Maximum modifiers count limit exceeded!');
            end;
            Item.Position := fModifiers.Count;
            RefreshVisualInfo(Item);
            RecalcHeight;
          end;
    cnExtracting: ;
    cnExtracted: ;
    cnDeleting: ;
    cnRemoved:
          begin
            ReIndexModifiers;
            RecalcHeight;
          end;
  end;
end;

{ TOrderDetailsFrame }
constructor TOrderDetailsFrame.Create(AOwner: TComponent);
begin
  inherited;
  fOrderItems := TList<TVisualOrderItem>.Create;
  fOrderItems.OnNotify := ItemsChanged;
end;

destructor TOrderDetailsFrame.Destroy;
begin
  FreeAndNil(fOrderItems);
  inherited;
end;

procedure TOrderDetailsFrame.ItemsChanged(Sender: TObject;
  const Item: TVisualOrderItem; Action: TCollectionNotification);
var
  lItem : TListBoxItem;
begin
  case Action of
    cnAdding: ;
    cnAdded:
        begin
          lItem := TListBoxItem.Create(OrderLB);
          lItem.StyleLookup := 'ListboxItemFlyButtonsStyle';
          lItem.TagObject := Item;
          Item.Display := lItem;
          Item.OnSizeChanged := OnItemHeightChanged;
          OrderLB.AddObject(lItem);
          Item.RecalcHeight;
        end;
    cnExtracting: ;
    cnExtracted: ;
    cnDeleting: ;
    cnRemoved: OrderLB.RemoveObject(Item.fDisplay);
  end;
end;

procedure TOrderDetailsFrame.OnItemHeightChanged(Sender: TObject);
begin
  OrderLB.RealignContent;
end;

procedure TOrderDetailsFrame.OrderLBItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  lButtonAnimation: TFloatAnimation;
  i: Integer;
begin
  if Assigned(Item) then
  begin
    for i:= 0 to Sender.Items.Count - 1 do
    begin
      Sender.ItemByIndex(i).StylesData['LayoutDelButton.Width']:= 0;
      Sender.ItemByIndex(i).StylesData['LayoutHoldBtn.Width']:= 0;
    end;

    lButtonAnimation:= Item.FindStyleResource('lDelButtonAnimation') as  TFloatAnimation;
    if Assigned(lButtonAnimation) then
    begin
      lButtonAnimation.Duration:= _AnimationDuration;
      lButtonAnimation.StartValue:= 0;
      lButtonAnimation.StopValue:= FlyButtonWidth;
      lButtonAnimation.Start;
    end;
    lButtonAnimation:= Item.FindStyleResource('lHoldButtonAnimation') as  TFloatAnimation;
    if Assigned(lButtonAnimation) then
    begin
      lButtonAnimation.Duration:= _AnimationDuration;
      lButtonAnimation.StartValue:= 0;
      lButtonAnimation.StopValue:= FlyButtonWidth;
      lButtonAnimation.Start;
    end;
  end;

end;

end.
