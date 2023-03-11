unit m_Module;

interface

uses
  SysUtils, Classes, OoMisc, AdPort, AdPacket;

type
  TModule = class(TDataModule)
    Com: TApdComPort;
    packetDa: TApdDataPacket;
    ApdDataPacket3: TApdDataPacket;
    Packet2: TApdDataPacket;
    procedure DataModuleCreate(Sender: TObject);
    procedure packetDaStringPacket(Sender: TObject; Data: AnsiString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Module: TModule;

implementation
 uses Nikon_Model, Gb_Param, Config_File, Gb_func;
{$R *.dfm}

procedure TModule.DataModuleCreate(Sender: TObject);
begin
        PacketDa.StartString := '#DA';
        PacketDa.EndString    := 'JFF00';
end;

procedure TModule.packetDaStringPacket(Sender: TObject; Data: AnsiString);
var
      str : string;
      I   : word;
begin
        str := data;
        frmMain.mm.Text := data;
        if frmMain.mm.Text <> '' then
        begin
                SeparateData(str);
        end;
end;

end.
