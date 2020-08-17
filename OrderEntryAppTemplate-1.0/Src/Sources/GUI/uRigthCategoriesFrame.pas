unit uRigthCategoriesFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, FMX.TextLayout, uDataClasses;

const

  _FontSize = 20;
  _ScrollValue = 100;
  _ItemHeight = 75;
  _ItemWidth = 60;
  _ItemGap = 20;

type

  TListBoxState = (tlbCollapsed, tlbExpanded);

  TRigthCategoriesFrame = class(TFrame)
    ScrollUpBtn: TButton;
    ScrollDownBtn: TButton;
    CategoriesLB: TListBox;
    FlyButtonLayout: TLayout;
    ExpandBtn: TButton;
    procedure ScrollUpBtnClick(Sender: TObject);
    procedure ScrollDownBtnClick(Sender: TObject);
  private
    { Private declarations }
    fListBoxState : TListBoxState;
    fHeightCalculator : TTextLayout;
    fCategories : TCategoryCollection;
    fOnCategoryClick : TNotifyEvent;

    procedure SetListBoxState(const Value: TListBoxState);
    procedure SetCategories(const Value: TCategoryCollection);
    procedure DoOnCategoryClick(Sender : TObject);

  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    property ListBoxState : TListBoxState read fListBoxState write SetListBoxState;
    property Categories : TCategoryCollection read fCategories write SetCategories;
    property OnCategoryClick : TNotifyEvent read fOnCategoryClick write fOnCategoryClick;
  end;

implementation

{$R *.fmx}

{ TRigthCategoriesFrame }

constructor TRigthCategoriesFrame.Create(AOwner: TComponent);
begin
  inherited;
  fHeightCalculator := TTextLayoutManager.DefaultTextLayout.Create;
  fListBoxState := tlbExpanded;
end;

destructor TRigthCategoriesFrame.Destroy;
begin
  FreeAndNil(fHeightCalculator);
  inherited;
end;

procedure TRigthCategoriesFrame.DoOnCategoryClick(Sender: TObject);
begin
  if Assigned(fOnCategoryClick) then
    fOnCategoryClick(TFmxObject(Sender).TagObject);
end;

procedure TRigthCategoriesFrame.ScrollDownBtnClick(Sender: TObject);
begin
  CategoriesLB.AniCalculations.MouseWheel(0, _ScrollValue);
end;

procedure TRigthCategoriesFrame.ScrollUpBtnClick(Sender: TObject);
begin
  CategoriesLB.AniCalculations.MouseWheel(0, -_ScrollValue);
end;

procedure TRigthCategoriesFrame.SetCategories(const Value: TCategoryCollection);
var
  i : integer;
  lItem : TListBoxItem;
begin
  fCategories := Value;
  CategoriesLB.Clear;
  for i := 0 to fCategories.Count - 1 do
  begin
    lItem := TListBoxItem.Create(CategoriesLB);
    if fListBoxState = tlbExpanded then
      lItem.StyleLookup := 'ListboxItemCategoryHStyle'
    else
      lItem.StyleLookup := 'ListboxItemCategoryVStyle';
    lItem.TagObject := fCategories[i];
    lItem.Text := fCategories[i].Name;
    lItem.TagObject := fCategories[i];
    lItem.ApplyStyleLookup;
    lItem.OnClick := DoOnCategoryClick;
    CategoriesLB.AddObject(lItem);
  end;
  CategoriesLB.RealignContent;
end;

procedure TRigthCategoriesFrame.SetListBoxState(const Value: TListBoxState);
var
  i : integer;
  h : single;
  lbItem : TListBoxItem;
  function CalcHeight(const item : TListBoxItem): single;
  begin
    fHeightCalculator.BeginUpdate;
    fHeightCalculator.Text := item.Text;
    fHeightCalculator.MaxSize := TPointF.Create(1000, _ItemWidth);
    fHeightCalculator.WordWrap := false;
    fHeightCalculator.Font.Size := _FontSize;
    fHeightCalculator.HorizontalAlign := TTextAlign.Center;
    fHeightCalculator.VerticalAlign := TTextAlign.Center;
    fHeightCalculator.EndUpdate;
    Result := fHeightCalculator.Width;
  end;
begin
  fListBoxState := Value;
  if fListBoxState = tlbExpanded then
  begin
    for i := 0 to CategoriesLB.Items.Count - 1 do
    begin
      lbItem := CategoriesLB.ItemByIndex(i);
      lbItem.StyleLookup := 'ListboxItemCategoryHStyle';
      lbItem.Height := _ItemHeight;
    end;
  end
  else
  begin
    for i := 0 to CategoriesLB.Items.Count - 1 do
    begin
      lbItem := CategoriesLB.ItemByIndex(i);
      lbItem.Width := _ItemWidth;
      h := CalcHeight(lbItem);
      lbItem.Height := h + _ItemGap;
      lbItem.StyleLookup := 'ListboxItemCategoryVStyle';

      lbItem.StylesData['txt.Width'] := h + _ItemGap;
      lbItem.StylesData['txt.Height'] := _ItemWidth;
      lbItem.StylesData['txt.Position.X'] := _ItemWidth;
      lbItem.StylesData['txt.Position.Y'] := 0;

    end;

  end;
end;

end.
