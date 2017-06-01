unit cmdline;

interface
  uses windows, classes, variants, StdCtrls, SysUtils, DateUtils, Dialogs, Forms;
const
  STR_DIV = 'CB32795B24A79C82';//'&';
  MONEY_DIV = 100;
  CMD_USER = 1000;
  
  CMD_OPT_LOGIN = CMD_USER + 1;        // ����Ա��¼
  CMD_INFO_OIL = CMD_USER + 2;         // ��ȡ������Ʒ�б�
  CMD_INFO_STATION = CMD_USER + 3;     // ��ȡ��վ�б�
  CMD_INFO_SET = CMD_USER + 4;         // ��ȡ����������Ϣ
  CMD_INFO_LOSTCARD = CMD_USER + 5;    // ����֤���Ż�ȡ��ʧ������
  CMD_INFO_UNLOSTCARD = CMD_USER + 6;  // ����֤���Ż�ȡδ��ʧ������
  CMD_INFO_CLIENT = CMD_USER + 7;      // ��ȡ�ն���Ϣ
  CMD_INFO_BLANKCARDCHECK = CMD_USER + 8;   // ����Ƿ�Ϊ�׿�
  CMD_INFO_PAYTYPELIST = CMD_USER + 9; // ��ȡ���ʽ�б�
  CMD_INFO_SYSLOG = CMD_USER + 10;     // ϵͳ��־

  CMD_SALE_CHECKCARD = CMD_USER + 22;  // �ۿ���⿨��
  CMD_SALE_CARD = CMD_USER + 23;       // �ۿ�

  CMD_ACC_CHECK = CMD_USER + 33;       // �������Ƿ�����ʻ��Ƿ����
  CMD_ACC_INFO = CMD_USER + 34;        // �����ʺ�����У���˻�
  CMD_ACC_NEW = CMD_USER + 35;         // ����
  CMD_ACC_MODI = CMD_USER + 36;        // �޸��ʻ�
  CMD_ACC_CHANGEMM = CMD_USER + 37;    // �޸��û�����
  CMD_ACC_INMONEY = CMD_USER + 38;     // �ͻ���Ǯ
  CMD_ACC_CHANGEMONEY = CMD_USER + 39; // �ͻ�����
  CMD_ACC_CUSTALLINFO = CMD_USER + 40; // ��ȡȫ���ͻ���Ϣ
  CMD_ACC_CARDINFO = CMD_USER + 41;    // �����ʺŻ�ȡ��������Ϣ
  CMD_ACC_INFOBYCARD = CMD_USER + 42;  // ���ݿ���ȡ�ʻ���Ϣ
  CMD_ACC_HELPSIGN = CMD_USER + 43;    // ģ����ѯ�ʻ����Ƿ�
  CMD_ACC_ALLCARDINFO = CMD_USER + 44; // �����ʺŻ�ȡȫ������Ϣ
  CMD_ACC_DESTROY = CMD_USER + 45;     // ����
  CMD_ACC_HELPSIGNALL = CMD_USER + 46; // ģ����ѯ���ʻ����Ƿ�
  CMD_ACC_LEVEL_INFO = CMD_USER + 47;  // �����ʻ������ȡ�ʻ���Ϣ
  CMD_ACC_LEVEL_SETLIMIT = CMD_USER + 48; // �����ʻ���������

  CMD_CARD_DATAINFO = CMD_USER + 53;   // ��ȡ��һ����Ϣ����
  CMD_CARD_INFO = CMD_USER + 54;       // ��ȡ��������Ϣ
  CMD_CARD_LOSTINFO = CMD_USER + 55;   // ��ȡ��ʧ����Ϣ
  CMD_CARD_ALLINFO = CMD_USER + 56;    // ��ȡ����Ϣ����У��
  CMD_CARD_MODIFY = CMD_USER + 57;     // �޸Ŀ���Ϣ
  CMD_CARD_LOST = CMD_USER + 58;       // �û�����ʧ
  CMD_CARD_UNLOST = CMD_USER + 59;     // �û������
  CMD_CARD_SETPWD = CMD_USER + 60;     // ���ÿ�����
  CMD_CARD_RESETPWD = CMD_USER + 61;   // ��װ������
  CMD_CARD_RETURN = CMD_USER + 62;     // �˿�
  CMD_CARD_RETURNFORCE = CMD_USER + 63;// ǿ���˿�
  CMD_CARD_LIST = CMD_USER + 64;       // ģ����ѯ�����б�
  CMD_CARD_TYPELIST = CMD_USER + 65;   // ���������б�
  CMD_CARD_UPDATEAPPTIME = CMD_USER + 66; // ���¿���Ч��
  CMD_CARD_GETGREYRECORD = CMD_USER + 67; // ��ȡ�Ҽ�¼��Ϣ
  CMD_CARD_SETUNGREYLOG = CMD_USER + 68;  // �����־
  CMD_CARD_NONAMECHECK = CMD_USER + 69;   // ��������У��
  CMD_CARD_HOLDNAMELIST = CMD_USER + 70;  // ���������б�

  CMD_MONEY_SAVE = CMD_USER + 81;      // ɢ����ֵ
  CMD_MONEY_CUSTSAVE = CMD_USER + 82;  // �ͻ�ת��
  CMD_MONEY_TOCARD = CMD_USER + 83;    // ������
  CMD_MONEY_GETLASTINFO = CMD_USER + 84; // ��ֵ����ǰ��ȡ������Ϣ
  CMD_MONEY_GETLASTINFORE = CMD_USER + 85; // ��������ǰ��ȡ������Ϣ
  CMD_MONEY_RESENDCARD = CMD_USER + 86;// ����
  CMD_MONEY_RESENDTOCARD = CMD_USER + 87; // ��������
  CMD_MONEY_UNSAVE = CMD_USER + 88;    // ɢ��Ȧ��
  CMD_MONEY_CUSTUNSAVE = CMD_USER + 89;// �ͻ�Ȧ��
