unit uBaseForm;

interface

uses System.SysUtils, System.UITypes, FMX.Forms;

type

  TForm = class(FMX.Forms.TForm)
  private
    fFormResult: TModalResult;
    fSuccProc: TProc;
  protected
    procedure DoClose(var CloseAction: TCloseAction); override;
  public
    procedure RunForm(const aSuccProc: TProc);

    property FormResult: TModalResult read fFormResult write fFormResult;
  end;
implementation

{ TForm }

procedure TForm.DoClose(var CloseAction: TCloseAction);
begin
  if Assigned(fSuccProc) then
    fSuccProc();
  inherited;
end;

procedure TForm.RunForm(const aSuccProc: TProc);
begin
  fSuccProc:= aSuccProc;
  FormResult:= mrCancel;
  {$IF DEFINED(Win64) or DEFINED(Win32)}
  ShowModal;
  {$ELSE}
  Self.Show;
  {$ENDIF}
end;

end.
