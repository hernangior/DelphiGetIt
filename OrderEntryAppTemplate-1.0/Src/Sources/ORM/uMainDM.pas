unit uMainDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataClasses, FireDAC.VCLUI.Wait,
  System.UITypes, Generics.Collections;

type
  TMainDM = class(TDataModule)
    MainFDConnection: TFDConnection;
    MainQuery: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    fCategories : TCategoryCollection;
    fModifierCategories : TCategoryCollection;
    fModifiers : TDictionary<integer, TModifier>;
    fRooms : TRoomCollection;
    fUsers : TUserCollection;

    procedure LoadCategories;
    procedure LoadModifiers;
    procedure LoadRooms;
    procedure LoadUsers;
  public
    { Public declarations }
    function GetMenuList(const Category : integer): TDishCollection;
    function GetTables(const Room : integer):TTableCollection;
    function CreateDummyOrder: TOrder;

    property Categories : TCategoryCollection read fCategories;
    property ModifierCategories : TCategoryCollection read fModifierCategories;
    property Rooms : TRoomCollection read fRooms;
    property Users : TUserCollection read fUsers;
  end;

var
  MainDM: TMainDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TMainDM.CreateDummyOrder: TOrder;
begin
  Result := TOrder.Create;
  Result.Date := Now;
  Randomize;
  Result.CustomerName := 'Sample customer ' + IntToStr(Random(100));
  Result.ID := Random(100000);
  Result.Guests := random(6);
end;

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
  fCategories := TCategoryCollection.Create;
  fModifierCategories := TCategoryCollection.Create;
  fModifiers := TDictionary<integer, TModifier>.Create;
  fRooms := TRoomCollection.Create;
  fUsers := TUserCollection.Create;
  MainFDConnection.Params.Clear;
  MainFDConnection.Params.Add('DriverID=SQLite');
  MainFDConnection.Params.Add('Database=db\oe_template.db');
  MainFDConnection.Connected := true;
  LoadCategories;
  LoadModifiers;
  LoadRooms;
  LoadUsers;
end;

procedure TMainDM.DataModuleDestroy(Sender: TObject);
begin
  fCategories.Clear;
  FreeAndNil(fCategories);
  fModifierCategories.Clear;
  FreeAndNil(fModifierCategories);
  fModifiers.Clear;
  FreeAndNil(fModifiers);
  fRooms.Clear;
  FreeAndNil(fRooms);
  fUsers.Clear;
  FreeAndNil(fUsers);
end;

function TMainDM.GetMenuList(const Category: integer): TDishCollection;
var
  lDish : TDish;
  lList : TStringList;
  i : integer;
begin
  Result := TDishCollection.Create;
  MainQuery.SQL.Clear;
  try
    try
      if Category = 0 then
        MainQuery.Open('SELECT * FROM dishes')
      else
        MainQuery.Open('SELECT * FROM dishes WHERE category = ' + Category.ToString);
      while not MainQuery.Eof do
      begin
        lDish := TDish.Create;
        lDish.Name := MainQuery.FieldByName('name').AsString;
        lDish.ID := MainQuery.FieldByName('id').AsInteger;
        lDish.Category := MainQuery.FieldByName('category').AsInteger;
        lDish.Cost := MainQuery.FieldByName('cost').AsCurrency;
        if not MainQuery.FieldByName('color').IsNull then
          lDish.Color := TAlphaColor(MainQuery.FieldByName('color').AsString.ToInteger());

        if not MainQuery.FieldByName('modifiers').IsNull then
        begin
          lList := TStringList.Create;
          lList.CommaText := MainQuery.FieldByName('modifiers').AsString;
          for i := 0 to lList.Count - 1 do
            lDish.Modifiers.Add(fModifiers[lList[i].ToInteger]);
        end;
        Result.Add(lDish);
        MainQuery.Next;
      end;
    except

    end;
  finally
    MainQuery.Close;
  end;
end;

function TMainDM.GetTables(const Room: integer): TTableCollection;
var
  lTable : TTableObject;
