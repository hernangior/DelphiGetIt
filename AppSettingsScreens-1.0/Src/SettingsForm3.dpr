//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SettingsForm3;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSettingsForm3 in 'uSettingsForm3.pas' {Form3Settings},
  uSettingsFrame3 in 'uSettingsFrame3.pas' {SettingsFrame3: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3Settings, Form3Settings);
  Application.Run;
end.
