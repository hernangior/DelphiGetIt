//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSettingsForm3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uSettingsFrame3;

type
  TForm3Settings = class(TForm)
    RadiantStyleBook: TStyleBook;
    SettingsFrame31: TSettingsFrame3;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3Settings: TForm3Settings;

implementation

{$R *.fmx}

end.