begin
  try
    Result := TTableCollection.Create;
    try
      MainQuery.SQL.Clear;
      MainQuery.Open('SELECT * FROM tables WHERE roomid = ' + Room.ToString);
      while not MainQuery.Eof do
      begin
        lTable := TTableObject.Create;
        lTable.Number := MainQuery.FieldByName('number').AsInteger;
        lTable.Room := MainQuery.FieldByName('roomid').AsInteger;
        lTable.Orientation := MainQuery.FieldByName('orientation').AsInteger;
        lTable.Size := MainQuery.FieldByName('size').AsInteger;
        lTable.ID := MainQuery.FieldByName('id').AsInteger;
        lTable.&Type := MainQuery.FieldByName('type').AsInteger;
        lTable.Column := MainQuery.FieldByName('posx').AsInteger;
        lTable.Row := MainQuery.FieldByName('posy').AsInteger;
        Result.Add(lTable);
        MainQuery.Next;
      end;
    except

    end;
  finally
    MainQuery.Close;
  end;
end;

procedure TMainDM.LoadCategories;
var
  lCategory : TCategory;
begin
  MainQuery.SQL.Clear;
  try
    try
      MainQuery.Open('SELECT * FROM categories');
      while not MainQuery.Eof do
      begin
        lCategory := TCategory.Create;
        lCategory.Name := MainQuery.FieldByName('name').AsString;
        lCategory.ID := MainQuery.FieldByName('id').AsInteger;
        if MainQuery.FieldByName('ismodifier').AsBoolean then
          fModifierCategories.Add(lCategory)
        else
          fCategories.Add(lCategory);
        MainQuery.Next;
      end;
    except

    end;
  finally
    MainQuery.Close;
  end;

end;

procedure TMainDM.LoadModifiers;
var
  lModifier : TModifier;
begin
  try
    MainQuery.SQL.Clear;
    MainQuery.Open('SELECT * FROM modifiers');
    try
      while not MainQuery.Eof do
      begin
        lModifier := TModifier.Create;
        lModifier.Name := MainQuery.FieldByName('name').AsString;
        lModifier.ID := MainQuery.FieldByName('id').AsInteger;
        lModifier.Cost := MainQuery.FieldByName('cost').AsCurrency;
        lModifier.&Type := TModifierType(MainQuery.FieldByName('type').AsInteger);
        fModifiers.Add(lModifier.ID, lModifier);
        MainQuery.Next;
      end;
    except

    end;
  finally
    MainQuery.Close;
  end;

end;

procedure TMainDM.LoadRooms;
var
  lRoom : TRoom;
begin
  try
    try
      MainQuery.SQL.Clear;
      MainQuery.Open('SELECT * FROM rooms');
      while not MainQuery.Eof do
      begin
        lRoom := TRoom.Create;
        lRoom.Name := MainQuery.FieldByName('name').AsString;
        lRoom.ID := MainQuery.FieldByName('id').AsInteger;
        lRoom.Width := MainQuery.FieldByName('width').AsInteger;
        lRoom.Height := MainQuery.FieldByName('height').AsInteger;
        fRooms.Add(lRoom);
        MainQuery.Next;
      end;
    except

    end;
  finally
    MainQuery.Close;
  end;
end;

procedure TMainDM.LoadUsers;
var
  lUser : TUser;
  pic : TStream;
  buf : pointer;
begin
  try
    MainQuery.SQL.Clear;
    MainQuery.Open('SELECT * FROM users');
    try
      lUser := TUser.Create;
      lUser.ID := MainQuery.FieldByName('id').AsInteger;
      lUser.Name := MainQuery.FieldByName('firstname').AsString + ' ' +
                    MainQuery.FieldByName('lastname').AsString;
      lUser.Role := TUserRoles(MainQuery.FieldByName('role').AsInteger);
      lUser.PIN := MainQuery.FieldByName('pin').AsString;
      if not MainQuery.FieldByName('picture').IsNull then
      begin
        pic := MainQuery.CreateBlobStream(MainQuery.FieldByName('picture'), TBlobStreamMode.bmRead);
        pic.Position := 0;
        lUser.PicSize := pic.Size;
        GetMem(buf, lUser.PicSize);
        lUser.Picture := buf;
        pic.Read(lUser.Picture^, lUser.PicSize);
        FreeAndNil(pic);
      end;
      fUsers.Add(lUser);
    except

    end;
  finally

  end;
end;

end.
