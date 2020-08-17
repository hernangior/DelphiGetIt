//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSettingsFrame1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.Effects,
  FMX.Filter.Effects;

type
  TSettingsFrame1 = class(TFrame)
    VertScrollBox1: TVertScrollBox;
    HeaderToolBar: TToolBar;
    HeaderGeneralLayout: TLayout;
    GeneralBackgroundRect: TRectangle;
    GeneralLabel: TLabel;
    NightModeLayout: TLayout;
    NightModeLabel: TLabel;
    NightModeImage: TImage;
    NightModeSwitch: TSwitch;
    NightModeCircle: TCircle;
    BackupLayout: TLayout;
    BackupLabel: TLabel;
    BackupSwitch: TSwitch;
    BackupCircle: TCircle;
    BackupImage: TImage;
    HeaderSecurityLayout: TLayout;
    SecurityBackgroundRect: TRectangle;
    SecurityLabel: TLabel;
    EnablePassLayout: TLayout;
    EnablePassLabel: TLabel;
    EnablePassSwitch: TSwitch;
    EnablePassCircle: TCircle;
    EnablePassImage: TImage;
    SavePassLayout: TLayout;
    SavePassLabel: TLabel;
    SavePassSwitch: TSwitch;
    ShowPassCircle: TCircle;
    SavePassImage: TImage;
    HeaderSharingLayout: TLayout;
    SharingBackgroundRect: TRectangle;
    SharingLabel: TLabel;
    ShareStatusLayout: TLayout;
    ShareStatusLabel: TLabel;
    ShareStatusSwitch: TSwitch;
    ShareStatusCircle: TCircle;
    ShareStatusImage: TImage;
    ShareProfileLayout: TLayout;
    ShareProfileLabel: TLabel;
    ShareProfileSwitch: TSwitch;
    ShareProfileCircle: TCircle;
    ShareProfileImage: TImage;
    HeaderPrivacyLayout: TLayout;
    PrivacyBackgroundRect: TRectangle;
    PrivacyLabel: TLabel;
    DisplayPublicLayout: TLayout;
    DisplayPublicLabel: TLabel;
    DisplayPublicSwitch: TSwitch;
    DisplayPublicCircle: TCircle;
    DisplayPublicImage: TImage;
    ShowEmailLayout: TLayout;
    ShowEmailLabel: TLabel;
    ShowEmailSwitch: TSwitch;
    ShowEmailCircle: TCircle;
    ShowEmailImage: TImage;
    DoneButton: TButton;
    BackgroundRect: TRectangle;
    Label1: TLabel;
    procedure VertScrollBox1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TSettingsFrame1.VertScrollBox1Resize(Sender: TObject);
begin
{$IF DEFINED(MSWINDOWS) OR (DEFINED(MACOS) AND NOT DEFINED(IOS))}
if DoneButton.Margins.Top=0 then
 begin
   DoneButton.Margins.Top := 10;
   DoneButton.Margins.Bottom := 10;
   DoneButton.Margins.Left := 5;
   DoneButton.Margins.Right := 5;
 end;
{$ENDIF}
end;

end.
