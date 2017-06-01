program RepAppTest;

uses
  Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  cmdline in 'cmdline.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
