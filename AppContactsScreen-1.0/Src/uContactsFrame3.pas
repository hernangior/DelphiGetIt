//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uContactsFrame3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Objects, FMX.Edit, FMX.Layouts, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.ObjectScope, FMX.Effects, FMX.Filter.Effects,
  System.Actions, FMX.ActnList;

type
  TContactsFrame3 = class(TFrame)
    HeaderToolBar: TToolBar;
    BackButton: TButton;
    HeaderText: TText;
    HeaderBackgroundRect: TRectangle;
    SearchLayout: TLayout;
    SearchEdit: TEdit;
    SearchEditButton: TSearchEditButton;
    FilterButton: TButton;
    SearchBackgroundRect: TRectangle;
    SearchFilterBackgroundRect: TRectangle;
    FilterArrowImage: TImage;
    EmployeeListView: TListView;
    BindingsList1: TBindingsList;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    FillRGBEffect1: TFillRGBEffect;
    ActionList1: TActionList;
    SearchAction: TAction;
    FilterPanelRect: TRectangle;
    NameFilterButton: TButton;
    DivisionFilterButton: TButton;
    NumberFilterButton: TButton;
    TitleFilterButton: TButton;
    FilterByNameAction: TAction;
    FilterByTitleAction: TAction;
    FilterByNumberAction: TAction;
    FilterByDivisionAction: TAction;
    FilterPanelAction: TAction;
    HeaderFilterPanelLabel: TLabel;
    FilterBackgroundPanelRect: TRectangle;
    HeaderFilterPanelRect: TRectangle;
    VertScrollBox1: TVertScrollBox;
    procedure HeaderToolBarResize(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure FilterByNameActionExecute(Sender: TObject);
    procedure FilterByTitleActionExecute(Sender: TObject);
    procedure FilterByNumberActionExecute(Sender: TObject);
    procedure FilterByDivisionActionExecute(Sender: TObject);
    procedure FilterPanelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TContactsFrame3.FilterByDivisionActionExecute(Sender: TObject);
begin
  FilterButton.TagString := 'Text4';
  FilterPanelAction.Execute;
end;

procedure TContactsFrame3.FilterByNameActionExecute(Sender: TObject);
begin
  FilterButton.TagString := 'Text1';
  FilterPanelAction.Execute;
end;

procedure TContactsFrame3.FilterByNumberActionExecute(Sender: TObject);
begin
  FilterButton.TagString := 'Text3';
  FilterPanelAction.Execute;
end;

procedure TContactsFrame3.FilterByTitleActionExecute(Sender: TObject);
begin
  FilterButton.TagString := 'Text2';
  FilterPanelAction.Execute;
end;

procedure TContactsFrame3.FilterPanelActionExecute(Sender: TObject);
begin
  FilterBackgroundPanelRect.Visible := not FilterBackgroundPanelRect.Visible;
end;

procedure TContactsFrame3.HeaderToolBarResize(Sender: TObject);
begin
{$IF (DEFINED(MACOS) AND NOT DEFINED(IOS))}
if MenuButton.Margins.Top=0 then
 begin
   MenuButton.Margins.Top := 5;
   MenuButton.Margins.Bottom := 5;
   MenuButton.Margins.Left := 5;
   MenuButton.Margins.Right := 5;
 end;
{$ENDIF}
end;

procedure TContactsFrame3.SearchActionExecute(Sender: TObject);
begin
  if FilterButton.TagString='' then
    FilterButton.TagString := 'Text1';
  LinkFillControlToField1.Active := False;
  FDMemTable1.Filtered := False;
  FDMemTable1.Filter := 'lower('+FilterButton.TagString+') LIKE ' + QuotedStr('%'+LowerCase(SearchEdit.Text)+'%');
  FDMemTable1.Filtered := True;
  LinkFillControlToField1.Active := True;
end;

end.