//  CMD_PSAM_CHECK = CMD_USER + 90;    // ��ֵPSAM��֤
  CMD_MONEY_CANCELCTCCHECK = CMD_USER + 91;  // ȡ�����ɴ�ֵ��¼ 

  CMD_REP_SALECARD = CMD_USER + 100;   // �ۿ������ѯ
  CMD_REP_SAVECARD = CMD_USER + 101;   // ɢ����ֵ��ѯ
  CMD_REP_RECARD = CMD_USER + 102;     // �û�������ѯ
  CMD_REP_RETURNCARD = CMD_USER + 103; // �˿����ײ�ѯ
  CMD_REP_LOSTCARD = CMD_USER + 104;   // ����ʧ��־��ѯ
  CMD_REP_UNLOSTCARD = CMD_USER + 105; // �������־��ѯ
  CMD_REP_MODICARDPWD = CMD_USER + 106;// �޸Ŀ�������־��ѯ
  CMD_REP_REMODICARDPWD = CMD_USER + 107;  // ��װ��������־��ѯ
  CMD_REP_CARDBILLBLOCKS = CMD_USER + 108; // IC�����ʵ�
  CMD_REP_OILMEMO = CMD_USER + 109;
  CMD_REP_SYSLOG = CMD_USER + 110;       //������־��ѯ
  CMD_REP_ACCBILLBLOCKS = CMD_USER + 111;//��λ���ʵ���ѯ
  CMD_REP_CENTPAYBILL = CMD_USER + 112;  //���ֶ��ʵ���ѯ

  CMD_REP_MAKECARD = CMD_USER + 113;        //�ƿ���ѯ                  //����4Ϊ������
  CMD_REP_CARDINFO = CMD_USER + 114;        //�û����������ϲ�ѯ
  CMD_REP_WHITECARD =  CMD_USER + 115;      //�������������ѯ
  CMD_REP_PASMCARD = CMD_USER + 116;        //PSAM�����������ѯ
  CMD_REP_ALLOPTLOG = CMD_USER + 117;       //����Ա������־            //����4ΪԱ�����
  CMD_REP_DELACC = CMD_USER + 118;          //����
  CMD_REP_DEPOSITMONEY = CMD_USER + 119;    //�ͻ�����
  CMD_REP_SAVEMONEY = CMD_USER + 120;       //�ͻ���Ǯ
  CMD_REP_CHANGEMONEY = CMD_USER + 121;     //�ͻ�ת��
  CMD_REP_STATIONMONEY = CMD_USER + 122;    //���������
  CMD_REP_OILMONEY = CMD_USER + 123;        //��վ����
  CMD_REP_HOLDERINFO = CMD_USER + 124;      //��������Ϣ
  CMD_REP_ALLACCSAVE = CMD_USER + 125;      //���е�λ��Ǯ��Ϣ
  CMD_REP_ALLACCPOINT = CMD_USER + 126;     //��λ���п�������Ϣ
  CMD_REP_CHEQUE = CMD_USER + 127;          //֧Ʊ��Ϣ
  CMD_REP_CARDMANGEMENT = CMD_USER + 128;   //������
  CMD_REP_DAYSETTLE = CMD_USER + 129;       //�ս�

  CMD_REP_CUSTUNDEPOSIT = CMD_USER + 130;    //�ͻ���Ǯ
  CMD_REP_USERUNDEPOSIT = CMD_USER + 131;    //ɢ����Ǯ
  CMD_REP_MODIDEDUCT = CMD_USER + 132;    //�޸��޶�
  CMD_REP_MODICARDINFO = CMD_USER + 133;    //�޸Ŀ���Ϣ��־
  CMD_REP_UNGREY = CMD_USER + 134;    //���������־
  CMD_REP_OPENACCLOG = CMD_USER + 135;    //������־
  CMD_REP_CARDCONSUME = CMD_USER + 136;    //������Ϣ
  CMD_REP_LOSSWITHCARD = CMD_USER + 137;    //�п��˿�
  CMD_REP_LOSSWITHOUTCARD = CMD_USER + 138;    //�޿��˿�
  CMD_REP_UNVIRMENT = CMD_USER + 139;          //�ͻ�����
  CMD_REP_GIFTMAN = CMD_USER + 140;    //�ҽ���ϸ���ܵ�
  CMD_REP_EMPSAVECARD = CMD_USER + 141; // Ա������ֵ����
  CMD_REP_EMPUNSAVECARD = CMD_USER + 142;  // Ա�����ۿ��
  CMD_REP_EMPCARDACC = CMD_USER + 143;     // Ա�������˱�
  CMD_REP_MODILIMIT = CMD_USER + 144;      // ��λ���ƻ��ʼ�¼
  CMD_REP_USERBALANCE = CMD_USER + 145;     // �û���ƽ���
  CMD_REP_BONUSPOINT = CMD_USER + 146;     // ������Ϣ
  CMD_REP_MODIFYENTERPRISE = CMD_USER + 147;     // �޸ĵ�λ��Ϣ��ѯ
  CMD_REP_DiscountMZMK = CMD_USER + 149;     // ���������Ż���Ϣ��ѯ

  CMD_PNT_SALECARD = CMD_USER + 160;        // �ۿ�ƾ����ӡ
  CMD_PNT_USERDEPOSIT = CMD_USER + 161;     // ɢ����ֵƾ����ӡ
  CMD_PNT_OPENACC = CMD_USER + 162;         // ����ƾ����ӡ
  CMD_PNT_BACKCARD = CMD_USER + 163;        // �˿�ƾ����ӡ
  CMD_PNT_DESTROYACC = CMD_USER + 164;      // ����ƾ����ӡ
  CMD_PNT_CUSTSAVEMONEY = CMD_USER + 165;   // �ͻ���Ǯƾ����ӡ
  CMD_PNT_CUSTOUTMONEY = CMD_USER + 166;    // �ͻ�����ƾ����ӡ
  CMD_PNT_QUERYALL = CMD_USER + 167;        // ��ѯ���д�ӡƾ����Ϣ
  CMD_PNT_LOSS = CMD_USER + 168;            // ��ʧƾ����ӡ
  CMD_PNT_LOSSAPP = CMD_USER + 169;       // �޿��˿������ӡ
  CMD_PNT_LOSSAPPCARD = CMD_USER + 170;   // �п��˿������ӡ
  CMD_PNT_RESENDCARD = CMD_USER + 171;      // ����ƾ����ӡ


  CMD_CENT_GOODSLIST = CMD_USER + 200;      // ��ȡ��Ʒ�б�
  CMD_CENT_CARDPOINT = CMD_USER + 201;      // ��ȡ������
  CMD_CENT_GOODSPAY = CMD_USER + 202;       // ��Ʒ�Ҹ�

  CMD_GLASSCARD_INFO = CMD_USER + 300;          // �������ܿ��Ż�ȡ��������Ϣ  //lsl_CarCard 20151209

  CMD_CARD_NOINVOICE_TRADE=CMD_USER+501; //���ݿ��Ż�ȡ���Ѻ�Ʊ�Ŀ���δ��Ʊ�ļ��ͽ���   20170220
  CMD_CARD_NOINVOICE_TRADE_SAVE=CMD_USER+502; //������ͽ��׵Ŀ�Ʊ��¼�����ͽ��ױ�OilTradeUser   20170220

  CMD_CHEQUE_PAYMANNER=CMD_USER + 1001;     //��ȡ֧Ʊ�ĸ��ʽ
  CMD_CHEQUE_RECEIVESAVE=CMD_USER + 1002;   //����֧Ʊ�ǼǱ���
  CMD_CHEQUE_QUERY=CMD_USER + 1003;         //֧Ʊ��Ϣ��ѯ
  CMD_CHEQUE_RETURNSAVE=CMD_USER + 1004;    //֧Ʊ��Ʊ
  CMD_CHEQUE_QUERY_RETURN=CMD_USER + 1005;  //��Ʊ��Ϣ��ѯ
  CMD_CHEQUE_COMP_MONEY=CMD_USER + 1006;   //��Ʊ�����
  CMD_CHEQUE_COMP_CHEQUE=CMD_USER + 1007;   //��Ʊ��Ʊ����
  CMD_CHEQUE_TRANSFER_CHECK=CMD_USER + 1008;//��֤ת������
  CMD_CHEQUE_TRANSFER_SET=CMD_USER + 1009;  //����ת������

  CMD_PNT_CHEQUE_REGISTER=CMD_USER + 1010;  //֧Ʊ�Ǽ�ƾ����ӡ
  CMD_PNT_CHEQUE_RETURN=CMD_USER + 1011;    //֧Ʊ��Ʊƾ����ӡ
  CMD_PNT_CHEQUE_COMP_MONEY=CMD_USER + 1012;//��Ʊ����ƾ����ӡ
  CMD_PNT_CHEQUE_COMP_CHEQUE=CMD_USER + 1013;//��Ʊ��Ʊƾ����ӡ

  CMD_PNT_INDIV_DEDUCT=CMD_USER + 1014;      //ɢ�����ۿ�ƾ����ӡ
  CMD_PNT_GROUP_DEDUCT=CMD_USER + 1015;      //�ͻ����ۿ�ƾ����ӡ
  CMD_PNT_CARDTOUNITS=CMD_USER + 1016;      //���ʻ�ת����ҵ�ʻ�ƾ����ӡ
  CMD_PNT_UNITSTOCARD=CMD_USER + 1017;      //��ҵ�ʻ�ת�뿨�ʻ�ƾ����ӡ
  CMD_PNT_RETURN_HAVECARD=CMD_USER + 1018;  //�п��˿�����ƾ����ӡ
  CMD_PNT_RETURN_NOCARD=CMD_USER + 1019;    //�޿��˿�����ƾ����ӡ

  CMD_PNT_GROUP_SAVE=CMD_USER + 1020;    //�ͻ�����Ǯƾ����ӡ
  CMD_PNT_INNO_REGISTER=CMD_USER + 1021;    //���������Ǽ�ƾ����ӡ
  CMD_PNT_REISSUECARD=CMD_USER + 1022;    //����ƾ����ӡ

  CMD_QUERY_CARDNO=CMD_USER + 1023;        //ģ����ѯ����
  CMD_CARD_PURVIEWSAVE=CMD_USER + 1024;    //���濨Ȩ�޿���
  CMD_QUERY_PURVIEWINFO=CMD_USER + 1025;   //����Ȩ����Ϣ
  CMD_QUERY_ACCINFO=CMD_USER + 1026;       //�����ʻ���Ϣ

  CMD_PNT_UNITSTOCARDBATCH=CMD_USER+1027;  // ��ҵ�ʻ�����ת�뿨�ʻ�
  CMD_QUERY_MZMKDISCOUNTMONEYINFO=CMD_USER + 1028;       //�������������Ż���Ϣ
  CMD_QUERY_STATIONSALEINFO = CMD_USER + 1029;
  CMD_QUERY_STATIONSALEINFO_RPT=CMD_USER + 1030;
  CMD_REP_CARDMANGEMENT2 = CMD_USER + 1031;
  CMD_REP_PRICESYSTEM = CMD_USER + 1032;

  {
  SERV_INFO_CAPTION = 'SERVER INFO';
  SERV_WARN_CAPTION = 'SERVER MESSAGE';
  SERV_ERR_CAPTION  = 'SSERVER ERROR';
  }
  SERV_INFO_CAPTION = '������ʾ��Ϣ'; //LSL_TRANS ϵͳû��ʹ��
  SERV_WARN_CAPTION = '���񾯸���Ϣ';//LSL_TRANS
  SERV_ERR_CAPTION  = '���������Ϣ'; //LSL_TRANS ϵͳû��ʹ��

  function GetParams(s: String; index: Integer; divs: String=STR_DIV): String;
  function isCHSystem: Boolean;          // �Ƿ����Ĳ���ϵͳ
  function GetDtFromStr(mDT: String): TDateTime;
  function GetTruncDateStr(DTStr: String): String;
  procedure VariantToStream (const v: OleVariant; Stream: TStream);
  procedure StreamToVariant(Stream: TStream; var v: OleVariant);
  procedure VariantToPChar(const v: OleVariant; var pS: PChar; var pLen: Integer);
  procedure PCharToVariant(pS: PChar; pLen: Integer; var v: OleVariant);
  procedure ShowMsg(s: String; cap: String='');
  function ShowDlg(txt: string; cap: string = ''): Boolean;
  function NewPwd: String;
  function GetCountStr(s: String; len: Integer; sdiv: String): String;

