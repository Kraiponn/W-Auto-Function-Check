unit Gb_func;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, TeeProcs, TeEngine, Chart,
  Grids, Registry, Inifiles, StrUtils;

  //-------------------------------------------: Prototype
   Procedure Seek_ComNo();
   procedure Wait_ms(msecs : integer);

   procedure SendData1();
   procedure SendData2();
   procedure SendData3();
   procedure SendData4();
   procedure SendData5();
   procedure SendData();

   function SeparateData(tdata : string) : boolean;

implementation
 uses Nikon_Model, Gb_param, ComPort, m_Module, Config_File, Gb_Graph_Func;








//-------------------------------------------: Search ComPort
Procedure Seek_ComNo();
var
    slValueNames : TStringList;
    reg : TRegistry;
    i   : Integer;
begin
    with FrmMain do
    begin
        slValueNames := TStringList.Create;
        reg := TRegistry.Create;
        frmComPort.cmbComPort.Clear;

        try
            reg.RootKey := HKEY_LOCAL_MACHINE;
            if reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
            begin
                reg.GetValueNames(slValueNames);
                for i := 0 to Pred(slValueNames.Count) do
                begin
                    if reg.GetDataType(slValueNames.Strings[i]) = rdString then
                    begin
                        frmComPort.cmbComPort.Items.Append(reg.ReadString(slValueNames.Strings[i]));
                    end;
                end;
            end;
        finally
            reg.Free;
            slValueNames.Free;
        end;
    end;
end;




 ////////////////////////////////////////////////////////
//   Wait For Milisecond Unit                         //
//                                                    //
//  Can Use for ather program (Program BUSY when use) //
////////////////////////////////////////////////////////
procedure Wait_ms(msecs : integer);
var
    FirstTickCount : longint;
begin
        FirstTickCount := GetTickCount;
        repeat
            Application.ProcessMessages;
        until ((GetTickCount-FirstTickCount) >= Longint(msecs));
end;








procedure SendData1();
begin
       Module.Com.PutString('#DA00,05,01,3.568,-0.03'+#13+'JFF00');
end;

procedure SendData2();
begin
       Module.Com.PutString('#DA02,05,02,3.568,-0.03'+#13+'JFF00');
end;

procedure SendData3();
begin
       Module.Com.PutString('#DA02,05,03,3.568,-0.06'+#13+'JFF00');
end;

procedure SendData4();
begin
       Module.Com.PutString('#DA02,05,04,3.568,-0.02'+#13+'JFF00');
end;

procedure SendData5();
begin
       Module.Com.PutString('#DA02,05,05,3.568,-0.03'+#13+'JFF00');
end;


//----------------------------------: Test Prot Graph
procedure SendData();
begin
       with frmMain do
       begin
              inc(cnt);
              case cnt of
                  1:  SendData1();
                  2:  SendData2();
                  3:  SendData3();
                  4:  SendData4();
                  5:
                  begin
                          SendData5();
                          cnt := 0;
                  end;
              end;


       end;
end;





//--------------------------------: Split And Separet Data
function SeparateData(tdata : string) : boolean;
var
   I    : integer;
   add  : integer;
   Tstr : string;
   Tem  : tstringlist;
   Cap  : integer;
   str  : string;
   CalDat : real;
   cnt        : integer;
   Cal_Gdata  : real;
   cnt_pulse  : integer;
begin
      // Data Format : #DA00,05,01,3.568,-0.05#13JFF00

       Tem := TstringList.Create;
       try
             splitstr(',',tdata,Tem);
             for I := 0 to Tem.Count - 1 do
                  DataPacket[I] := Tem.Strings[I];

             str    := '';
             Tstr   := ''; 
             Cal_Gdata  := 0;
             CalDat := 0;
             
             //frmMain.edtEv_data.Text :=  DataPacket[4];
             Cap := pos(#13,frmMain.mm.Text);
             if Cap <> 0 then
             begin
                    str := DataPacket[4];
                    for I := 1 to Cap-1 do
                          Tstr := Tstr+str[I];
                    frmMain.mm2.Text := Tstr+slinebreak+frmMain.mm2.Text;

                    add_DataPacket := add_DataPacket+1;
//                    AvData[add_DataPacket] := StrToFloat(Tstr);
                    cnt_pulse  := StrToInt(DataPacket[2]);
                    AvData[cnt_pulse] := StrToFloat(Tstr);
                    if DataPacket[1] = DataPacket[2] then
                    begin
                           for cnt := 1 to StrToInt(DataPacket[1]) do
                                 CalDat := CalDat+AvData[cnt];
                           Cal_Gdata := (CalDat / StrToInt(DataPacket[1]));
                           add_DataPacket := 0;
                           frmMain.edtAv_data.Text := FloatToStr(Cal_Gdata);
                           Prot_GPoint(Cal_Gdata,add_DataPacket);      //----- Prot Graph
                           Prot_MinMaxSpec(Cal_Gdata,cnt_pulse,true);
                    end

                    else
                    begin
                           Prot_GPoint(StrToFloat(Tstr),add_DataPacket);
                           Prot_MinMaxSpec(StrToFloat(Tstr),cnt_pulse,false);
                    end;
                               
             end;


       finally
                Tem.Free;
       end;
end;








end.
