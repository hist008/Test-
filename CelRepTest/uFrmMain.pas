unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DB,ADODB, StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    ADOConnection1: TADOConnection;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure MakeCellReport(DBConn: TADOConnection; ID: Integer; outp: PChar);stdcall; External 'CellRep.dll'; // ҡ��
var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  x : PChar ;
begin







  x := GetMemory(100) ;
  FillChar(x,sizeof(x),0);
  MakeCellReport(ADOConnection1,1,x);
end;

end.