type
  TIDComBox = class(TComboBox)
  private
    FListID: TStringList;
    FListNO: TStringList;
    FComboBox: TComboBox;
    FIDOnChange: TNotifyEvent;
  published
    property IDOnChange:TNotifyEvent read FIDOnChange write FIDOnChange;
  public
    NextIDComBox: TIDComBox;
    {$WARNINGS OFF}
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; ComboBox: TComboBox); overload;
    destructor Destroy; override;
    {$WARNINGS ON}
    function getID(index: integer): string; overload;
    function getID: string; overload;
    function getNO(index: Integer): string; overload;
    function getNO: string; overload;
    function getIDIndex(s: string): Integer;
    function getNOIndex(s: string): Integer;
    procedure setID(s: string);
    procedure setNO(s: string);
    procedure ClearAll;
  end;
  
implementation

constructor TIDComBox.Create(AOwner: TComponent);
begin
  Create(AOwner, nil);
end;

constructor TIDComBox.Create(AOwner: TComponent; ComboBox: TComboBox);
begin
  inherited Create(AOwner);
  FComboBox := ComboBox;
  if FComboBox <> nil then
  begin
    Parent := FComboBox.Parent;
    SetBounds(FComboBox.Left, FComboBox.Top, FComboBox.Width, FComboBox.Height);
    TabOrder := FComboBox.TabOrder;
    FComboBox.TabStop := false;
  end;

  FListID := TStringList.Create;
  FListNO := TStringList.Create;
  Style := csDropDownList;
