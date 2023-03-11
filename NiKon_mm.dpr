program NiKon_mm;

uses
  Forms,
  Nikon_Model in 'Nikon_Model.pas' {frmMain},
  SpecControl in 'SpecControl.pas' {frmSpec},
  All_Image in 'All_Image.pas' {frmImage},
  Gb_func in 'Gb_func.pas',
  Gb_param in 'Gb_param.pas',
  Gb_Graph_Func in 'Gb_Graph_Func.pas',
  ComPort in 'ComPort.pas' {frmComPort},
  m_Module in 'm_Module.pas' {Module: TDataModule},
  Config_File in 'Config_File.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSpec, frmSpec);
  Application.CreateForm(TfrmImage, frmImage);
  Application.CreateForm(TfrmComPort, frmComPort);
  Application.CreateForm(TModule, Module);
  Application.Run;
end.
