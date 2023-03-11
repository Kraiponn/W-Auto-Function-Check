unit Nikon_Model;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, TeeProcs, TeEngine, Chart,
  Grids, Series, Menus, jpeg, ButtonGroup, CategoryButtons, ActnList, ActnMan,
  ToolWin, ActnCtrls, Ribbon, RibbonLunaStyleActnCtrls,
  PlatformDefaultStyleActnCtrls, pngimage,ShellApi;

type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    stt_main: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenFile1: TMenuItem;
    ool1: TMenuItem;
    Help1: TMenuItem;
    AboutSoftware1: TMenuItem;
    Option1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    imgBackGround: TImage;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Timer1: TTimer;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel3: TCategoryPanel;
    edtVt: TEdit;
    lblVt: TLabel;
    lblVm: TLabel;
    edtVm: TEdit;
    mm: TMemo;
    mm2: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    ActionManager1: TActionManager;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtComment: TEdit;
    Image3: TImage;
    imgScomm: TImage;
    GroupBox2: TGroupBox;
    Chart1: TChart;
    GroupBox3: TGroupBox;
    imgInitial_min2: TImage;
    imgInitial_min1: TImage;
    imgRelease_min2: TImage;
    imgRelease_min1: TImage;
    imgInitial_max2: TImage;
    imgInitial_max1: TImage;
    imgRelease_max2: TImage;
    imgRelease_max1: TImage;
    imgDiaphMove_min2: TImage;
    imgDiaphMove_min1: TImage;
    edtSw: TEdit;
    lblSw: TLabel;
    imgDiaphMove_max2: TImage;
    imgDiaphMove_max1: TImage;
    imgCommSet2: TImage;
    imgCommSet1: TImage;
    imgSaveErr2: TImage;
    imgSaveErr1: TImage;
    Series3: TFastLineSeries;
    Series1: TFastLineSeries;
    CategoryPanel1: TCategoryPanel;
    edtAv_max: TEdit;
    Label5: TLabel;
    edtAv_min: TEdit;
    Label6: TLabel;
    imgSaveAv2: TImage;
    imgSaveAv1: TImage;
    spdNotePad: TSpeedButton;
    spdCal: TSpeedButton;
    Series2: TFastLineSeries;
    Label4: TLabel;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    edtAv_data: TEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    spdChkCom: TSpeedButton;
    spdConfigPort: TSpeedButton;
    imgStart2: TImage;
    imgStart1: TImage;
    Series5: TFastLineSeries;
    Series4: TFastLineSeries;
    Series6: TFastLineSeries;
    procedure Exit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgStart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgStart1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSaveErr1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSaveErr1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure imgSavePulseClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure spdConfigPortClick(Sender: TObject);
    procedure ImgSaveDiaph1Click(Sender: TObject);
    procedure imgSaveErr1Click(Sender: TObject);
    procedure imgScommMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgScommMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgInitial_min1Click(Sender: TObject);
    procedure imgInitial_max1Click(Sender: TObject);
    procedure imgRelease_min1Click(Sender: TObject);
    procedure imgRelease_max1Click(Sender: TObject);
    procedure imgDiaphMove_min1Click(Sender: TObject);
    procedure imgStart1Click(Sender: TObject);
    procedure spdChkComClick(Sender: TObject);
    procedure spdCalClick(Sender: TObject);
    procedure spdNotePadClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure imgInitial_min1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgInitial_min1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgRelease_min1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgRelease_min1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDiaphMove_min1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDiaphMove_min1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgInitial_max1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgInitial_max1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgRelease_max1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgRelease_max1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDiaphMove_max1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDiaphMove_max1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCommSet1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCommSet1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSaveAv1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSaveAv1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSaveAv1Click(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;





var
  frmMain: TfrmMain;




implementation
uses All_Image, Gb_func, Gb_param, Gb_Graph_Func, ComPort, Config_File,
     m_Module;


{$R *.dfm}


procedure TfrmMain.b5Click(Sender: TObject);
begin
        Module.Com.PutString('#DA02,05,05,3.568,'+edit7.Text+#13+'JFF00');
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
         Series1.Clear;
end;

procedure TfrmMain.Button4Click(Sender: TObject);

begin
        Module.Com.PutString(strD1+#13+str2);
end;

procedure TfrmMain.Button5Click(Sender: TObject);
begin
        Module.Com.PutString(strD2+#13+str2);
end;

procedure TfrmMain.b1Click(Sender: TObject);
begin
        add_DataPacket := 0;
        Module.Com.PutString('#DA02,05,01,3.568,'+edit3.Text+#13+'JFF00');
end;

procedure TfrmMain.b2Click(Sender: TObject);
begin
       Module.Com.PutString('#DA02,05,02,3.568,'+edit4.Text+#13+'JFF00');
end;

procedure TfrmMain.b3Click(Sender: TObject);
begin
       Module.Com.PutString('#DA02,05,03,3.568,'+edit5.Text+#13+'JFF00');
end;

procedure TfrmMain.b4Click(Sender: TObject);
begin
        Module.Com.PutString('#DA02,05,04,3.568,'+edit6.Text+#13+'JFF00');
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

        Seek_ComNo();
        Read_Or_WriteFile('R CONNECTION');
        Read_Or_WriteFile('R SPEC');
        flag_SetDat := false;
        cnt := 0;
        add_DataPacket := 0;
end;

procedure TfrmMain.imgCommSet1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgCommSet1.Visible := false;
end;

procedure TfrmMain.imgCommSet1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgCommSet1.Visible := true;
end;

procedure TfrmMain.imgDiaphMove_max1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgDiaphMove_max1.Visible := false;
end;

procedure TfrmMain.imgDiaphMove_max1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgDiaphMove_max1.Visible := true;
end;

procedure TfrmMain.imgDiaphMove_min1Click(Sender: TObject);
begin
         //-------------- Send PC Setting Command
         //Module.Com.PutString('PC SETTING'+#13);
end;

procedure TfrmMain.imgDiaphMove_min1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgDiaphMove_min1.Visible := false;
end;

procedure TfrmMain.imgDiaphMove_min1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgDiaphMove_min1.Visible := true;
end;

procedure TfrmMain.imgRelease_min1Click(Sender: TObject);
begin
         //-------------- Send DIAPH Command
         //Module.Com.PutString('DIAPH'+#13);
end;

procedure TfrmMain.imgRelease_min1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgRelease_min1.Visible := false;
end;

procedure TfrmMain.imgRelease_min1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgRelease_min1.Visible := true;
end;

procedure TfrmMain.imgSaveAv1Click(Sender: TObject);
begin
         Read_Or_WriteFile('W SPEC');
end;

procedure TfrmMain.imgSaveAv1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgSaveAv1.Visible := false;
end;

procedure TfrmMain.imgSaveAv1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgSaveAv1.Visible := true;
end;

procedure TfrmMain.imgRelease_max1Click(Sender: TObject);
begin
         //-------------- Send Life Command
         //Module.Com.PutString('LIFE'+#13);
end;

procedure TfrmMain.imgRelease_max1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgRelease_max1.Visible := false;
end;

procedure TfrmMain.imgRelease_max1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgRelease_max1.Visible := true;
end;

procedure TfrmMain.imgInitial_min1Click(Sender: TObject);
begin
         //-------------- Send Release Command
         //Module.Com.PutString('RELEASE'+#13);
end;

procedure TfrmMain.imgInitial_min1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgInitial_min1.Visible := false;
end;

procedure TfrmMain.imgInitial_min1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        imgInitial_min1.Visible := true;
end;

procedure TfrmMain.ImgSaveDiaph1Click(Sender: TObject);
begin
         Read_Or_WriteFile('W SPEC');
end;

procedure TfrmMain.imgSaveErr1Click(Sender: TObject);
begin
         Read_Or_WriteFile('W SPEC');
end;

procedure TfrmMain.imgSaveErr1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgSaveErr1.Visible := false;
         imgSaveErr1.Enabled := false;
end;

procedure TfrmMain.imgSaveErr1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgSaveErr1.Enabled := true;
         imgSaveErr1.Visible := true;
end;

procedure TfrmMain.imgSavePulseClick(Sender: TObject);
begin
         Module.Com.PutString(strD3+#13+str2);
end;

procedure TfrmMain.imgScommMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgScomm.Visible := false;
end;

procedure TfrmMain.imgScommMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
          imgScomm.Visible := true;
end;

procedure TfrmMain.imgInitial_max1Click(Sender: TObject);
begin
         //-------------- Send Sequence Request Command
         //Module.Com.PutString('SEQUENCE'+#13);
end;

procedure TfrmMain.imgInitial_max1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
         imgInitial_max1.Visible := false;
end;

procedure TfrmMain.imgInitial_max1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgInitial_max1.Visible := true;
end;

procedure TfrmMain.imgStart1Click(Sender: TObject);
begin
         //-------------- Send Auto Command
         //Module.Com.PutString('Auto'+#13);

         //SendData();
         //TestProtGraph();
         Series1.Clear;
         add_DataPacket := 0;
         b1.Click;
         b2.Click;
         b3.Click;
         b4.Click;
         b5.Click;
end;

procedure TfrmMain.imgStart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgStart1.Visible := false;
end;

procedure TfrmMain.imgStart1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
         imgStart1.Visible := true;
end;

procedure TfrmMain.spdCalClick(Sender: TObject);
begin
        ShellExecute(0,'open',pchar('Calc'),nil,nil,SW_NORMAL);
end;

procedure TfrmMain.spdChkComClick(Sender: TObject);
begin
        ShellExecute(0,'open',pchar('devmgmt.msc'),nil,nil,SW_NORMAL);
end;

procedure TfrmMain.spdConfigPortClick(Sender: TObject);
begin
        frmComPort.ShowModal;
end;

procedure TfrmMain.spdNotePadClick(Sender: TObject);
begin
       ShellExecute(0,'open',pchar('notepad'),nil,nil,SW_NORMAL);
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
        stt_Main.Panels[0].Text := '             '+
                                   FormatDateTime('HH:MM:SS',now);
        stt_Main.Panels[1].Text := 'Date: '+FormatDateTime('YYYY-MM-DD',now);
end;

end.
