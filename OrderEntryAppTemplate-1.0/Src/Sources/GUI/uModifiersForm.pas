unit uModifiersForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  Generics.Collections, uDataClasses, uBaseForm;

type
  TModifiersForm = class(TForm)
    Caption: TPanel;
    itemNameTxt: TText;
    FinalButtonsPnl: TPanel;
    CustomBtn: TButton;
    DoneBtn: TButton;
    FramesLayout: TLayout;
    FirstButtonsPnl: TPanel;
    CancelBtn: TButton;
    NextBtn: TButton;
    SummaryPnl: TPanel;
    GridPanelLayout1: TGridPanelLayout;
    ToppingsPnl: TPanel;
    SidesPnl: TPanel;
    ToppingsCaption: TText;
    SidesCaption: TText;
    GridPanelLayout2: TGridPanelLayout;
    Text3: TText;
    AddToppingTxt: TText;
    Text7: TText;
    NoToppingTxt: TText;
    SidesLB: TListBox;
    SelectionPnl: TPanel;
    Panel1: TPanel;
    SelectionCB: TComboBox;
    GridPanelLayout3: TGridPanelLayout;
    NoBtn: TSpeedButton;
    YesBtn: TSpeedButton;
    ModifiersLB: TListBox;
    ToppingsItem: TListBoxItem;
    SidesItem: TListBoxItem;
    GridPanelLayout4: TGridPanelLayout;
    BackBtn: TButton;
    procedure NextBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure DoneBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelectionCBChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NoBtnClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
  private
    { Private declarations }
    fDish : TDish;
    fSourceDish : TDish;
    fToppings : TModifierCollection;
    fSides : TModifierCollection;

    procedure SetDish(const Value: TDish);
    procedure BuildSummary;
  public
    { Public declarations }

    property Dish : TDish read fDish write SetDish;
  end;

  function ShowModifiersForm(): TModifiersForm;

var
  ModifiersForm: TModifiersForm;

implementation

{$R *.fmx}

function ShowModifiersForm(): TModifiersForm;
begin
  if Assigned(ModifiersForm) then
    ModifiersForm.Free;

  ModifiersForm:= TModifiersForm.Create(Application);
  Result:= ModifiersForm;
end;


procedure TModifiersForm.BackBtnClick(Sender: TObject);
begin
  FirstButtonsPnl.Visible := true;
  FinalButtonsPnl.Visible := false;
  SelectionPnl.Visible := true;
  SummaryPnl.Visible := false;
end;

procedure TModifiersForm.BuildSummary;
var
  i : integer;
  lItem : TListBoxItem;
  yesStr, noStr : string;
begin
  SidesLB.Clear;
  for i := 0 to fSourceDish.Modifiers.Count - 1 do
  begin
    if fDish.Modifiers.ContainsModifier(fSourceDish.Modifiers[i]) then
    begin
      if fSourceDish.Modifiers[i].&Type = TModifierType.mtTopping then
        yesStr := yesStr + fSourceDish.Modifiers[i].Name + ','
      else
      begin
        lItem := TListBoxItem.Create(SidesLB);
        lItem.Text := fSourceDish.Modifiers[i].Name;
        lItem.StyleLookup := 'ListboxItemSidesYesStyle';
        lItem.Selectable := false;
        SidesLB.AddObject(lItem);
      end;
    end
    else
    begin
      if fSourceDish.Modifiers[i].&Type = TModifierType.mtTopping then
        noStr := noStr + fSourceDish.Modifiers[i].Name + ','
      else
      begin
        lItem := TListBoxItem.Create(SidesLB);
        lItem.Text := fSourceDish.Modifiers[i].Name;
        lItem.StyleLookup := 'ListboxItemSidesNoStyle';
        lItem.Selectable := false;
        SidesLB.AddObject(lItem);
      end;
    end;
  end;
  if yesStr <> '' then
    Delete(yesStr, Length(yesStr), 1);
  if noStr <> '' then
    Delete(noStr, Length(noStr), 1);
  AddToppingTxt.Text := yesStr;
  NoToppingTxt.Text := noStr;
end;

procedure TModifiersForm.CancelBtnClick(Sender: TObject);
begin
  FormResult := mrCancel;
  ModalResult := mrCancel;
  Close;
end;

procedure TModifiersForm.DoneBtnClick(Sender: TObject);
var
  i : integer;
  lModifier : TModifier;