end;

destructor TIDComBox.Destroy;
begin
  FListID.Free;
  FListNO.Free;
  inherited;
end;

procedure TIDComBox.ClearAll;
begin
  Items.Clear;
  FListID.Clear;
  FListNO.Clear;
end;

function TIDComBox.getNO(index: Integer): string;
begin
  if index = -1 then
    result := '-1'
  else
    result := FListNO.Strings[index];
end;

function TIDComBox.getNO: string;
begin
  result := getNO(ItemIndex);
end;

function TIDComBox.getID(index: Integer): string;
begin
  if index = -1 then
    result := '-1'
  else
    result := FListID.Strings[index];
end;

function TIDComBox.getID: string;
begin
  result := getID(ItemIndex);
end;

procedure TIDComBox.setNO(s: string);
begin
  FListNO.Add(s);
end;

procedure TIDComBox.setID(s: string);
begin
  FListID.Add(s);
end;

function TIDComBox.getNOIndex(s: string): Integer;
begin
  result := FListNO.IndexOf(s);
end;

function TIDComBox.getIDIndex(s: string): Integer;
begin
  result := FListID.IndexOf(s);
end;

procedure ShowMsg(s: String; cap: String);
begin
  if cap = '' then
    //cap := 'System Info';
    cap := 'ϵͳ��Ϣ';//LSL_TRANS
  MessageBox(0, PChar(s), PChar(cap), MB_OK + MB_ICONINFORMATION);
