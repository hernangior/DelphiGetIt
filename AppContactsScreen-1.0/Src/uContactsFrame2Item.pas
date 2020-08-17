//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uContactsFrame2Item;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Filter.Effects, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrame2Item = class(TFrame)
    ProfileImageCircle: TCircle;
    ItemBodyLayout: TLayout;
    FooterLine: TLine;
    NameLabel: TLabel;
    PhoneLabel: TLabel;
    BodyTextLayout: TLayout;
    TextMessageImage: TImage;
    PhoneCallImage: TImage;
    IconsFillRGBEffect: TFillRGBEffect;
    BodyButtonsLayout: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
