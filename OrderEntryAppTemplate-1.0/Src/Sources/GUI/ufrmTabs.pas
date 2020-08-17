unit ufrmTabs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  System.Threading, FMX.DialogService,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  uFrameLeftOrderMenu, FMX.Layouts, uFrameTabsList, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, uTablesFrame, uBaseForm, uDataClasses,
  uMainDM, uModifiersForm, uOrderEntryForm;

type
  TTabsMgmtForm = class(TForm)
    FrameLeftOrderMenu1: TFrameLeftOrderMenu;
    RightSideLayout: TLayout;
    TopButtonsLayout: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    btnDone: TButton;
    btnOpenTabs: TSpeedButton;
    btnRoomName: TSpeedButton;
    FramesLayout: TLayout;
    imgPointOSLogo: TImage;
    TablesFrame1: TTablesFrame;
    FrameTabsList1: TFrameTabsList;
    procedure FormShow(Sender: TObject);
    procedure btnOpenTabsClick(Sender: TObject);
    procedure btnRoomNameClick(Sender: TObject);
    procedure btnDoneClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fRoom : TRoom;
    fUser : TUser;
    fOrders : TOrderCollection;

    procedure itmNewOrderClick(Sender: TObject);
    procedure itmShowMyTabsClick(Sender: TObject);
    procedure itmNoSaleClick(Sender: TObject);
    procedure itmGratuityClick(Sender: TObject);
    procedure itmManageChecksClick(Sender: TObject);

    procedure OpenOrderEntry(aOrder : TOrder);
    procedure CreateNewOrder(Sender : TObject);
    procedure TabSelected(Sender : TObject);
    procedure SetRoom(const Value: TRoom);
    procedure SetUser(const Value: TUser);
    procedure RefreshTabs;
  public
    property User: TUser read FUser write SetUser;
    property Room: TRoom read fRoom write SetRoom;
  end;

function ShowTabsMgmtForm(): TTabsMgmtForm;

var
  TabsMgmtForm: TTabsMgmtForm;

implementation

{$R *.fmx}

//uses uModifiersForm, uOrderEntryForm;

function ShowTabsMgmtForm(): TTabsMgmtForm;
begin
  if Assigned(TabsMgmtForm) then
    FreeAndNil(TabsMgmtForm);

  TabsMgmtForm:= TTabsMgmtForm.Create(Application);
  Result:= TabsMgmtForm;
end;

procedure TTabsMgmtForm.btnDoneClick(Sender: TObject);
begin
  FormResult := mrOK;
  ModalResult := mrOK;
  Close;
end;

procedure TTabsMgmtForm.btnOpenTabsClick(Sender: TObject);
begin
  TablesFrame1.Visible := false;
  FrameTabsList1.Visible := true;
end;

procedure TTabsMgmtForm.btnRoomNameClick(Sender: TObject);
begin
  FrameTabsList1.Visible := false;
  TablesFrame1.Visible := true;
end;

procedure TTabsMgmtForm.FormDestroy(Sender: TObject);
begin
  fOrders.Clear;
  FreeAndNil(fOrders);
end;

procedure TTabsMgmtForm.FormShow(Sender: TObject);
begin
  Room:= MainDM.Rooms[0];
  User:= MainDM.Users[0];

  FrameLeftOrderMenu1.OnNewOrderItemClick:= itmNewOrderClick;
  FrameLeftOrderMenu1.OnShowMyTabsItemClick:= itmShowMyTabsClick;
  FrameLeftOrderMenu1.OnNoSaleItemClick:= itmNoSaleClick;
  FrameLeftOrderMenu1.OnGratuityItemClick:= itmGratuityClick;
  FrameLeftOrderMenu1.OnManageChecksItemClick:= itmManageChecksClick;
  FrameTabsList1.OnTabClick:= TabSelected;
  fOrders:= TOrderCollection.Create;

  FrameLeftOrderMenu1.IsNarrowMenu:= true;
end;

{$region 'Menu Item OnClick Event Handlers'}
procedure TTabsMgmtForm.itmGratuityClick(Sender: TObject);
begin

end;

procedure TTabsMgmtForm.itmManageChecksClick(Sender: TObject);
begin

end;

procedure TTabsMgmtForm.itmNewOrderClick(Sender: TObject);
begin
  if Assigned(TablesFrame1.SelectedTable) then
    CreateNewOrder(TablesFrame1.SelectedTable)
  else
    TDialogService.ShowMessage('Please, select table first.');
