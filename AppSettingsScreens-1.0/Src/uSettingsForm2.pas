//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSettingsForm2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uSettingsFrame2,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2Settings = class(TForm)
    EmeraldCrystalStyleBook: TStyleBook;
    SettingsFrame21: TSettingsFrame2;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2Settings: TForm2Settings;

implementation

{$R *.fmx}

end.
