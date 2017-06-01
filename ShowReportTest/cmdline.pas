unit cmdline;

interface
  uses windows, classes, variants, StdCtrls, SysUtils, DateUtils, Dialogs, Forms;
const
  STR_DIV = 'CB32795B24A79C82';//'&';
  MONEY_DIV = 100;
  CMD_USER = 1000;
  
  CMD_OPT_LOGIN = CMD_USER + 1;        // 操作员登录
  CMD_INFO_OIL = CMD_USER + 2;         // 获取在用油品列表
  CMD_INFO_STATION = CMD_USER + 3;     // 获取油站列表
  CMD_INFO_SET = CMD_USER + 4;         // 获取中心设置信息
  CMD_INFO_LOSTCARD = CMD_USER + 5;    // 根据证件号获取挂失卡集合
  CMD_INFO_UNLOSTCARD = CMD_USER + 6;  // 根据证件号获取未挂失卡集合
  CMD_INFO_CLIENT = CMD_USER + 7;      // 获取终端信息
  CMD_INFO_BLANKCARDCHECK = CMD_USER + 8;   // 检测是否为白卡
  CMD_INFO_PAYTYPELIST = CMD_USER + 9; // 获取付款方式列表
  CMD_INFO_SYSLOG = CMD_USER + 10;     // 系统日志

  CMD_SALE_CHECKCARD = CMD_USER + 22;  // 售卡检测卡号
  CMD_SALE_CARD = CMD_USER + 23;       // 售卡

  CMD_ACC_CHECK = CMD_USER + 33;       // 根据助记符检查帐户是否存在
  CMD_ACC_INFO = CMD_USER + 34;        // 根据帐号密码校验账户
  CMD_ACC_NEW = CMD_USER + 35;         // 开户
  CMD_ACC_MODI = CMD_USER + 36;        // 修改帐户
  CMD_ACC_CHANGEMM = CMD_USER + 37;    // 修改用户密码
  CMD_ACC_INMONEY = CMD_USER + 38;     // 客户存钱
  CMD_ACC_CHANGEMONEY = CMD_USER + 39; // 客户划帐
  CMD_ACC_CUSTALLINFO = CMD_USER + 40; // 提取全部客户信息
  CMD_ACC_CARDINFO = CMD_USER + 41;    // 根据帐号获取正常卡信息
  CMD_ACC_INFOBYCARD = CMD_USER + 42;  // 根据卡获取帐户信息
  CMD_ACC_HELPSIGN = CMD_USER + 43;    // 模糊查询帐户助记符
  CMD_ACC_ALLCARDINFO = CMD_USER + 44; // 根据帐号获取全部卡信息
  CMD_ACC_DESTROY = CMD_USER + 45;     // 销户
  CMD_ACC_HELPSIGNALL = CMD_USER + 46; // 模糊查询卡帐户助记符
  CMD_ACC_LEVEL_INFO = CMD_USER + 47;  // 根据帐户级别获取帐户信息
  CMD_ACC_LEVEL_SETLIMIT = CMD_USER + 48; // 设置帐户划账限制

  CMD_CARD_DATAINFO = CMD_USER + 53;   // 获取单一卡信息数据
  CMD_CARD_INFO = CMD_USER + 54;       // 获取正常卡信息
  CMD_CARD_LOSTINFO = CMD_USER + 55;   // 获取挂失卡信息
  CMD_CARD_ALLINFO = CMD_USER + 56;    // 获取卡信息，无校验
  CMD_CARD_MODIFY = CMD_USER + 57;     // 修改卡信息
  CMD_CARD_LOST = CMD_USER + 58;       // 用户卡挂失
  CMD_CARD_UNLOST = CMD_USER + 59;     // 用户卡解挂
  CMD_CARD_SETPWD = CMD_USER + 60;     // 设置卡密码
  CMD_CARD_RESETPWD = CMD_USER + 61;   // 重装卡密码
  CMD_CARD_RETURN = CMD_USER + 62;     // 退卡
  CMD_CARD_RETURNFORCE = CMD_USER + 63;// 强制退卡
  CMD_CARD_LIST = CMD_USER + 64;       // 模糊查询卡号列表
  CMD_CARD_TYPELIST = CMD_USER + 65;   // 含卡类型列表
  CMD_CARD_UPDATEAPPTIME = CMD_USER + 66; // 更新卡有效期
  CMD_CARD_GETGREYRECORD = CMD_USER + 67; // 获取灰记录信息
  CMD_CARD_SETUNGREYLOG = CMD_USER + 68;  // 解灰日志
  CMD_CARD_NONAMECHECK = CMD_USER + 69;   // 不记名卡校验
  CMD_CARD_HOLDNAMELIST = CMD_USER + 70;  // 卡号姓名列表

  CMD_MONEY_SAVE = CMD_USER + 81;      // 散户储值
  CMD_MONEY_CUSTSAVE = CMD_USER + 82;  // 客户转帐
  CMD_MONEY_TOCARD = CMD_USER + 83;    // 卡补存
  CMD_MONEY_GETLASTINFO = CMD_USER + 84; // 储值补存前获取补存信息
  CMD_MONEY_GETLASTINFORE = CMD_USER + 85; // 补卡补存前获取补存信息
  CMD_MONEY_RESENDCARD = CMD_USER + 86;// 补卡
  CMD_MONEY_RESENDTOCARD = CMD_USER + 87; // 补卡补存
  CMD_MONEY_UNSAVE = CMD_USER + 88;    // 散户圈提
  CMD_MONEY_CUSTUNSAVE = CMD_USER + 89;// 客户圈提
