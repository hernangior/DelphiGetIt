//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ProfileForm3;

uses
  System.StartUpCopy,
  FMX.Forms,
  uProfileFrame3 in 'uProfileFrame3.pas' {ProfileFrame3: TFrame},
  uProfileForm3 in 'uProfileForm3.pas' {Form3Profile};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3Profile, Form3Profile);
  Application.Run;
end.
