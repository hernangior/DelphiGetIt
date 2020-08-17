unit FrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Filter.Effects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects, FMX.ListBox, FMX.Ani, FMX.MultiView;

type

  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Button1: TButton;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    Layout6: TLayout;
    GridPanelLayout2: TGridPanelLayout;
    Line1: TLine;
    Layout8: TLayout;
    Label7: TLabel;
    Rectangle6: TRectangle;
    Layout9: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    CalloutRectangle1: TCalloutRectangle;
    Layout10: TLayout;
    Label10: TLabel;
    Rectangle7: TRectangle;
    Layout11: TLayout;
    Label11: TLabel;
    CalloutRectangle2: TCalloutRectangle;
    Layout12: TLayout;
    Label13: TLabel;
    Rectangle8: TRectangle;
    Layout13: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    CalloutRectangle3: TCalloutRectangle;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    Line2: TLine;
    Line3: TLine;
    Layout14: TLayout;
    Circle5: TCircle;
    Layout15: TLayout;
    Label12: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout5: TLayout;
    Layout16: TLayout;
    Circle3: TCircle;
    Pie1: TPie;
    Circle1: TCircle;
    Layout17: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Rectangle4: TRectangle;
    Label6: TLabel;
    Layout7: TLayout;
    StyleBook1: TStyleBook;
    Layout18: TLayout;
    Circle2: TCircle;
    Pie2: TPie;
    Circle4: TCircle;
    Layout19: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    Rectangle5: TRectangle;
    Label5: TLabel;
    FloatKeyAnimation1: TFloatKeyAnimation;
    FloatKeyAnimation2: TFloatKeyAnimation;
    MultiView1: TMultiView;
    Rectangle9: TRectangle;
    Label16: TLabel;
    Label17: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Circle5Click(Sender: TObject);
    procedure FloatKeyAnimation1Finish(Sender: TObject);
    procedure FloatKeyAnimation2Finish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      ListBoxItem : TListBoxItem;
      BeginDate, EndDate : TDateTime;
  end;


var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Circle5Click(Sender: TObject);
begin
  FloatKeyAnimation1.Enabled := True;
  FloatKeyAnimation2.Enabled := True;
end;

procedure TForm1.FloatKeyAnimation1Finish(Sender: TObject);
begin
  FloatKeyAnimation1.Enabled := False;
end;

procedure TForm1.FloatKeyAnimation2Finish(Sender: TObject);
begin
  FloatKeyAnimation2.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MultiView1.HideMaster;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  lsDay, lsMonth, lsYear :string;
  liDay, I : Integer;

begin

  ListBox1.Items.Clear;
  ListBox1.BeginUpdate;

  BeginDate := strtodate(FormatDateTime('01/MM/YYYY',Date));
  EndDate   := incmonth(BeginDate,1)-1;
  lsDay := FormatDateTime('DD',EndDate);
  lsMonth := FormatDateTime('MM',BeginDate);
  lsYear := FormatDateTime('YYYY',BeginDate);

  liDay := StrToInt(lsDay);

  for I := 1 to liDay do
    begin
      ListboxItem                                           := TListBoxItem.Create(ListBox1);
      ListboxItem.Parent                                    := ListBox1;
      ListboxItem.CanFocus                                  := False;
      ListboxItem.HitTest                                   := False;
      ListboxItem.Height                                    := 50;
      ListboxItem.Width                                     := 64;
      ListboxItem.StyleLookup                               := 'ListBoxItem1Style1';
      ListboxItem.Name                                      := 'Listboxdate' + IntToStr(ListboxItem.Index);
      ListboxItem.Margins.Bottom                            := 0;
      ListboxItem.Margins.Left                              := 0;
      ListboxItem.Margins.Right                             := 0;
      ListboxItem.Text                                      := IntToStr(I);

      case DayOfWeek(StrToDate(IntToStr(i)+'/'+lsMonth+'/'+lsYear)) of
        1 : ListboxItem.ItemData.Detail := 'Sun';
        2 : ListboxItem.ItemData.Detail := 'Mon';
        3 : ListboxItem.ItemData.Detail := 'Tue';
        4 : ListboxItem.ItemData.Detail := 'Wed';
        5 : ListboxItem.ItemData.Detail := 'Thu';
        6 : ListboxItem.ItemData.Detail := 'Fri';
        7 : ListboxItem.ItemData.Detail := 'Sat';
      end;
    end;

  ListBox1.EndUpdate;
end;

procedure TForm1.Label17Click(Sender: TObject);
begin
  Close;
end;

end.