//  CMD_PSAM_CHECK = CMD_USER + 90;    // 储值PSAM认证
  CMD_MONEY_CANCELCTCCHECK = CMD_USER + 91;  // 取消质疑储值记录 

  CMD_REP_SALECARD = CMD_USER + 100;   // 售卡情况查询
  CMD_REP_SAVECARD = CMD_USER + 101;   // 散户储值查询
  CMD_REP_RECARD = CMD_USER + 102;     // 用户补卡查询
  CMD_REP_RETURNCARD = CMD_USER + 103; // 退卡交易查询
  CMD_REP_LOSTCARD = CMD_USER + 104;   // 卡挂失日志查询
  CMD_REP_UNLOSTCARD = CMD_USER + 105; // 卡解挂日志查询
  CMD_REP_MODICARDPWD = CMD_USER + 106;// 修改卡密码日志查询
  CMD_REP_REMODICARDPWD = CMD_USER + 107;  // 重装卡密码日志查询
  CMD_REP_CARDBILLBLOCKS = CMD_USER + 108; // IC卡对帐单
  CMD_REP_OILMEMO = CMD_USER + 109;
  CMD_REP_SYSLOG = CMD_USER + 110;       //操作日志查询
  CMD_REP_ACCBILLBLOCKS = CMD_USER + 111;//单位对帐单查询
  CMD_REP_CENTPAYBILL = CMD_USER + 112;  //积分对帐单查询

  CMD_REP_MAKECARD = CMD_USER + 113;        //制卡查询                  //参数4为卡类型
  CMD_REP_CARDINFO = CMD_USER + 114;        //用户卡基本资料查询
  CMD_REP_WHITECARD =  CMD_USER + 115;      //白名单卡情况查询
  CMD_REP_PASMCARD = CMD_USER + 116;        //PSAM卡基本情况查询
  CMD_REP_ALLOPTLOG = CMD_USER + 117;       //操作员工作日志            //参数4为员工编号
  CMD_REP_DELACC = CMD_USER + 118;          //销户
  CMD_REP_DEPOSITMONEY = CMD_USER + 119;    //客户划帐
  CMD_REP_SAVEMONEY = CMD_USER + 120;       //客户存钱
  CMD_REP_CHANGEMONEY = CMD_USER + 121;     //客户转帐
  CMD_REP_STATIONMONEY = CMD_USER + 122;    //发卡点结算
  CMD_REP_OILMONEY = CMD_USER + 123;        //油站结算
  CMD_REP_HOLDERINFO = CMD_USER + 124;      //持有者信息
  CMD_REP_ALLACCSAVE = CMD_USER + 125;      //所有单位存钱信息
  CMD_REP_ALLACCPOINT = CMD_USER + 126;     //单位所有卡积分信息
  CMD_REP_CHEQUE = CMD_USER + 127;          //支票信息
  CMD_REP_CARDMANGEMENT = CMD_USER + 128;   //卡管理
  CMD_REP_DAYSETTLE = CMD_USER + 129;       //日结

  CMD_REP_CUSTUNDEPOSIT = CMD_USER + 130;    //客户扣钱
  CMD_REP_USERUNDEPOSIT = CMD_USER + 131;    //散户扣钱
  CMD_REP_MODIDEDUCT = CMD_USER + 132;    //修改限额
  CMD_REP_MODICARDINFO = CMD_USER + 133;    //修改卡信息日志
  CMD_REP_UNGREY = CMD_USER + 134;    //联机解灰日志
  CMD_REP_OPENACCLOG = CMD_USER + 135;    //开户日志
  CMD_REP_CARDCONSUME = CMD_USER + 136;    //消费信息
  CMD_REP_LOSSWITHCARD = CMD_USER + 137;    //有卡退卡
  CMD_REP_LOSSWITHOUTCARD = CMD_USER + 138;    //无卡退卡
  CMD_REP_UNVIRMENT = CMD_USER + 139;          //客户退帐
  CMD_REP_GIFTMAN = CMD_USER + 140;    //兑奖明细汇总单
  CMD_REP_EMPSAVECARD = CMD_USER + 141; // 员工卡储值报表
  CMD_REP_EMPUNSAVECARD = CMD_USER + 142;  // 员工卡扣款报表
  CMD_REP_EMPCARDACC = CMD_USER + 143;     // 员工卡对账表
  CMD_REP_MODILIMIT = CMD_USER + 144;      // 单位限制划帐记录
  CMD_REP_USERBALANCE = CMD_USER + 145;     // 用户卡平衡表
  CMD_REP_BONUSPOINT = CMD_USER + 146;     // 积分信息
  CMD_REP_MODIFYENTERPRISE = CMD_USER + 147;     // 修改单位信息查询
  CMD_REP_DiscountMZMK = CMD_USER + 149;     // 明折明扣优惠信息查询

  CMD_PNT_SALECARD = CMD_USER + 160;        // 售卡凭单打印
  CMD_PNT_USERDEPOSIT = CMD_USER + 161;     // 散户储值凭单打印
  CMD_PNT_OPENACC = CMD_USER + 162;         // 开户凭单打印
  CMD_PNT_BACKCARD = CMD_USER + 163;        // 退卡凭单打印
  CMD_PNT_DESTROYACC = CMD_USER + 164;      // 销户凭单打印
  CMD_PNT_CUSTSAVEMONEY = CMD_USER + 165;   // 客户存钱凭单打印
  CMD_PNT_CUSTOUTMONEY = CMD_USER + 166;    // 客户冲正凭单打印
  CMD_PNT_QUERYALL = CMD_USER + 167;        // 查询所有打印凭单信息
  CMD_PNT_LOSS = CMD_USER + 168;            // 挂失凭单打印
  CMD_PNT_LOSSAPP = CMD_USER + 169;       // 无卡退卡申请打印
  CMD_PNT_LOSSAPPCARD = CMD_USER + 170;   // 有卡退卡申请打印
  CMD_PNT_RESENDCARD = CMD_USER + 171;      // 补卡凭单打印


  CMD_CENT_GOODSLIST = CMD_USER + 200;      // 获取奖品列表
  CMD_CENT_CARDPOINT = CMD_USER + 201;      // 获取卡积分
  CMD_CENT_GOODSPAY = CMD_USER + 202;       // 商品兑付

  CMD_GLASSCARD_INFO = CMD_USER + 300;          // 按玻璃管卡号获取正常卡信息  //lsl_CarCard 20151209

  CMD_CARD_NOINVOICE_TRADE=CMD_USER+501; //根据卡号获取消费后开票的卡的未开票的加油交易   20170220
  CMD_CARD_NOINVOICE_TRADE_SAVE=CMD_USER+502; //保存加油交易的开票记录。加油交易表OilTradeUser   20170220

  CMD_CHEQUE_PAYMANNER=CMD_USER + 1001;     //获取支票的付款方式
  CMD_CHEQUE_RECEIVESAVE=CMD_USER + 1002;   //保存支票登记保存
  CMD_CHEQUE_QUERY=CMD_USER + 1003;         //支票信息查询
  CMD_CHEQUE_RETURNSAVE=CMD_USER + 1004;    //支票退票
  CMD_CHEQUE_QUERY_RETURN=CMD_USER + 1005;  //退票信息查询
  CMD_CHEQUE_COMP_MONEY=CMD_USER + 1006;   //退票补款保存
  CMD_CHEQUE_COMP_CHEQUE=CMD_USER + 1007;   //退票补票保存
  CMD_CHEQUE_TRANSFER_CHECK=CMD_USER + 1008;//验证转帐密码
  CMD_CHEQUE_TRANSFER_SET=CMD_USER + 1009;  //设置转帐密码

  CMD_PNT_CHEQUE_REGISTER=CMD_USER + 1010;  //支票登记凭单打印
  CMD_PNT_CHEQUE_RETURN=CMD_USER + 1011;    //支票退票凭单打印
  CMD_PNT_CHEQUE_COMP_MONEY=CMD_USER + 1012;//退票补款凭单打印
  CMD_PNT_CHEQUE_COMP_CHEQUE=CMD_USER + 1013;//退票补票凭单打印

  CMD_PNT_INDIV_DEDUCT=CMD_USER + 1014;      //散户卡扣款凭单打印
  CMD_PNT_GROUP_DEDUCT=CMD_USER + 1015;      //客户卡扣款凭单打印
  CMD_PNT_CARDTOUNITS=CMD_USER + 1016;      //卡帐户转入企业帐户凭单打印
  CMD_PNT_UNITSTOCARD=CMD_USER + 1017;      //企业帐户转入卡帐户凭单打印
  CMD_PNT_RETURN_HAVECARD=CMD_USER + 1018;  //有卡退卡申请凭单打印
  CMD_PNT_RETURN_NOCARD=CMD_USER + 1019;    //无卡退卡申请凭单打印

  CMD_PNT_GROUP_SAVE=CMD_USER + 1020;    //客户卡存钱凭单打印
  CMD_PNT_INNO_REGISTER=CMD_USER + 1021;    //不记名卡登记凭单打印
  CMD_PNT_REISSUECARD=CMD_USER + 1022;    //补卡凭单打印

  CMD_QUERY_CARDNO=CMD_USER + 1023;        //模糊查询卡号
  CMD_CARD_PURVIEWSAVE=CMD_USER + 1024;    //保存卡权限控制
  CMD_QUERY_PURVIEWINFO=CMD_USER + 1025;   //检索权限信息
  CMD_QUERY_ACCINFO=CMD_USER + 1026;       //检索帐户信息

  CMD_PNT_UNITSTOCARDBATCH=CMD_USER+1027;  // 企业帐户批量转入卡帐户
  CMD_QUERY_MZMKDISCOUNTMONEYINFO=CMD_USER + 1028;       //检索明折明扣优惠信息
  CMD_QUERY_STATIONSALEINFO = CMD_USER + 1029;
  CMD_QUERY_STATIONSALEINFO_RPT=CMD_USER + 1030;
  CMD_REP_CARDMANGEMENT2 = CMD_USER + 1031;
  CMD_REP_PRICESYSTEM = CMD_USER + 1032;

  {
  SERV_INFO_CAPTION = 'SERVER INFO';
  SERV_WARN_CAPTION = 'SERVER MESSAGE';
  SERV_ERR_CAPTION  = 'SSERVER ERROR';
  }
  SERV_INFO_CAPTION = '服务提示信息'; //LSL_TRANS 系统没有使用
  SERV_WARN_CAPTION = '服务警告信息';//LSL_TRANS
  SERV_ERR_CAPTION  = '服务错误信息'; //LSL_TRANS 系统没有使用

  function GetParams(s: String; index: Integer; divs: String=STR_DIV): String;
  function isCHSystem: Boolean;          // 是否中文操作系统
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
    cap := '系统信息';//LSL_TRANS
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
  Stream.Size := VarArrayHighBound(v, 1) - VarArrayLowBound (v, 1) + 1;  //其实可以直接取下维作为流大小，因为一般情况下变体数组上维为0的
  p := VarArrayLock (v);   //我写程序时，就是到此卡住了，因为变体数组是一种安全数组，它是有描述数据的数组，v[0]才是它的真实起始地址，但就是很难得到它的地址，而这个函数刚好处理了这个问题!
  Stream.Write(p^, Stream.Size);  //此句让我这个初学者惊叹，也不是没有这样用过，只是没有在数组中这样结合用过，呵呵，学习学习!
  VarArrayUnlock (v);   //再使用了VarArratLock()函数以后，一定要用此函，不然会报错的!
  Stream.Position := 0;
end;

procedure StreamToVariant(Stream: TStream; var v: OleVariant);
var
  p : pointer;
begin
  v := VarArrayCreate ([0, Stream.Size - 1], varByte);   //也学习一下这个函数，它是用来建立一个变体数组
  p := VarArrayLock (v);   //其它就没有什么了，基本跟上面的是相反的!
  Stream.Position := 0;
  Stream.Read(p^, Stream.Size);   //其实这两个过程的妙处就在此了，指针的应用，棒极了
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
    result := true; //繁体中文
  end
  else if (DefaultID = 2052) then
  begin
    result := true; //简体中文
  end
  else
  begin
    result := false; //其它语言
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