end;

function ShowDlg(txt: string; cap: string): Boolean;
begin
  if Application.MessageBox(pChar(txt), pChar(cap), MB_YESNO + MB_ICONQUESTION)
    = IDYES then
    result := true
  else
    result := false;
end;

    
procedure VariantToStream(const v: OleVariant; Stream: TStream);
var
  p : pointer;
begin
  Stream.Position := 0;
  Stream.Size := VarArrayHighBound(v, 1) - VarArrayLowBound (v, 1) + 1;  //��ʵ����ֱ��ȡ��ά��Ϊ����С����Ϊһ������±���������άΪ0��
  p := VarArrayLock (v);   //��д����ʱ�����ǵ��˿�ס�ˣ���Ϊ����������һ�ְ�ȫ���飬�������������ݵ����飬v[0]����������ʵ��ʼ��ַ�������Ǻ��ѵõ����ĵ�ַ������������պô������������!
  Stream.Write(p^, Stream.Size);  //�˾����������ѧ�߾�̾��Ҳ����û�������ù���ֻ��û������������������ù����Ǻǣ�ѧϰѧϰ!
  VarArrayUnlock (v);   //��ʹ����VarArratLock()�����Ժ�һ��Ҫ�ô˺�����Ȼ�ᱨ���!
  Stream.Position := 0;
