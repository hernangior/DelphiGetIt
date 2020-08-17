//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ProfileForm2;

uses
  System.StartUpCopy,
  FMX.Forms,
  uProfileFrame2 in 'uProfileFrame2.pas' {ProfileFrame2: TFrame},
  uProfileForm2 in 'uProfileForm2.pas' {Form2Profile};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2Profile, Form2Profile);
  Application.Run;
end.
