unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type


  TFrmMain = class(TForm)
    edtCmdIndex: TEdit;
    edtRptType: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    function ShowReport(AppHandle: LongWord; CmdIndex: Integer; RptType: Integer):
      Integer; stdcall; External 'repapp.dll';
var
  FrmMain: TFrmMain;

implementation
uses
  cmdline ;

{$R *.dfm}

procedure TFrmMain.Button1Click(Sender: TObject);
var
  CmdIndex: Integer;
  RptType: Integer;
  s:string;
begin
  s:= 'ÕÊ»§Öú¼Ç·û';
  CmdIndex := CMD_USER + StrToInt(edtCmdIndex.Text);
  RptType := StrToInt(edtRptType.Text);
  ShowReport(Self.Handle,CmdIndex,RptType);
end;

end.
