//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uContactsFrame1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Effects,
  FMX.Filter.Effects, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.TabControl;

type
  TContactsFrame1 = class(TFrame)
    HeaderLayout: TLayout;
    ProfilePhotoCircle: TCircle;
    TabsCenterLayout: TLayout;
    TabsLayout: TLayout;
    ContactsFilterBTN: TSpeedButton;
    GroupsFilterBTN: TSpeedButton;
    BackgroundRect: TRectangle;
    GaussianBlurEffect1: TGaussianBlurEffect;
    ContactsListView: TListView;
    FDMemTable1: TFDMemTable;
    FDMemTable1Text1: TStringField;
    FDMemTable1Text2: TStringField;
    FDMemTable1Text3: TStringField;
    FDMemTable1Image1: TGraphicField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    GroupsInvertEffect: TInvertEffect;
    ContactsInvertEffect: TInvertEffect;
    FDMemTable1Status: TIntegerField;
    ProfileCircleShadowEffect: TShadowEffect;
    ProfileNameText: TText;
    TabControl1: TTabControl;
    ContactsTab: TTabItem;
    GroupsTab: TTabItem;
    HeaderTopLayout: TLayout;
    SearchImageBTN: TImage;
    AddImageBTN: TImage;
    StatsImageBTN: TImage;
    CameraImageBTN: TImage;
    ShadowEffect1: TShadowEffect;
    procedure ContactsFilterBTNClick(Sender: TObject);
    procedure GroupsFilterBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TContactsFrame1.ContactsFilterBTNClick(Sender: TObject);
begin
ContactsInvertEffect.Enabled := False;
GroupsInvertEffect.Enabled := True;
TabControl1.ActiveTab := ContactsTab;
end;

procedure TContactsFrame1.GroupsFilterBTNClick(Sender: TObject);
begin
ContactsInvertEffect.Enabled := True;
GroupsInvertEffect.Enabled := False;
TabControl1.ActiveTab := GroupsTab;
end;

end.
