unit uDataClasses;

interface

uses Generics.Collections, System.SysUtils, System.UITypes;

type

  TModifierCollection = class;

  TBaseDataObject = class
  private
    fID : integer;
    fName : string;

  protected
    procedure SetID(const Value: integer); virtual;
    procedure SetName(const Value: string); virtual;

  public
    procedure Assign(Source : TBaseDataObject); virtual;

    property ID : integer read fID write SetID;
    property Name : string read fName write SetName;
  end;

  TCustomer = class(TBaseDataObject)
  private
    fPhoneNumber : string;

  protected
    procedure SetPhoneNumber(const Value: string); virtual;

  public

    property PhoneNumber : string read fPhoneNumber write SetPhoneNumber;
  end;

  TUserRoles = (urUser, urManager, urAdmin);
  TUser = class(TBaseDataObject)
  private
    fRole : TUserRoles;
    fPIN : string;
    fPicture : pointer;
    fPicSize : integer;

  protected
    procedure SetPicSize(const Value: integer); virtual;
    procedure SetPicure(const Value: pointer); virtual;
    procedure SetPIN(const Value: string); virtual;
    procedure SetRole(const Value: TUserRoles); virtual;

  public
    destructor Destroy; override;

    property Role : TUserRoles read fRole write SetRole;
    property PIN : string read fPIN write SetPIN;
    property Picture : pointer read fPicture write SetPicure;
    property PicSize : integer read fPicSize write SetPicSize;
  end;

  TCategory = class(TBaseDataObject)

  end;

  TModifierType = (mtTopping, mtSides);

  TModifier = class(TBaseDataObject)
  private
    fCost : Currency;
    fType : TModifierType;

  protected
    procedure SetCost(const Value: Currency); virtual;
    procedure SetType(const Value: TModifierType); virtual;

  public
    procedure Assign(Source : TBaseDataObject); override;

    property &Type : TModifierType read fType write SetType;
    property Cost : Currency read fCost write SetCost;
  end;

  TDish = class(TModifier)
  private
    fModifiers : TModifierCollection;
    fColor : TAlphaColor;
    fCategory : integer;
    function GetCanModify: boolean;

  protected
    procedure SetColor(const Value: TAlphaColor); virtual;
    procedure SetCategory(const Value: integer);

  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source : TBaseDataObject); override;

    function IsEqual(const aDish : TDish): boolean;
    function Copy: TDish;

    property Modifiers : TModifierCollection read fModifiers;
    property Color : TAlphaColor read fColor write SetColor;
    property Category : integer read fCategory write SetCategory;
    property CanModify : boolean read GetCanModify;
  end;

  TRoom = class(TBaseDataObject)
  private
    fWidth : integer;
    fHeight : integer;

  protected
    procedure SetHeight(const Value: integer); virtual;
    procedure SetWidth(const Value: integer); virtual;

  public
    property Width : integer read fWidth write SetWidth;
    property Height : integer read fHeight write SetHeight;
  end;

  TOrderItem = class(TBaseDataObject)
  private
    fDish : TDish;
    fQty : integer;

  protected
    procedure SetDish(const Value: TDish); virtual;
    procedure SetQty(const Value: integer); virtual;

  public
    procedure Assign(Source : TBaseDataObject); override;

    property Dish : TDish read fDish write SetDish;
    property Qty : integer read fQty write SetQty;
  end;

  TOrder = class(TBaseDataObject)
  private
    fItems : TList<TOrderItem>;
    fTableNumber : integer;
    fGuests : integer;
    fCustomerName : string;
    fDate : TDateTime;
    fAccepted : boolean;
    fPaid : boolean;

    function GetAmount: Currency;
    function GetIsEmpty: boolean;

  protected
    procedure SetCustomerName(const Value: string); virtual;
    procedure SetGuests(const Value: integer); virtual;
    procedure SetTableNumber(const Value: integer); virtual;
    procedure SetDate(const Value: TDateTime); virtual;
    procedure SetAccepted(const Value: boolean); virtual;
    procedure SetPaid(const Value: boolean);

  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Assign(Source : TBaseDataObject); override;
    function AddItem(const Item : TDish): boolean; //true - new item, false - update existing

    property Items : TList<TOrderItem> read fItems;
    property Amount : Currency read GetAmount;
    property IsEmpty : boolean read GetIsEmpty;
    property TableNumber : integer read fTableNumber write SetTableNumber;
    property Guests : integer read fGuests write SetGuests;
    property CustomerName : string read fCustomerName write SetCustomerName;
    property Date : TDateTime read fDate write SetDate;
    property Accepted : boolean read fAccepted write SetAccepted;
    property Paid : boolean read fPaid write SetPaid;
  end;

  TTableObject = class(TBaseDataObject)
  private
    fColumn : integer;
    fRow : integer;
    fRoom : integer;
    fOrientation : integer;
    fSize : integer;
    fType : integer;
    fNumber : integer;

  protected
    procedure SetNumber(const Value: integer); virtual;
    procedure SetOrientation(const Value: integer); virtual;
    procedure SetRoom(const Value: integer); virtual;
    procedure SetSize(const Value: integer); virtual;
    procedure SetType(const Value: integer); virtual;
    procedure SetColumn(const Value: integer); virtual;
    procedure SetRow(const Value: integer); virtual;

  public
    property Number : integer read fNumber write SetNumber;
    property Room : integer read fRoom write SetRoom;
    property Orientation : integer read fOrientation write SetOrientation;
    property Size : integer read fSize write SetSize;
    property &Type : integer read fType write SetType;
    property Column : integer read fColumn write SetColumn;
    property Row : integer read fRow write SetRow;
  end;

  TDataCollection = class(TList<TBaseDataObject>);
  TCustomerCollection = class(TList<TCustomer>);
  TUserCollection = class(TList<TUser>);
  TCategoryCollection = class(TList<TCategory>);
  TDishCollection = class(TList<TDish>);
  TRoomCollection = class(TList<TRoom>);
  TTableCollection = class(TList<TTableObject>);

  TOrderCollection = class(TList<TOrder>)
  public
    function ContainsOrder(const Order : Torder): boolean;
    function GetOrder(ID : integer): TOrder;
  end;

  TModifierCollection = class(TList<TModifier>)
  public
    function ContainsModifier(const aModifier : TModifier): boolean;
    function RemoveByID(const ID : integer): boolean;
  end;

