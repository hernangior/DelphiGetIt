unit uPayments;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, System.ImageList,
  FMX.ImgList, uBaseForm, uDataClasses, FMX.DialogService;

type
  TPaymentsForm = class(TForm)
    gplPayments: TGridPanelLayout;
    pnlHeader: TPanel;
    labHeader: TLabel;
    pnlSubHeader: TPanel;
    pnlCenter: TPanel;
    gplCenter: TGridPanelLayout;
    btnPaymentByCash: TButton;
    btnPaymentByGiftCard: TButton;
    btnPaymentByCredit: TButton;
    btnPaymentByHouseAccount: TButton;
    btnOtherPaymentOptions: TButton;
    pnlAmountDue: TPanel;
    labAmountDue: TLabel;
    recPictureEditAmountDue: TRectangle;
    labAmountDueValue: TLabel;
    pnlTipAmount: TPanel;
    labTipAmount: TLabel;
    recPictureEditTipAmount: TRectangle;
    labTipAmountValue: TLabel;
    pnlFooter: TPanel;
    gplFooter: TGridPanelLayout;
    btnDone: TButton;
    btnCancel: TButton;
    Icons: TImageList;
    procedure btnDoneClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPaymentByCashClick(Sender: TObject);
  private
    { Private declarations }
    fOrder : TOrder;
    procedure SetOrder(const Value: TOrder);
  public
    { Public declarations }
    property Order : TOrder read fOrder write SetOrder;
  end;

function ShowPaymentsForm(): TPaymentsForm;

var
  PaymentsForm: TPaymentsForm;

implementation

{$R *.fmx}

function ShowPaymentsForm(): TPaymentsForm;
begin
  if assigned(PaymentsForm) then
    FreeAndNil(PaymentsForm);
  PaymentsForm := TPaymentsForm.Create(Application);
  Result := PaymentsForm;
end;

procedure TPaymentsForm.btnCancelClick(Sender: TObject);
begin
  FormResult := mrCancel;
  ModalResult := mrCancel;
  Close;
end;

procedure TPaymentsForm.btnDoneClick(Sender: TObject);
begin
  fOrder.Paid := true;
  FormResult := mrOK;
  ModalResult := mrOK;
  Close;
end;

procedure TPaymentsForm.btnPaymentByCashClick(Sender: TObject);
begin
  TDialogService.ShowMessage('This function is not implemented.');
end;

procedure TPaymentsForm.SetOrder(const Value: TOrder);
begin
  fOrder := Value;
  labAmountDue.Text := CurrToStr(fOrder.Amount);
end;

end.