end;

procedure TTabsMgmtForm.itmNoSaleClick(Sender: TObject);
begin

end;

procedure TTabsMgmtForm.itmShowMyTabsClick(Sender: TObject);
begin

end;

{$endregion}


procedure TTabsMgmtForm.OpenOrderEntry(aOrder: TOrder);
var
  lOrderEntryForm : TOrderEntryForm;
begin
  lOrderEntryForm:= ShowOrderEntryForm();
  lOrderEntryForm.Order.Assign(aOrder);
  TTask.Run(
    procedure ()
    begin
      FrameTabsList1.Tabslb.ItemIndex := -1;
      TablesFrame1.TablesLB.ItemIndex := -1;
    end);
  lOrderEntryForm.RunForm(
    procedure()
    begin
      if lOrderEntryForm.FormResult = mrOk then
      begin
        if not lOrderEntryForm.Order.IsEmpty then
          if fOrders.ContainsOrder(lOrderEntryForm.Order) then
          begin
            if lOrderEntryForm.Order.Paid then
              fOrders.Remove(fOrders.GetOrder(lOrderEntryForm.Order.ID))
            else
              fOrders.GetOrder(lOrderEntryForm.Order.ID).Assign(lOrderEntryForm.Order);
            FreeAndNil(aOrder);
          end
          else
          begin
            aOrder.Assign(lOrderEntryForm.Order);
            fOrders.Add(aOrder);
          end;
      end
      else
        if aOrder.IsEmpty then
          FreeAndNil(aOrder);
      RefreshTabs;
    end
  );
end;

procedure TTabsMgmtForm.RefreshTabs;
var
  i : integer;
begin
  FrameTabsList1.Clear;
  for i := 0 to pred(fOrders.Count) do
  begin
    FrameTabsList1.AddListItem(TTabsItem.Create(fOrders[i].CustomerName,
                                                fOrders[i].Amount,
                                                fOrders[i].Date,
                                                fOrders[i].ID,
                                                TOrderType.otRestaurant));
  end;
  FrameLeftOrderMenu1.labOpenTabs.Text := fOrders.Count.ToString;
end;

procedure TTabsMgmtForm.SetRoom(const Value: TRoom);
var
  lTables : TTableCollection;
  i : integer;

begin
  fRoom := Value;
  TablesFrame1.Room := Value;
  btnRoomName.Text := Value.Name;
  lTables := MainDM.GetTables(fRoom.ID);
  for i := 0 to lTables.Count - 1 do
    TablesFrame1.Tables.Add(
      TVisualTableObject.Create(lTables[i].Number,
                                lTables[i].Column,
                                lTables[i].Row,
                                TTableType(lTables[i].&Type),
                                TTableSize(lTables[i].Size),
                                TTableOrientation(lTables[i].Orientation)));
  lTables.Clear;
  FreeAndNil(lTables);
end;

procedure TTabsMgmtForm.SetUser(const Value: TUser);
var
  pic : TMemoryStream;
begin
  fUser := Value;
  FrameLeftOrderMenu1.tUserName.Text := fUser.Name;
  if fUser.PicSize <> 0 then
  begin
    pic := TMemoryStream.Create;
    pic.Size := fUser.PicSize;
    pic.Write(fUser.Picture^, fUser.PicSize);
    pic.Position := 0;
    FrameLeftOrderMenu1.ProfilePhotoCircle.Fill.Bitmap.Bitmap.LoadFromStream(pic);
    FreeAndNil(pic);
  end;
end;

procedure TTabsMgmtForm.CreateNewOrder(Sender: TObject);
var
  lTable : TVisualTableObject;
  lOrder : TOrder;
begin
  lTable := TVisualTableObject(Sender);
  lOrder := MainDM.CreateDummyOrder;
  lOrder.TableNumber := lTable.TableNumber;
  OpenOrderEntry(lOrder);
end;

procedure TTabsMgmtForm.TabSelected(Sender: TObject);
var
  lTab : TTabsItem;
begin
  lTab := TTabsItem(Sender);
  OpenOrderEntry(fOrders.GetOrder(lTab.OrderNumber));
  TTask.Run(
    procedure ()
    begin
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          FrameTabsList1.Tabslb.ItemIndex := -1;
        end);
    end);
end;

end.
