unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnOpenFile: TButton;
    edtFile: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    btnDo: TButton;
    Memo1: TMemo;
    procedure btnOpenFileClick(Sender: TObject);
    procedure btnDoClick(Sender: TObject);
  private
    { Private declarations }
    function Handle(FileName:string):Boolean;

    function getcode(Text:string):string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnOpenFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtFile.Text := OpenDialog1.FileName ;
  end;
end;

procedure TForm1.btnDoClick(Sender: TObject);
var
  strFileName:string;
begin
  strFileName := edtFile.Text ;
  if strFileName = '' then
  begin
    ShowMessage('要处理的文件不能为空');
    Exit;
  end;

  if not FileExists(strFileName) then
  begin
    ShowMessage('要处理的文件不存在');
    Exit;
  end;

  if Handle(strFileName) then
    ShowMessage('处理成功');

end;

function TForm1.Handle(FileName: string): Boolean;
var
  Txt : TextFile ;
  strText:string;
  strTextCode:string;
  strTemp:string;
begin
  Result := False ;
  AssignFile(Txt,FileName);
  reset(Txt);

  Memo1.Lines.Clear ;
  while not EOF(txt) do
  begin
    Readln(txt,strText);
    strText := Trim(strText);
    if strText <> '' then
    begin
      strTemp :=  strText + '=' ;
      Memo1.Lines.Add(strTemp);
      strTextCode := getcode(strText);

      strTemp := Format('%s=%s ',[strTextCode,strText]);
      Memo1.Lines.Add(strTemp)
    end;
  end;



  CloseFile(txt);
end;

function TForm1.getcode(Text: string): string;
var
  i, len: Integer;
begin
  result := '';
  len := Length(Text);
  for i := 1 to len  do
  begin
    result := result + IntToHex(Ord(Text[i]), 2);
  end;
end;

end.
