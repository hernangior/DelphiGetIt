program Academya;

uses
  System.StartUpCopy,
  FMX.Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
