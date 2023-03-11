unit ComPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, jpeg, pngimage;

type
  TfrmComPort = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cmbBaudRate: TComboBox;
    cmbComPort: TComboBox;
    imgConn2: TImage;
    imgConn1: TImage;
    Edit1: TEdit;
    procedure imgConn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgConn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgConn1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComPort: TfrmComPort;





implementation
uses Nikon_Model,Gb_func,m_Module, Config_File;
{$R *.dfm}

procedure TfrmComPort.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
        Resize := false;
end;

procedure TfrmComPort.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        edit1.SetFocus;
end;

procedure TfrmComPort.imgConn1Click(Sender: TObject);
begin
        Read_Or_WriteFile('W CONNECTION');
end;

procedure TfrmComPort.imgConn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        imgConn1.Visible := false;
end;

procedure TfrmComPort.imgConn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        imgConn1.Visible := true;
end;

end.
