//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program HomeProject3;

uses
  System.StartUpCopy,
  FMX.Forms,
  uHomeForm3 in 'uHomeForm3.pas' {Form3Home},
  uHomeFrame3 in 'uHomeFrame3.pas' {HomeFrame3: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3Home, Form3Home);
  Application.Run;
end.
