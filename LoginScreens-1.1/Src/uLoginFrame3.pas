//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uLoginFrame3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TLoginFrame3 = class(TFrame)
    BackgroundRect: TRectangle;
    VertScrollBox1: TVertScrollBox;
    HeaderLayout: TLayout;
    FormLayout: TLayout;
    UsernameEdit: TEdit;
    PasswordEdit: TEdit;
    ForgotLayout: TLayout;
    CreateAccountTextBTN: TText;
    ForgotPasswordTextBTN: TText;
    FooterLayout: TLayout;
    LoginRectBTN: TRectangle;
    CenterLayout: TLayout;
    TitleText: TText;
    SubtitleText: TText;
    UsernameUnderLine: TLine;
    PasswordUnderLine: TLine;
    LoginButtonText: TText;
    BackgroundImage: TImage;
    LogoImage: TImage;
    LockImage: TImage;
    UserImage: TImage;
    LogoBackgroundCircle: TCircle;
    LogoLayout: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
