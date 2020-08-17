//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program LoginProject2;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLoginFrame2 in 'uLoginFrame2.pas' {LoginFrame2: TFrame},
  uLoginForm2 in 'uLoginForm2.pas' {Form2Login};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2Login, Form2Login);
  Application.Run;
end.