begin
  fSourceDish.Modifiers.Clear;
  for i := 0 to fDish.Modifiers.Count - 1 do
  begin
    lModifier := TModifier.Create;
    lModifier.ID := fDish.Modifiers[i].ID;
    lModifier.Name := fDish.Modifiers[i].Name;
    lModifier.Cost := fDish.Modifiers[i].Cost;
    lModifier.&Type := fDish.Modifiers[i].&Type;
    fSourceDish.Modifiers.Add(lModifier);
  end;
  FormResult := mrOk;
  ModalResult := mrOK;
  Close;
end;

procedure TModifiersForm.FormCreate(Sender: TObject);
begin
  fToppings := TModifierCollection.Create;
  fSides := TModifierCollection.Create;
end;

procedure TModifiersForm.FormDestroy(Sender: TObject);
begin
  fToppings.Clear;
  fSides.Clear;
  FreeAndNIl(fToppings);
  FreeandNil(fSides);
  if Assigned(fDish) then
    FreeAndNil(fDish);
end;

procedure TModifiersForm.FormShow(Sender: TObject);
begin
  SelectionCB.ListBox.StyleLookup := 'TransparentModifiersListboxStyle';
  SelectionCB.ListBox.DefaultItemStyles.ItemStyle := 'ListboxItemModifiersStyle';
  SelectionCB.ListBox.ApplyStyleLookup;
end;

procedure TModifiersForm.NextBtnClick(Sender: TObject);
begin
  FirstButtonsPnl.Visible := false;
  FinalButtonsPnl.Visible := true;
  SelectionPnl.Visible := false;
  SummaryPnl.Visible := true;
  BuildSummary;
end;

procedure TModifiersForm.NoBtnClick(Sender: TObject);
begin
  if Assigned(ModifiersLB.Selected) then
    if fDish.Modifiers.RemoveByID(TModifier(ModifiersLB.Selected.TagObject).ID) then
      ModifiersLB.Selected.StyleLookup := 'ListboxItemModifierNoStyle';
end;

procedure TModifiersForm.SelectionCBChange(Sender: TObject);
var
  i : integer;
  lItem : TListBoxItem;
begin

  try
    ModifiersLB.BeginUpdate;
    ModifiersLB.Clear;
    if SelectionCB.ItemIndex = 0 then
      for i := 0 to fToppings.Count - 1 do
      begin
        lItem := TListBoxItem.Create(Self);
        lItem.Text := fToppings[i].Name;
        lItem.TagObject := fToppings[i];
        if fDish.Modifiers.ContainsModifier(fToppings[i]) then
          lItem.StyleLookup := 'ListboxItemModifierStyle'
        else
          lItem.StyleLookup := 'ListboxItemModifierNoStyle';
        ModifiersLB.AddObject(lItem);
      end
    else
      for i := 0 to fSides.Count - 1 do
      begin
        lItem := TListBoxItem.Create(Self);
        lItem.Text := fSides[i].Name;
        lItem.TagObject := fSides[i];
        if fDish.Modifiers.ContainsModifier(fSides[i]) then
          lItem.StyleLookup := 'ListboxItemModifierStyle'
        else
          lItem.StyleLookup := 'ListboxItemModifierNoStyle';
        ModifiersLB.AddObject(lItem);
      end
  finally
    ModifiersLB.EndUpdate;
  end;
end;

procedure TModifiersForm.SetDish(const Value: TDish);
var
  i : integer;
begin
  fDish := Value.Copy;
  fSourceDish := Value;
  itemNameTxt.Text := fDish.Name;
  for i := 0 to fSourceDish.Modifiers.Count - 1 do
    if fSourceDish.Modifiers[i].&Type = TModifierType.mtTopping then
      fToppings.Add(fSourceDish.Modifiers[i])
    else
      fSides.Add(fSourceDish.Modifiers[i]);
  SelectionCBChange(nil);
end;

procedure TModifiersForm.YesBtnClick(Sender: TObject);
begin
  if Assigned(ModifiersLB.Selected) then
    if not fDish.Modifiers.Contains(TModifier(ModifiersLB.Selected.TagObject)) then
    begin
      ModifiersLB.Selected.StyleLookup := 'ListboxItemModifierStyle';
      fDish.Modifiers.Add(TModifier(ModifiersLB.Selected.TagObject));
    end;
end;

end.
