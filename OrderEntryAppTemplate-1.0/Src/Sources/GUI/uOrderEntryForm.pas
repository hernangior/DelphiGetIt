unit uOrderEntryForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Objects, FMX.Edit,
  uOrderDetailsFrame, uRigthCategoriesFrame, uBaseForm, uMainDM,
  uDataClasses, System.Threading;

const

  CategoryHiddenWidth = 18;
  CategoryCollapsedWidth = 60;
  CategoryExpandedWidth = 235;
  GoodsItemWidth = 155;

type
  TOrderEntryForm = class(TForm)
    LeftPane: TLayout;
    RightPane: TLayout;
    CenterPane: TLayout;
    OrderInfoLayout: TLayout;
    TopInfoPane: TLayout;
    OrderButtonsPane: TGridPanelLayout;
    BottomInfoPane: TLayout;
    AmountInfoLayout: TLayout;
    BottomButtons: TGridPanelLayout;
    PrintBtn: TButton;
    DiscountBtn: TButton;
    SplitBtn: TButton;
    AdvancedBtn: TButton;
    SendBtn: TButton;
    PayBtn: TButton;
    AmountBackground: TPanel;
    EditNamePnl: TPanel;
    RightPnl: TPanel;
    SearchBtn: TButton;
    AmountCaption: TText;
    AmountTxt: TText;
    TableInfoGPL: TGridPanelLayout;
    GuestsPnl: TPanel;
    TablePnl: TPanel;
    GuestsCaption: TText;
    TableCaption: TText;
    EditGuestsBtn: TButton;
    EditTableBtn: TButton;
    GuestsTxt: TText;
    TableNumTxt: TText;
    EditNameLayout: TLayout;
    OrderNumberLayout: TLayout;
    AssignBtn: TButton;
    OrderNumberLbl: TLabel;
    TabNameEdt: TEdit;
    TabEditBtn: TButton;
    OrderDetailsFrame1: TOrderDetailsFrame;
    RigthCategoriesFrame1: TRigthCategoriesFrame;
    GoodsLB: TListBox;
    SearchLayout: TLayout;
    procedure PayBtnClick(Sender: TObject);
    procedure RigthCategoriesFrame1ExpandBtnClick(Sender: TObject);
    procedure GoodsLBResized(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GoodsLBItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SendBtnClick(Sender: TObject);
  private
    { Private declarations }
    fReversed : boolean;
    fRightPaneState : integer; //2 - hidden, 1 - collapsed, 0 - expanded
    fMenu : TDishCollection;

    fTableNumber : integer;
    fGuests : integer;
    fOrder : TOrder;

    procedure PaintOrder;
    procedure SetGuests(const Value: integer);
    procedure SetTableNumber(const Value: integer);

    procedure LoadMenu(const Category : integer);
    procedure LoadCategories;

    procedure OnCategorySelected(Sender : TObject);

  public
    { Public declarations }

    property TableNumber : integer read fTableNumber write SetTableNUmber;
    property Guests : integer read fGuests write SetGuests;
    property Order : TOrder read fOrder;
  end;

function ShowOrderEntryForm(): TOrderEntryForm;

var
  OrderEntryForm: TOrderEntryForm;

implementation

{$R *.fmx}

uses uModifiersForm, uPayments;

function ShowOrderEntryForm(): TOrderEntryForm;
begin
  if Assigned(OrderEntryForm) then
    OrderEntryForm.Free;

  OrderEntryForm:= TOrderEntryForm.Create(Application);
  Result:= OrderEntryForm;
end;


procedure TOrderEntryForm.SendBtnClick(Sender: TObject);
begin
  fOrder.Accepted := true;
  FormResult := mrOk;
  ModalResult := mrOk;
  Close;
end;

procedure TOrderEntryForm.SetGuests(const Value: integer);
begin
  fGuests := Value;
  GuestsTxt.Text := Value.ToString;
end;

procedure TOrderEntryForm.SetTableNUmber(const Value: integer);
begin
  fTableNumber := Value;
  TableNumTxt.Text := Value.ToString;
end;

procedure TOrderEntryForm.FormCreate(Sender: TObject);
begin
  fReversed := true;
  fOrder := TOrder.Create;
  RigthCategoriesFrame1.OnCategoryClick := OnCategorySelected;
end;

procedure TOrderEntryForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fOrder);
end;

procedure TOrderEntryForm.FormShow(Sender: TObject);
begin
  LoadCategories;
  LoadMenu(0);
  OrderNumberLbl.Text := 'Order Number : ' + fOrder.ID.ToString;
  Guests := fOrder.Guests;
  TableNumber := fOrder.TableNumber;
  TabNameEdt.Text := fOrder.CustomerName;
  PayBtn.Enabled := fOrder.Accepted;
  PaintOrder;
end;

procedure TOrderEntryForm.GoodsLBItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  lDish : TDish;
  lVisOrderItem, subItem : TVisualOrderItem;
  lModifiersForm : TModifiersForm;
  canAdd : boolean;
  procedure AddVisualOrderItem;
  var
    i : integer;
  begin
    if fOrder.AddItem(lDish) then
    begin
      lVisOrderItem := TVisualOrderItem.Create(lDish.Name, 1, lDish.Cost);
      lVisOrderItem.ID := lDish.ID;
      for i := 0 to lDish.Modifiers.Count - 1 do
      begin
        subItem := TVisualOrderItem.Create(lVisOrderItem,
                                           lDish.Modifiers[i].Name, 1,
                                           lDish.Modifiers[i].Cost);
        lVisOrderItem.Modifiers.Add(subItem);
      end;
      OrderDetailsFrame1.OrderItems.Add(lVisOrderItem);
    end
    else
    begin
      for i := 0 to OrderDetailsFrame1.OrderItems.Count - 1 do
        if OrderDetailsFrame1.OrderItems[i].ID = lDish.ID then
          OrderDetailsFrame1.OrderItems[i].Qty := OrderDetailsFrame1.OrderItems[i].Qty + 1;
    end;
  end;

