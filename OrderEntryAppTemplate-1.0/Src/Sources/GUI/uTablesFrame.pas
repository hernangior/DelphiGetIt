unit uTablesFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListBox, System.ImageList, FMX.ImgList, Generics.Collections, uDataClasses;


const
  _defGridW = 5;
  _defGridH = 4;
  _defRemainingTime = 5;
  _idxBase = 3;
  _imgOffset = 9;

type

  TTableType = (tblCircle, tblOval, tblRectangle, tblSquare);
  TTableSize = (tblLarge, tblMedium, tblSmall);
  TTableOrientation = (tblHorizontal, tblVertical);
  TTableStatus = (tblWaiting, tblOpen);

  TVisualTableObject = class
  private
    fDisplay : TListBoxItem;
    fStatus : TTableStatus;
    fRemainTime : integer;

    procedure SetStatus(const Value: TTableStatus);
    procedure SetRemainTime(const Value: integer);

  public
    TableType : TTableType;
    Orientation : TTableOrientation;
    TableNumber : integer;
    Row : integer;
    Column : integer;
    Size : TTableSize;
    constructor Create(TableNumber : integer;
                       PosX, PosY : integer;
                       TableType : TTableType;
                       Size : TTableSize;
                       Orientation : TTableOrientation = TTableOrientation.tblHorizontal);

    property Status : TTableStatus read fStatus write SetStatus;
    property RemainTime : integer read fRemainTime write SetRemainTime;
  end;

  TTablesFrame = class(TFrame)
    TablesLB: TListBox;
    TablesImages: TImageList;
  private
    fTables : TList<TVisualTableObject>;
    fCols : integer;
    fRows : integer;
    fOnTableClick : TNotifyEvent;
    fSelectedTable : TVisualTableObject;
    fRoom : TRoom;

    procedure TablesChanged(Sender: TObject; const Item: TVisualTableObject; Action: TCollectionNotification);
    procedure DoTableClick(Sender : TObject);
    procedure SetRoom(const Value: TRoom);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure SetGridSize(Cols, Rows : integer);
    procedure Clear;

    property Tables : TList<TVisualTableObject> read fTables;

    property OnTableClick : TNotifyEvent read fOnTableClick write fOnTableClick;
    property SelectedTable : TVisualTableObject read fSelectedTable;
    property Room : TRoom read fRoom write SetRoom;
  end;

implementation

{$R *.fmx}

{ TTablesFrame }

procedure TTablesFrame.Clear;
begin
  fTables.Clear;
  SetGridSize(fCols, fRows);
end;

constructor TTablesFrame.Create(AOwner: TComponent);
begin
  inherited;
  fTables := TList<TVisualTableObject>.Create;
  SetGridSize(_defGridW, _defGridH);
  fTables.OnNotify := TablesChanged;
end;

destructor TTablesFrame.Destroy;
begin
  FreeAndNil(fTables);
  inherited;
end;

procedure TTablesFrame.DoTableClick(Sender: TObject);
begin
  fSelectedTable := TListBoxItem(Sender).TagObject as TVisualTableObject;
  if Assigned(fOnTableClick) then
    fOnTableClick(fSelectedTable);
end;

procedure TTablesFrame.SetGridSize(Cols, Rows: integer);
var
  x, y : integer;
  lItem : TListBoxItem;
begin
  fCols := Cols;
  fRows := Rows;
  fTables.Clear;
  TablesLB.BeginUpdate;
  try
    for x := 0 to fCols - 1 do
      for y := 0 to fRows - 1 do
      begin
        lItem := TListBoxItem.Create(Self);
        lItem.StyleLookup := 'TablesListboxItemEmptyStyle';
        lItem.Selectable := false;
        lItem.Enabled := false;
        lItem.OnClick := DoTableClick;
        TablesLB.AddObject(lItem);
      end;
  finally
    TablesLB.EndUpdate;
  end;

end;

procedure TTablesFrame.SetRoom(const Value: TRoom);
begin
  fRoom := Value;
  SetGridSize(fRoom.Width, fRoom.Height);
end;

procedure TTablesFrame.TablesChanged(Sender: TObject; const Item: TVisualTableObject;
  Action: TCollectionNotification);
var
  lItem : TListBoxItem;
  imgIdx : integer;
begin
  case Action of
    cnAdding:;
    cnAdded:
      begin
        if Item.Row > fRows then
        begin
          fTables.Remove(Item);
          raise EArgumentOutOfRangeException.Create('Row number is out of bounds!');
        end;
        if Item.Column > fCols then
        begin
          fTables.Remove(Item);
          raise EArgumentOutOfRangeException.Create('Column number is out of bounds!');
        end;
        lItem := TablesLB.ItemByIndex(Item.Row * Item.Column - 1);
        if Item.Status = tblOpen then
          lItem.StyleLookup := 'TablesOpenListboxItemStyle'
        else
          lItem.StyleLookup := 'TablesWaitingListboxItemStyle';
        lItem.Text := Translate('Table') + ' ' + Item.TableNumber.ToString;
        imgIdx := _idxBase * integer(Item.TableType);
        if (Item.TableType in [tblOval, tblRectangle]) and (Item.Orientation = tblVertical) then
          Inc(imgIdx, _imgOffset);
        Inc(imgIdx, integer(Item.Size));
        lItem.ImageIndex := imgIdx;
        lItem.Selectable := true;
        lItem.Enabled := true;
        lItem.TagObject := Item;
        Item.fDisplay := lItem;
      end;
    cnExtracting: ;
    cnExtracted: ;
    cnDeleting:;
    cnRemoved:
      begin
        try
          lItem := TablesLB.ItemByIndex(Item.Row * Item.Column - 1);
          lItem.StyleLookup := 'TablesListboxItemEmptyStyle';
          lItem.Selectable := false;
          lItem.Enabled := false;
          lItem.ImageIndex := -1;
          lItem.Text := '';
          lItem.TagObject := nil;
          Item.fDisplay := nil;
        except
        end;
      end;
  end;
end;

{ TTableObject }

constructor TVisualTableObject.Create(TableNumber : integer;
                       PosX, PosY : integer;
                       TableType : TTableType;
                       Size : TTableSize;
                       Orientation : TTableOrientation = TTableOrientation.tblHorizontal);
begin
  inherited Create;
  fRemainTime := _defRemainingTime;
  fStatus := tblOpen;
  Self.TableType := TableType;
  Self.Orientation := Orientation;
  Self.TableNumber := TableNumber;
  Self.Row := PosY;
  Self.Column := PosX;
  Self.Size := Size;
end;

procedure TVisualTableObject.SetRemainTime(const Value: integer);
begin
  fRemainTime := Value;
  if (fStatus = tblWaiting) and Assigned(fDisplay) then
    fDisplay.StylesData['StatusText.Text'] := fRemainTime.ToString + ' ' + Translate('min');
end;

procedure TVisualTableObject.SetStatus(const Value: TTableStatus);
begin
  fStatus := Value;
  if Assigned(fDisplay) then
    if fStatus = tblOpen then
    begin
      fDisplay.StyleLookup := 'TablesOpenListboxItemStyle';
      fDisplay.StylesData['StatusText.Text'] := Translate('Open');
    end
    else
    begin
      fDisplay.StyleLookup := 'TablesWaitingListboxItemStyle';
      fDisplay.StylesData['StatusText.Text'] := fRemainTime.ToString + ' ' + Translate('min');
    end;
end;


end.
