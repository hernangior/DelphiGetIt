unit uDMUnit;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, System.ImageList, FMX.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.DateUtils;

type
  TDMUnit = class(TDataModule)
    FDMemTable1: TFDMemTable;
    FDMemTable1ID: TIntegerField;
    FDMemTable1Image: TBlobField;
    ImageListContactsExample: TImageList;
    FDMemTable1LinkTo: TIntegerField;
    FDMemTable1Name: TStringField;
    FDMemTable1Description: TStringField;
    FDMemTable1Opacity: TFloatField;
    FDMemTable1Price: TFloatField;
    FDMemTable2: TFDMemTable;
    IntegerField1: TIntegerField;
    BlobField1: TBlobField;
    StringField1: TStringField;
    FDMemTable2Discount: TIntegerField;
    FDMemTable2ExpiresDate: TDateField;
    FDMemTable2GMTPlus: TIntegerField;
    ilCoupons: TImageList;
    FDMemTable3: TFDMemTable;
    IntegerField2: TIntegerField;
    BlobField2: TBlobField;
    StringField2: TStringField;
    FDMemTable1LageImage: TBlobField;
    ilMenuBigImgs: TImageList;
    FDMemTable4: TFDMemTable;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    FDMemTable4Price: TFloatField;
    FDMemTable4OwnerItemID: TIntegerField;
    FDMemTable4IsSelected: TBooleanField;
    FDMemTable5: TFDMemTable;
    IntegerField4: TIntegerField;
    BlobField3: TBlobField;
    FDMemTable5Name: TStringField;
    FDMemTable6: TFDMemTable;
    IntegerField5: TIntegerField;
    StringField4: TStringField;
    StringField9: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    //
  public
    (* PROPERTIES *)
  end;

var
  DMUnit: TDMUnit;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDMUnit.DataModuleCreate(Sender: TObject);
begin
  //
end;

end.
