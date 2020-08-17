//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SettingsForm1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSettingsForm1 in 'uSettingsForm1.pas' {Form1Settings},
  uSettingsFrame1 in 'uSettingsFrame1.pas' {SettingsFrame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1Settings, Form1Settings);
  Application.Run;
end.
