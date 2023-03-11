unit Config_File;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes,
  ExtCtrls, ComCtrls, StdCtrls, TeeProcs, TeEngine,
  Grids, Registry, Inifiles;


  //------------------------------------------------: Function Prototype
   procedure splitstr(const Delimiter:char ;input : string;const strings : Tstrings);
   procedure Read_Or_WriteFile(item : string);
   procedure Initial_LogFile(dat : string);
   procedure Save_LogFile(data : string; res : boolean);
   procedure Initial_Colum();




implementation
 uses Nikon_Model,ComPort,Gb_param,Gb_func,Gb_Graph_Func, m_Module;



//----------------------------------------: Config Conlum File
procedure Initial_Colum();
var
    str : string;
begin
       str := '';
       str := 'Step No'+','+'Fno'+','+'Ev'+','+'Min'+','+'Max'+','+'Av'+
              ','+'Judge';
       Initial_LogFile(str);
end;




 //**************************************** Initial Log File
 procedure Initial_LogFile(dat : string);
 var
      K_logfile : TextFile;
      Set_dir   : string;
      Root_dir  : string;
      Date_dir  : string;
      K_Input   : string;

 begin
        with frmMain do
        begin
               try

                     Date_cur := FormatDateTime('yyyymmdd',now);
                     Read_Or_WriteFile('R Current Date');

                     Date_Dir := FormatDateTime('yyyy_mm_dd',now);
                     if Date_ref = Date_cur then
                         K_Input := Date_ref+'.csv'
                     else
                          K_Input := Date_cur+'.csv';

                      GetDir(0,Set_dir);
                      {$IOChecks off}
                      MkDir('LogFile') ;             // folder
                      MkDir('LogFile\'+Date_Dir) ;   // folder
                      Root_dir := Set_dir+'\LogFile\'+Date_Dir+'\';

                      assignfile(K_logfile,Root_dir+K_Input);

                       /// Make file if don't have file.
                     if Not FileExists(Root_dir+K_Input) then
                      begin
                             Rewrite(K_logfile);
                             reset(K_logfile) ;
                             append(K_logfile);

                             reset(K_logfile) ;
                             append(K_logfile);
                             writeln(K_logfile,dat);
                             flush(K_logfile);
                             closefile(K_logfile);

                             Read_Or_WriteFile('W Current Date');

                      end;

                     {$IOChecks on}

               except

               end;

        end;
 end;




 //**************************************** Save Log File
 procedure Save_LogFile(data : string; res : boolean);
 var
      K_logfile : TextFile;
      Set_dir   : string;
      Root_dir  : string;
      Date_dir  : string;
      K_Input   : string;

 begin
        with frmMain do
        begin
               try
                     Date_cur := FormatDateTime('yyyymmdd',now);
                     Read_Or_WriteFile('R Current Date');

                     Date_Dir := FormatDateTime('yyyy_mm_dd',now);
                     if Date_ref = Date_cur then
                         K_Input := Date_ref+'.csv'
                     else
                          K_Input := Date_cur+'.csv';

                      GetDir(0,Set_dir);
                      {$IOChecks off}
                      MkDir('LogFile') ;             // folder
                      MkDir('LogFile\'+Date_Dir) ;   // folder
                      Root_dir := Set_dir+'\LogFile\'+Date_Dir+'\';

                      assignfile(K_logfile,Root_dir+K_Input) ;

                       /// Make file if don't have file.
                     if Not FileExists(Root_dir+K_Input) then
                      begin
                             Rewrite(K_logfile) ;
                             reset(K_logfile) ;
                             append(K_logfile);

                      end;

                      reset(K_logfile) ;
                      append(K_logfile);
                      writeln(K_logfile,data);
                      flush(K_logfile);
                      closefile(K_logfile);
                      data := '';
                      Read_Or_WriteFile('W Current Date');

                     {$IOChecks on}

               except

               end;

        end;
 end;









  //************************************ Read&Write Config Files
 procedure Read_Or_WriteFile(item : string);
 var
     nimi       : Tinifile;
     DirRoot    : string ;
     str_ComNo  : string;
     int_ComNo  : integer;
     BaudRates  : integer;
     strCom_Cal : string;
     str_Com,I  : word;
 begin
    GetDir(0,DirRoot) ;
    {$IOChecks off}
    MkDir('Config') ;
    {$IOChecks on}

    try
         nimi := tinifile.Create(ExtractFilePath(DirRoot+
                 '\Config\')+'InitialFile.Nidec');

         with frmComPort do      //***************** Result Product
         begin
//                if item = 'W CONNECTION' then
//                begin
//                        if Module.Com.Open = true then
//                            Module.Com.Open := false;
//                        strCom_Cal := '';
//                        str_ComNo := cmbComPort.Items.Strings[cmbComPort.ItemIndex];
//                        BaudRates := StrToInt(cmbBaudRate.Items.Strings[cmbBaudRate.ItemIndex]);
//
//                        for I := 4 to Length(str_ComNo) do
//                            strCom_Cal := strCom_Cal+str_ComNo[I];
//                        int_ComNo := StrToInt(strCom_Cal);
//
//                        Module.Com.ComNumber := int_ComNo;
//                        Module.Com.Baud := BaudRates;
//                        Module.Com.Open := true;
//
//
//                        nimi.WriteString('CONFIG COMPORT','BaudRate Box' ,
//                                         cmbBaudRate.Items.Strings[cmbBaudRate.ItemIndex]);
//                        nimi.WriteInteger('CONFIG COMPORT','BaudRate Box_add' ,
//                                         cmbBaudRate.ItemIndex);
//                        nimi.WriteInteger('CONFIG COMPORT','ComPort Box' ,int_ComNo);
//                        nimi.WriteInteger('CONFIG COMPORT','ComPort Box_add' ,
//                                         cmbComPort.ItemIndex);
//                end;
//
//                if item = 'R CONNECTION' then
//                begin
//                        if Module.Com.Open = true then
//                            Module.Com.Open := false;
//
//                        str_ComNo := nimi.ReadString('CONFIG COMPORT'
//                                                        ,'ComPort Box','0');
//                        cmbComPort.ItemIndex := nimi.ReadInteger('CONFIG COMPORT'
//                                                                 ,'ComPort Box_add',3);
//
//
//                        BaudRates := nimi.ReadInteger('CONFIG COMPORT'
//                                                        ,'BaudRate Box',9600);
//                        cmbBaudRate.ItemIndex := nimi.ReadInteger('CONFIG COMPORT'
//                                                                 ,'BaudRate Box_add',9600);
//
//                        Module.Com.ComNumber := StrToInt(str_ComNo);
//                        Module.Com.Baud := BaudRates;
//                        Module.Com.Open := true;
//                end;



                  if item = 'W CONNECTION' then
                                  begin
                        if Module.Com.Open = true then
                            Module.Com.Open := false;
                        strCom_Cal := '';
                        str_ComNo := cmbComPort.Items.Strings[cmbComPort.ItemIndex];
                        BaudRates := StrToInt(cmbBaudRate.Items.Strings[cmbBaudRate.ItemIndex]);

                        for I := 4 to Length(str_ComNo) do
                            strCom_Cal := strCom_Cal+str_ComNo[I];
                        int_ComNo := StrToInt(strCom_Cal);

                        Module.Com.ComNumber := int_ComNo;
                        Module.Com.Baud := BaudRates;
                        Module.Com.Open := true;


                        nimi.WriteString('CONFIG COMPORT','BaudRate Box' ,
                                         cmbBaudRate.Items.Strings[cmbBaudRate.ItemIndex]);
                        nimi.WriteInteger('CONFIG COMPORT','BaudRate Box_add' ,
                                         cmbBaudRate.ItemIndex);
                        nimi.WriteInteger('CONFIG COMPORT','ComPort Box' ,int_ComNo);
                        nimi.WriteInteger('CONFIG COMPORT','ComPort Box_add' ,
                                         cmbComPort.ItemIndex);

                end;

                if item = 'R CONNECTION' then
                begin
                        if Module.Com.Open = true then
                            Module.Com.Open := false;

                        str_ComNo := nimi.ReadString('CONFIG COMPORT'
                                                        ,'ComPort Box','0');
                        cmbComPort.ItemIndex := nimi.ReadInteger('CONFIG COMPORT'
                                                                 ,'ComPort Box_add',3);


                        BaudRates := nimi.ReadInteger('CONFIG COMPORT'
                                                        ,'BaudRate Box',9600);
                        cmbBaudRate.ItemIndex := nimi.ReadInteger('CONFIG COMPORT'
                                                                 ,'BaudRate Box_add',9600);
                        Module.Com.ComNumber := StrToInt(str_ComNo);
                        Module.Com.Baud := BaudRates;
                        Module.Com.Open := true;
                end;





         end;


         with frmMain do
         begin
                if Item = 'W SPEC' then
                begin
                      nimi.WriteString('## SPEC CONTROL ##',
                                       'Volte Typical',edtVt.Text);
                      nimi.WriteString('## SPEC CONTROL ##',
                                       'Volte Minimum',edtVm.Text);
                      nimi.WriteString('## SPEC CONTROL ##',
                                       'Rotery-Step',edtSw.Text);

                      nimi.WriteString('## SPEC CONTROL ##',
                                       'Av-Min',edtAv_min.Text);
                      nimi.WriteString('## SPEC CONTROL ##',
                                       'Av-Max',edtAv_max.Text);



                end;

                if Item = 'R SPEC' then
                begin
                       edtVt.Text := nimi.ReadString('## SPEC CONTROL ##'
                                                       ,'Volte Typical','1');
                       edtVm.Text := nimi.ReadString('## SPEC CONTROL ##'
                                                       ,'Volte Minimum','2');
                       edtSw.Text := nimi.ReadString('## SPEC CONTROL ##'
                                                       ,'Rotery-Step','3');

                       edtAv_min.Text := nimi.ReadString('## SPEC CONTROL ##'
                                                       ,'Av-Min','0');
                       edtAv_max.Text := nimi.ReadString('## SPEC CONTROL ##'
                                                       ,'Av-Max','5');

                       Initial_Graph(1,2);
                end;


         end;



         if item = 'W Current Date' then
          begin
                   nimi.WriteString('DATE-WORKING','Date'
                                    ,Date_cur);
          end;

          if item = 'R Current Date' then
          begin
                   Date_ref := nimi.ReadString('DATE-WORKING'
                                               ,'Date','2013_01_01');

          end;







    except


    end;
end;




//******************************************************************************
//      SPLIT STRING
procedure  splitstr(const Delimiter:char ;input : string;const strings : Tstrings);
begin
          assert(assigned(strings));
          strings.Clear;
          strings.Delimiter := delimiter;
          strings.DelimitedText := input;
end;








end.
