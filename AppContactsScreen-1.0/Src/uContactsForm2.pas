//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uContactsForm2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uContactsFrame2,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2Contacts = class(TForm)
    VaporStyleBook: TStyleBook;
    ContactsFrame21: TContactsFrame2;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2Contacts: TForm2Contacts;

implementation

{$R *.fmx}

// Changes to the layout should be made inside of the TFrame itself. Once changes are made
// to the TFrame you can delete it from the TForm and re-add it. Set it's Align property to
// Client. Optionally, it's ClipChildren property can be set to True if there are any overlapping
// background images.

end.
