//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ContactsProject1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uContactsForm1 in 'uContactsForm1.pas' {Form1Contacts},
  uContactsFrame1 in 'uContactsFrame1.pas' {ContactsFrame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1Contacts, Form1Contacts);
  Application.Run;
end.
