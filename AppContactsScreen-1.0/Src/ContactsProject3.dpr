//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ContactsProject3;

uses
  System.StartUpCopy,
  FMX.Forms,
  uContactsForm3 in 'uContactsForm3.pas' {Form3Contacts},
  uContactsFrame3 in 'uContactsFrame3.pas' {ContactsFrame3: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3Contacts, Form3Contacts);
  Application.Run;
end.
