//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uContactsFrame2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl,
  FMX.Effects, FMX.Filter.Effects, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.GenData, Fmx.Bind.GenData,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope,
  uContactsFrame2Item;

type
  TContactsFrame2 = class(TFrame)
    TabControl1: TTabControl;
    ContactsTab: TTabItem;
    MessagesTab: TTabItem;
    SearchRoundRect: TRoundRect;
    SearchEdit: TEdit;
    SearchEditButton: TSearchEditButton;
    RightAlphaLayout: TLayout;
    FooterLayout: TLayout;
    FooterGridPanelLayout: TGridPanelLayout;
    BackLayout1: TLayout;
    BackLayout2: TLayout;
    BackLayout3: TLayout;
    BackLayout4: TLayout;
    AllImage: TImage;
    AllText: TText;
    RecentImage: TImage;
    RecentText: TText;
    GroupsImage: TImage;
    GroupsText: TText;
    FavoritesImage: TImage;
    FavoritesText: TText;
    AlphaAText: TText;
    Alpha1DotText: TText;
    AlphaDText: TText;
    Alpha2DotText: TText;
    AlphaHText: TText;
    Alpha3DotText: TText;
    Alpha4DotText: TText;
    AlphaLText: TText;
    AlphaPText: TText;
    Alpha5DotText: TText;
    AlphaSText: TText;
    Alpha6DotText: TText;
    AlphaUText: TText;
    Alpha7DotText: TText;
    AlphaXText: TText;
    Alpha8DotText: TText;
    AlphaZText: TText;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    FillRGBEffect4: TFillRGBEffect;
    BackgroundRect: TRectangle;
    VertScrollBox1: TVertScrollBox;
    Frame2Item1: TFrame2Item;
    Frame2Item2: TFrame2Item;
    Frame2Item3: TFrame2Item;
    Frame2Item4: TFrame2Item;
    Frame2Item5: TFrame2Item;
    InvertEffect1: TInvertEffect;
    AllRectBTN: TRectangle;
    RecentRectBTN: TRectangle;
    GroupsRectBTN: TRectangle;
    FavoritesRectBTN: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
