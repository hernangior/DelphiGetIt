//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SettingsForm2;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSettingsForm2 in 'uSettingsForm2.pas' {Form2Settings},
  uSettingsFrame2 in 'uSettingsFrame2.pas' {SettingsFrame2: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2Settings, Form2Settings);
  Application.Run;
end.
