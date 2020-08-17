//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ContactsProject2;

uses
  System.StartUpCopy,
  FMX.Forms,
  uContactsForm2 in 'uContactsForm2.pas' {Form2Contacts},
  uContactsFrame2 in 'uContactsFrame2.pas' {ContactsFrame2: TFrame},
  uContactsFrame2Item in 'uContactsFrame2Item.pas' {Frame2Item: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2Contacts, Form2Contacts);
  Application.Run;
end.