implementation

{ TBaseDataObject }

procedure TBaseDataObject.Assign(Source: TBaseDataObject);
begin
  if Assigned(Source) then
  begin
    ID:= Source.ID;
    Name:= Source.Name;
  end;
end;

procedure TBaseDataObject.SetID(const Value: integer);
begin
  fID := Value;
end;

procedure TBaseDataObject.SetName(const Value: string);
begin
  fName := Value;
end;

{ TUser }

destructor TUser.Destroy;
begin
  if Assigned(fPicture) then
    FreeMem(fPicture, fPicSize);
  inherited;
end;

procedure TUser.SetPicSize(const Value: integer);
begin
  fPicSize := Value;
end;

procedure TUser.SetPicure(const Value: pointer);
begin
  fPicture := Value;
end;

procedure TUser.SetPIN(const Value: string);
begin
  fPIN := Value;
end;

procedure TUser.SetRole(const Value: TUserRoles);
begin
  fRole := Value;
end;

{ TModifier }

procedure TModifier.Assign(Source: TBaseDataObject);
var
  lSource : TModifier;
begin
  inherited;
  if Source is TModifier then
  begin
    lSource := Source as TModifier;
    Cost := lSource.Cost;
    &Type := lSource.&Type;
  end;
end;

procedure TModifier.SetCost(const Value: Currency);
begin
  fCost := Value;
end;

procedure TModifier.SetType(const Value: TModifierType);
begin
  fType := Value;
end;

{ TDish }

procedure TDish.Assign(Source: TBaseDataObject);
var
  lSource : TDish;
  lModifier : TModifier;
  i : integer;
begin
  inherited;
  if Source is TDish then
  begin
    lSource := Source as TDish;
    Color := lSource.Color;
    Category := lSource.Category;
    fModifiers.Clear;
    for i := 0 to lSource.Modifiers.Count - 1 do
    begin
      lModifier := TModifier.Create;
      lModifier.Assign(lSource.Modifiers[i]);
      fModifiers.Add(lModifier);
    end;
  end;
end;

function TDish.Copy: TDish;
begin
  Result := TDish.Create;
  Result.Assign(Self);
end;

constructor TDish.Create;
begin
  fModifiers := TModifierCollection.Create;
  fColor := TAlphaColorRec.Null;
end;

destructor TDish.Destroy;
begin
  FreeAndNil(fModifiers);
  inherited;
end;

function TDish.GetCanModify: boolean;
begin
  Result := fModifiers.Count > 0;
end;

function TDish.IsEqual(const aDish: TDish): boolean;
var
  i : integer;
begin
  Result := fID = aDish.ID;
  if not Result then Exit;
  Result := fModifiers.Count = aDish.Modifiers.Count;
  if not Result then Exit;
  for i := 0 to aDish.Modifiers.Count - 1 do
  begin
    Result := fModifiers.ContainsModifier(aDish.Modifiers[i]);
    if not Result then Exit;
  end;
end;

procedure TDish.SetCategory(const Value: integer);
begin
  fCategory := Value;
end;

procedure TDish.SetColor(const Value: TAlphaColor);
begin
  fColor := Value;
end;

{ TCustomer }

procedure TCustomer.SetPhoneNumber(const Value: string);
begin
  fPhoneNumber := Value;
end;

{ TRoom }

procedure TRoom.SetHeight(const Value: integer);
begin
  fHeight := Value;
