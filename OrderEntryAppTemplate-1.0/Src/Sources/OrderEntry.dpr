program OrderEntry;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'GUI\ufrmMain.pas' {frmMain},
  uFrameLeftOrderMenu in 'GUI\uFrameLeftOrderMenu.pas' {FrameLeftOrderMenu: TFrame},
  ufrmTabs in 'GUI\ufrmTabs.pas' {TabsMgmtForm},
  uFrameTabsList in 'GUI\uFrameTabsList.pas' {FrameTabsList: TFrame},
  uTablesFrame in 'GUI\uTablesFrame.pas' {TablesFrame: TFrame},
  uOrderDetailsFrame in 'GUI\uOrderDetailsFrame.pas' {OrderDetailsFrame: TFrame},
  uOrderEntryForm in 'GUI\uOrderEntryForm.pas' {OrderEntryForm},
  uRigthCategoriesFrame in 'GUI\uRigthCategoriesFrame.pas' {RigthCategoriesFrame: TFrame},
  uModifiersForm in 'GUI\uModifiersForm.pas' {ModifiersForm},
  uPayments in 'GUI\uPayments.pas' {PaymentsForm},
  uBaseForm in 'GUI\uBaseForm.pas',
  uDataClasses in 'Classes\uDataClasses.pas',
  uMainDM in 'ORM\uMainDM.pas' {MainDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TMainDM, MainDM);
  Application.Run;
end.