begin
  lDish := (Item.TagObject as TDish).Copy;
  if lDish.CanModify then
    begin
      lModifiersForm := ShowModifiersForm;
      lModifiersForm.Dish := lDish;
      lModifiersForm.RunForm(
        procedure()
        begin
          if lModifiersForm.FormResult = mrOk then
            canAdd := true
          else
            FreeAndNil(lDish);
        end
      );
    end
  else
    canAdd := true;
  if canAdd then
    AddVisualOrderItem;
  AmountTxt.Text := Format('%8.2m', [fOrder.Amount]);
  TTask.Run(procedure
  begin
    Sender.ItemIndex := -1;
  end);
end;

procedure TOrderEntryForm.GoodsLBResized(Sender: TObject);
begin
  GoodsLB.Columns := trunc(GoodsLB.Width / GoodsItemWidth);
end;

procedure TOrderEntryForm.LoadCategories;
begin
  RigthCategoriesFrame1.Categories := MainDM.Categories;
end;

procedure TOrderEntryForm.LoadMenu(const Category: integer);
var
  i : integer;
  lItem : TListBoxItem;
begin
  GoodsLB.Clear;
  if Assigned(fMenu) then
  begin
    fMenu.Clear;
    FreeAndNil(fMenu);
  end;
  fMenu := MainDM.GetMenuList(Category);
  for i := 0 to fMenu.Count - 1 do
  begin
    lItem := TListBoxItem.Create(GoodsLB);
    lItem.Text := fMenu[i].Name;
    lItem.TagObject := fMenu[i];
    lItem.StyleLookup := 'ListboxItemGoodsStyle';
    if fMenu[i].Color <> TAlphaColorRec.Null then
      lItem.StylesData['Background.Fill.Color'] := fMenu[i].Color;
    GoodsLB.AddObject(lItem);
  end;
end;

procedure TOrderEntryForm.OnCategorySelected(Sender: TObject);
begin
  LoadMenu((Sender as TCategory).ID);
end;

procedure TOrderEntryForm.PaintOrder;
var
  i, j : integer;
  lVisOrderItem, subItem : TVisualOrderItem;
begin
  for i := 0 to fOrder.Items.Count - 1 do
  begin
    lVisOrderItem := TVisualOrderItem.Create(fOrder.Items[i].Dish.Name, 1, fOrder.Items[i].Dish.Cost);
    lVisOrderItem.ID := fOrder.Items[i].Dish.ID;
    for j := 0 to fOrder.Items[i].Dish.Modifiers.Count - 1 do
    begin
      subItem := TVisualOrderItem.Create(lVisOrderItem,
                                         fOrder.Items[i].Dish.Modifiers[j].Name, 1,
                                         fOrder.Items[i].Dish.Modifiers[j].Cost);
      lVisOrderItem.Modifiers.Add(subItem);
    end;
    OrderDetailsFrame1.OrderItems.Add(lVisOrderItem);
  end;
end;

procedure TOrderEntryForm.PayBtnClick(Sender: TObject);
var
  lPaymentsForm : TPaymentsForm;
begin
  lPaymentsForm := ShowPaymentsForm();
  lPaymentsForm.Order := fOrder;
  lPaymentsForm.RunForm(
    procedure ()
    begin
      FormResult := mrOk;
      ModalResult := mrOk;
      Close;
    end);
end;

procedure TOrderEntryForm.RigthCategoriesFrame1ExpandBtnClick(Sender: TObject);
begin
  if fReversed then
  begin
    Inc(fRightPaneState);
    if fRightPaneState = 2 then
      fReversed := false;
  end
  else
  begin
    Dec(fRightPaneState);
    if fRightPaneState = 0 then
      fReversed := true;
  end;

  case fRightPaneState of
  0:
    begin
      SearchBtn.Visible := true;
      RigthCategoriesFrame1.CategoriesLB.Visible := true;
      RigthCategoriesFrame1.ScrollUpBtn.Visible := true;
      RigthCategoriesFrame1.ScrollDownBtn.Visible := true;
      RightPane.Width := CategoryExpandedWidth;
      RigthCategoriesFrame1.ListBoxState := TListBoxState.tlbExpanded;
    end;
  1:
    begin
      SearchBtn.Visible := true;
      RigthCategoriesFrame1.CategoriesLB.Visible := true;
      RigthCategoriesFrame1.ScrollUpBtn.Visible := true;
      RigthCategoriesFrame1.ScrollDownBtn.Visible := true;
      RightPane.Width := CategoryCollapsedWidth;
      RigthCategoriesFrame1.ListBoxState := TListBoxState.tlbCollapsed;
    end;
  2:
    begin
      SearchBtn.Visible := false;
      RigthCategoriesFrame1.CategoriesLB.Visible := false;
      RigthCategoriesFrame1.ScrollUpBtn.Visible := false;
      RigthCategoriesFrame1.ScrollDownBtn.Visible := false;
      RightPane.Width := CategoryHiddenWidth;
    end;
  end;

end;


end.
