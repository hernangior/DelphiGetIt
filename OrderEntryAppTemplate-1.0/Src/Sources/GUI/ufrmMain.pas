unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects,
  System.ImageList, FMX.ImgList, uBaseForm, FMX.DialogService;

type
  TfrmMain = class(TForm)
    LayoutRightContent: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    OrderEntryBtn: TButton;
    TimeClockBtn: TButton;
    ManagerBtn: TButton;
    ExitBtn: TButton;
    BackgroundRect: TRectangle;
    txtDateTime: TText;
    mainLayout: TLayout;
    Rectangle2: TRectangle;
    LayoutLeftContent: TLayout;
    Rectangle3: TRectangle;
    mainBackImg: TRectangle;
    Text1: TText;
    imgPointOSLogo: TImage;
    MainStyleBook: TStyleBook;
    procedure OrderEntryBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure ManagerBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses ufrmTabs, uOrderEntryForm, uMainDM;

procedure TfrmMain.OrderEntryBtnClick(Sender: TObject);
var
  lTabsMgmtForm : TTabsMgmtForm;
begin
  lTabsMgmtForm:= ShowTabsMgmtForm();
  lTabsMgmtForm.RunForm(
    procedure()
    begin
      if lTabsMgmtForm.FormResult = mrOk then
      begin

      end;
    end
  );
end;

procedure TfrmMain.ManagerBtnClick(Sender: TObject);
begin
  TDialogService.ShowMessage('This function is not implemented.');
end;

procedure TfrmMain.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