end;

procedure TRoom.SetWidth(const Value: integer);
begin
  fWidth := Value;
end;

{ TTableObject }

procedure TTableObject.SetColumn(const Value: integer);
begin
  fColumn := Value;
end;

procedure TTableObject.SetNumber(const Value: integer);
begin
  fNumber := Value;
end;

procedure TTableObject.SetOrientation(const Value: integer);
begin
  fOrientation := Value;
end;

procedure TTableObject.SetRoom(const Value: integer);
begin
  fRoom := Value;
end;

procedure TTableObject.SetRow(const Value: integer);
begin
  fRow := Value;
end;

procedure TTableObject.SetSize(const Value: integer);
begin
  fSize := Value;
end;

procedure TTableObject.SetType(const Value: integer);
begin
  fType := Value;
end;

{ TOrderItem }

procedure TOrderItem.Assign(Source: TBaseDataObject);
var
  lSource : TOrderItem;
begin
  inherited;
  if Source is TOrderItem then
  begin
    lSource := Source as TOrderItem;
    Dish := lSource.Dish;
    Qty := lSource.Qty;
  end;
end;

procedure TOrderItem.SetDish(const Value: TDish);
begin
  fDish := Value;
end;

procedure TOrderItem.SetQty(const Value: integer);
begin
  fQty := Value;
end;

{ TOrder }

function TOrder.AddItem(const Item: TDish): boolean;
var
  lItem : TOrderItem;
  i : integer;
  found : boolean;
begin
  lItem := TOrderItem.Create;
  lItem.Dish := Item;
  lItem.Qty := 1;
  found := false;
  for i := 0 to fItems.Count - 1 do
    if fItems[i].Dish.IsEqual(Item) then
    begin
      found := true;
      fItems[i].Qty := fItems[i].Qty + 1;
      Break;
    end;
  Result := not found;
  if found then
    FreeAndNil(lItem)
  else
    fItems.Add(lItem);
end;

procedure TOrder.Assign(Source: TBaseDataObject);
var
  lSource : TOrder;
  i : integer;
  item : TOrderItem;
begin
  inherited;
  fItems.Clear;
  if Source is TOrder then
  begin
    lSource := Source as TOrder;
    Guests := lSource.Guests;
    TableNumber := lSource.TableNumber;
    CustomerName := lSource.CustomerName;
    Self.Date := lSource.Date;
    Accepted := lSource.Accepted;
    Paid := lSource.Paid;
    for i := 0 to lSource.Items.Count - 1 do
    begin
      item := TOrderItem.Create;
      item.Assign(lSource.Items[i]);
      fItems.Add(item);
    end;
  end;
end;

constructor TOrder.Create;
begin
  inherited;
  fItems := TList<TOrderItem>.Create;
end;

destructor TOrder.Destroy;
begin
  fItems.Clear;
  FreeAndNil(fItems);
  inherited;
end;

function TOrder.GetAmount: Currency;
var
  i, j : integer;
begin
  Result := 0;
  if Assigned(fItems) then
  for i := 0 to pred(fItems.Count) do
  begin
    Result := Result + fItems[i].Dish.Cost * fItems[i].Qty;
    for j := 0 to pred(fItems[i].Dish.Modifiers.Count) do
      Result := Result + fItems[i].Dish.Modifiers[j].Cost * fItems[i].Qty;
  end;
end;

function TOrder.GetIsEmpty: boolean;
begin
  Result := fItems.Count = 0;
end;

procedure TOrder.SetAccepted(const Value: boolean);
begin
  fAccepted := Value;
end;

procedure TOrder.SetCustomerName(const Value: string);
begin
  fCustomerName := Value;
end;

procedure TOrder.SetDate(const Value: TDateTime);
begin
  fDate := Value;
end;

procedure TOrder.SetGuests(const Value: integer);
begin
  fGuests := Value;
end;

procedure TOrder.SetPaid(const Value: boolean);
begin
  fPaid := Value;
end;

procedure TOrder.SetTableNumber(const Value: integer);
begin
  fTableNumber := Value;
end;

{ TModifierCollection }

function TModifierCollection.ContainsModifier(
  const aModifier: TModifier): boolean;
var
  i : integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if Items[i].ID = aModifier.ID then
    begin
      Result := true;
      break;
    end;
end;

function TModifierCollection.RemoveByID(const ID: integer): boolean;
var
  i : integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if Items[i].ID = ID then
    begin
      Result := true;
      Delete(i);
      break;
    end;
end;

{ TOrderCollection }

function TOrderCollection.ContainsOrder(const Order: Torder): boolean;
var
  i : integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if Items[i].ID = Order.ID then
    begin
      Result := true;
      break;
    end;
end;

function TOrderCollection.GetOrder(ID: integer): TOrder;
var
  i : integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Items[i].ID = ID then
    begin
      Result := Items[i];
      break;
    end;
end;

end.
