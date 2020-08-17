//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program HomeProject1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uHomeForm1 in 'uHomeForm1.pas' {Form1Home},
  uHomeFrame1 in 'uHomeFrame1.pas' {HomeFrame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1Home, Form1Home);
  Application.Run;
end.
