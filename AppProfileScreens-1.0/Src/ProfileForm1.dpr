//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ProfileForm1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uProfileForm1 in 'uProfileForm1.pas' {Form1Profile},
  uProfileFrame1 in 'uProfileFrame1.pas' {ProfileFrame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1Profile, Form1Profile);
  Application.Run;
end.