end;

procedure StreamToVariant(Stream: TStream; var v: OleVariant);
var
  p : pointer;
begin
  v := VarArrayCreate ([0, Stream.Size - 1], varByte);   //Ҳѧϰһ�����������������������һ����������
  p := VarArrayLock (v);   //������û��ʲô�ˣ���������������෴��!
  Stream.Position := 0;
  Stream.Read(p^, Stream.Size);   //��ʵ���������̵�����ڴ��ˣ�ָ���Ӧ�ã�������
  VarArrayUnlock (v);
end;

procedure VariantToPChar(const v: OleVariant; var pS: PChar; var pLen: Integer);
var
  p : pointer;
begin
  pLen := VarArrayHighBound(v, 1) - VarArrayLowBound (v, 1) + 1;
  p := VarArrayLock (v);
  move(p^, pS^, pLen);
  VarArrayUnlock (v);
end;

procedure PCharToVariant(pS: PChar; pLen: Integer; var v: OleVariant);
var
  p : pointer;
begin
  v := VarArrayCreate ([0, pLen - 1], varByte); 
  p := VarArrayLock (v);
  move(pS^, p^, pLen);
  VarArrayUnlock (v);
end;

function GetDtFromStr(mDT: String): TDateTime;
var
  y, m, d, h, n, s: WORD;
begin
  try
    y := StrToInt(copy(mDT, 1, 4));
    m := StrToInt(copy(mDT, 5, 2));
    d := StrToInt(copy(mDT, 7, 2));
    h := StrToInt(copy(mDT, 9, 2));
    n := StrToInt(copy(mDT, 11, 2));
    s := StrToInt(copy(mDT, 13, 2));
    result := EncodeDateTime(y, m, d, h, n, s, 0);
  except
    result := 0;
  end;
end;

function isCHSystem: Boolean;
var
  DefaultID:integer;
begin
  DefaultID := GetSystemDefaultLangID;
  if (DefaultID = 1028) then
  begin
    result := true; //��������
  end
  else if (DefaultID = 2052) then
  begin
    result := true; //��������
  end
  else
  begin
    result := false; //��������
  end;
end;

function GetTruncDateStr(DTStr: String): String;
var
  d: TDateTime;
begin
  d := Trunc(StrToDateTime(DTStr));
  result := DateTimeToStr(d);
end;

function GetParams(s: String; index: Integer; divs: String): String;
var
  i, mpos: Integer;
begin
  if length(s) = 0 then
  begin
    result := '';
    exit;
  end;

//  i := pos(divs, s);
//  if i <> 1 then
  s := divs + s;

  for i := 1 to index do
  begin
    mpos := pos(divs, s);
    if mpos > 0 then
      delete(s, 1, mpos + length(divs) - 1)
    else
    begin
      result := '';
      exit;
    end;
  end;

  mpos := pos(divs, s);
  if mpos > 0 then
    delete(s, mpos, length(s));
  result := s;
end;

function NewPwd: String;
var
  i: Integer;
begin
  Randomize;
  result := '';
  for i := 1 to 6 do
    result := result + IntToStr(Random(10));
end;

function GetCountStr(s: String; len: Integer; sdiv: String): String;
var
  i, j: integer;
begin
  if length(s) > len then
    result := Copy(s, length(s) - len + 1, len)
  else
  begin
    i := len - length(s);
    result := '';
    for j := 1 to i do
      result := result + sdiv;
    result := result + s;
  end;
end;

end.
