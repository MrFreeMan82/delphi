{***************************************************************************}
{                                                                           }
{             Модуль:   Транслятор                                          }
{             Описание: Перевод текста в польскую запись                    }
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit Translator;

interface
uses SysUtils,StrUtils,Vectors,Matrixes,DynArray,Complex;

type
    TDataType = (None,Ident,Constant,Vect,Mat);
    PDataItem =^  TDataItem;
    TDataItem = record
      d_type  : TDataType;
      name    : string[10];
      Matrix  : PMatrix;
      Vector  : PVector;
      number  : TNumber;
end;

type
  UPMatrix  = PMatrix;  // Для тестов
  TData = TArray <TDataItem>;
  PData =^  TData;

type TPz  = class(TArray<integer>)
   procedure Add_pz(const op:integer);inline;
   procedure Del_pz();inline;
   procedure Pz_Control(const op:integer);
   constructor Create;
   destructor Destroy;override;
end;

type TUserFunc  = class
     name:string[10];
     addr:integer;
     params:array[0..4]of integer;
     body:TPz;
     fu_data:TData;
     constructor Create;
     destructor Destroy;override;
end;

type TStack = class(TArray<integer>)
    procedure Push(const op:integer);inline;
    procedure Del_st();inline;
    function Pop():integer;inline;
    constructor Create;
    destructor Destroy;override;
end;

const
  NData     = 200;      // Минимальный адресс хранения операндов
  NFunc     = 100;      // Минимальный адресс хранения функций
  NFunc_Max = 13;    // максимальное число функций
  UFunc_Min = NFunc+NFunc_Max+1;
  NConst    = -100;
  Def_const = 2;
const
  Pow       = 2;
  Cross     = 3;
  Mul       = 4;
  Division  = 5;        // Коды операций
  Plus      = 6;
  UMinus    = 7;
  Minus     = 8;
  Func_abs  = 9;
  Factorial = 10;
  Brac_Op   = 11;
  Brac_Cl   = 12;
                //  Служебные коды
  Assign    = 13;
  Semicolon = 14;
  CPop      = 15;
var
  GData     : TArray <TDataItem>;              // Массив для хранения Глобальных Данных
  Consts    : TArray <TNumber>;            // Массив констант
  UserFuncs : TArray<TUserFunc>;

procedure Read(const input:Ansistring;const sett:TFormat;out Pz:TPz);
procedure Clear();
procedure Free;

implementation

var   Stack               : TStack;
      item                : TDataItem;
      data_min            : integer=Def_Const;  // Минимальное кол-во данных. Используется при очистке
      User_func_active    : boolean=false;
      Func_params_active  : boolean=false;
      User_func_addr      : integer=0;
                            //  Массив польской записи
const
 SetVars:set of AnsiChar  = ['A'..'Z','a'..'z','_']-['X'];
 SetNums:set of AnsiChar  = ['0'..'9','.'];
 SetDiv:set of AnsiChar   = ['#','`','+','-','*','X','/','=',',',';','(',')','[',']','^','|','{','}','i','e'];
 Functions:array[0..NFunc_Max] of Ansistring=('exp','sin','cos','sqrt','ln',
                                            'tg','ctg','sec','cosec','sinh','cosh','dx','integ','sys');

{ TUserFunc }
constructor TUserFunc.Create;
begin
  body    :=  TPz.Create;
  fu_data :=  TData.Create;
end;

destructor TUserFunc.Destroy;
begin
  FreeAndNil(body);
  FreeAndNil(fu_data)
end;
{ TStack }
{$REGION ' TStack '}
constructor TStack.Create;
begin
  inherited Create;
end;

destructor TStack.Destroy;
begin
   inherited Destroy;
end;

procedure TStack.Push(const op: integer);
begin
  Add(op)
end;

procedure TStack.Del_st;
begin
  if (Len  > 0) then Del;
end;

function TStack.Pop: integer;
begin
  result  :=  self[len-1];
  del_st
end;
{$ENDREGION}

{ TPz }
{$REGION ' TPz '}
constructor TPz.Create;
begin
  inherited Create
end;

destructor TPz.Destroy;
begin
  inherited Destroy
end;

procedure TPz.Add_pz(const op:integer);
begin
  Add(op);
end;

procedure TPz.Del_pz();
begin
  Del;
end;

procedure TPz.Pz_Control(const op:integer);

  function Prior(op:integer):integer;inline;
  begin
    case op of
      UMinus:             result:=6;
      Pow:                result:=5;
      Factorial:          result:=4;
      Mul,Division,Cross: result:=3;
      Plus,Minus:         result:=2;
      Brac_cl:            result:=1;
      else                result:=0;
    end
  end;

begin
 with stack do begin
  if ((len  =0) or  (Prior(op) = 0)) then Push(op)
  else if (op = Brac_cl)then
  begin
      while (Stack[len-1] <>  Brac_op) do Add_pz(Pop());
      if (Stack[len-1]  = Brac_op)then
      begin
          Del_st();
          if (len > 0) and (stack[len-1] in [NFunc..NData-1])then  Add_pz(Pop());   // Если на вершине стека функция
      end;
  end else if (Prior(op)  < Prior(Stack[len-1])) then
  begin
    repeat
         Add_pz(Pop());
    until (Len  = 0) or (Prior(op)  > Prior(Stack[len-1]));
    Push(op)
  end else Push(op)
 end;
end;

{$ENDREGION}

{$REGION ' Служебные процедуры '}

procedure Clear();
var i,j,k:integer;
begin
  k :=  0;
  if (UserFuncs <>  nil) then
    for i:=0 to UserFuncs.Len-1 do
    begin
       for j:=0 to high(UserFuncs[i].params) do
           if (UserFuncs[i].params[j] = 0) then continue else inc(k);
          UserFuncs[i].fu_data.SetLen(k);
          k :=  0
    end;
  User_func_active    :=  false;
  Func_params_active  :=  false;
  User_func_addr      :=  0;
  FillChar(item,sizeof(item),0);
  Gdata.SetLen(data_min);
end;

procedure Free;
var i:integer;
begin
  for i:=0 to UserFuncs.Len-1 do begin
      UserFuncs[i].Free;
      UserFuncs[i]  :=  nil
  end;
  consts.SetLen(0);
  stack.SetLen(0);
  UserFuncs.SetLen(0);
  GData.SetLen(Def_Const);
  User_func_active  :=  false;
  User_func_addr    :=  0;
  FillChar(item,sizeof(item),0);
end;

procedure PrepearStr(const input:AnsiString;var s:AnsiString);
var i,strlen:integer;
begin
  i :=  1;
  strlen  :=  length(input);
             // Формирование строки без пробелов
  while (i  <=  strlen)do
    if (input[i] in [#0,#13,#10,' '])then inc(i)
    else if input[i]='#' then
    begin
      repeat inc(i) until(input[i] in [#0,#13,#10]);
      inc(i);
    end
    else begin s  :=  s + input[i]; inc(i)  end;
end;

function CharPos(const Ch:AnsiChar;const instr:AnsiString):integer;
asm
  PUSH     ESI
  XOR      ECX,ECX           // счетчик позиции
  MOV      result,ECX
  MOV      ECX,[EDX-$04]       // длина
  TEST     ECX,ECX
  JZ       @end
  SHL      EAX,$08
  SHL      ECX,$10
  MOV      ESI,EDX
  CLD
@loop:
  INC      CX
  ROL      ECX,$10
  LODSB
  CMP      AH,AL
  JZ       @Find
  DEC      CX
  ROR      ECX,$10
  JNZ      @loop
  JMP      @end
@Find:
  SHR      ECX,$10
  MOV      result,ECX
@end:
  POP      ESI
end;

{$ENDREGION}


procedure Read(const input:Ansistring;const sett:TFormat;out Pz:TPz);
var pos,i,j,r_count,c_count,t:integer;
    r,c:Word;
    der_order:integer;
    strlen:integer;
    tmp:TNumber;
    s,f_body:AnsiString;
    bo,bc,param_count:integer;

{$REGION ' Служебные '}

    function GetNum():TNumber;
    var
      nums: double;
      is_num,frac,mul:boolean;
      i:integer;
      number:AnsiString;
    begin
      is_num  :=  true;
      i       :=  0;
      nums    :=  0;
      frac    :=  false;mul:=false;
      while(is_num)do
      begin
        while (s[pos] in SetNums+['e'])do
        begin
            if (s[pos]='e') then
            begin
              if (s[pos+1]='-') then        number :=  number  + 'e-'
              else if (s[pos+1] = '+')then  number :=  number  + 'e+'
              else raise exception.Create('Неверная запись числа.');
              inc(pos,2)
            end;
            number  :=  number  + s[pos];
            inc(pos);
        end; // while
        if (frac and (i > 0)) then
        begin
          if mul then
          begin
            nums  :=  nums  * abs(StrToFloat(string(number),sett.settings));
            mul   :=  false
          end else
            nums  :=  nums  / abs(StrToFloat(string(number),sett.settings));
          frac  :=  false;
        end
        else if (not frac) and (number  <>  '') then
        begin
            if (i <=  1) then
            begin
              nums  :=  StrToFloat(string(number),sett.settings);
              inc(i)
            end
        end
        else if (frac and (i<0)) then raise Exception.Create('Ошибочная запись.');
          number:='';
          if ((s[pos] in ['/','*'])and (s[pos+1] in SetNums)) and (not frac)then
          begin
            if s[pos] = '*'then mul :=  true;
            frac  :=  true;
            inc(pos)
          end;
        if not (s[pos] in SetNums) then is_num  :=  false;
      end; // while
      with Result do
        if (i <=  2) then
        begin
          float     :=  nums;
          iscomplex :=  false;
        end
    end;

    function Exists(var data_val:TData;const name:Ansistring):boolean;
    var i:integer;
    begin
      Result  :=  false;
      if (data_val.Len  = 0) then exit(false);
      for i:=0 to data_val.len-1 do
        if  (data_val[i].name = name)then
        begin
           pz.Add_pz(Ndata+i);
           FillChar(item,sizeof(item),0);
           exit(true);
        end;
      if (result  = false) and Func_params_active then
        raise Exception.Create('НеобЪявленная переменная "'+string(name)+'"');
    end;

    function ExistsFunc(const name:AnsiString):boolean;
    var i:integer;
    begin
       result :=  false;
       if (userfuncs.Len  = 0) then exit(false);
       for i:=0 to userfuncs.Len-1 do
          if (userfuncs[i].name = name)then
          begin
           stack.Push(UserFuncs[i].addr);
           FillChar(item,sizeof(item),0);
           Func_params_active :=  true;          // Ввод параметров
           exit(true);
          end;
    end;

    procedure GetDim(out rows,cols:Word; is_matrix:boolean=true);
    var j,brakcount,str:Word;ch:AnsiChar;
        encomcount:boolean;
    begin
    brakcount :=  0;
    j         :=  pos;
    str       :=  0;
    encomcount:=  false;
    ch:=#0;
    while (ch <>  ';')do
    begin
       ch :=  s[j];
       case ch of
          ',': if encomcount then
                inc(str);
      '[','{': begin
                inc(brakcount);
                encomcount:=true;
               end;
      ']','}': begin
                inc(brakcount);
                inc(str);
                encomcount:=false;
               end;
       end; //CASE
       inc(j)
    end;
    if is_matrix then try
      rows  :=  brakcount shr 1;
      cols  :=  str div rows
    except
      raise Exception.Create('Не правильно введина матрица.');
    end else begin
      rows  :=  str;
      cols  :=  0;
    end
    end;
{$ENDREGION}

begin
  FillChar(item,sizeof(item),0);
  der_order :=  0;
  r :=  0;c :=  0;
  bo:=  0;bc:=  0;
  pos:= 1;t :=  0;
  param_count :=0;
  r_count :=  0;
  c_count :=  0;
  strlen  :=  Length(input);
  if (strlen  = 0) then begin pz  :=  nil;  exit end;
  pz  :=  TPz.Create;
  PrepearStr(input,s);
 // if CharPos(';',s)>0 then

             // Формирование лексемы
 repeat
    repeat
            // Формирование имени лексемы
      while (s[pos] in SetVars) do
      begin
         inc(t);
         if (t  > 9) then
         begin
          while s[pos] in SetVars do inc(pos);
          break;
         end;
         item.name  :=  item.name + s[pos];
         if (item.d_type  = None) then item.d_type  :=  Ident;
         inc(pos);
      end;
      t :=  0;
      if (length(item.name) > 0) and (item.d_type = Ident) then
      begin
        if (item.name = 'i')  and (s[pos-2] in SetNums)then
        begin
           item.name  :=  '';
           if (item.d_type  = Ident) then item.d_type:=Constant;
           dec(pos);
        end;
             // Если переменная является функцией
        if (item.d_type=ident) then
        begin
          if (length(item.name) > 1) then
            for i:=0 to NFunc_Max do
              if  (item.name = Functions[i])then
              begin
                if (item.name = 'integ') then pz.Add_pz(Nfunc+i)
                else stack.Push(NFunc+i);
                item.d_type :=  None;
                item.name   :=  '';
                break
              end;
          if (s[pos]  = '(') and (item.d_type = Ident) then
             if (not ExistsFunc(item.name)) then
               begin
                 User_func_active :=  true;
                 UserFuncs.SetLen(UserFuncs.Len+1);                  // Выделяем место под функцию
                 UserFuncs[UserFuncs.Len-1] :=  TUserFunc.Create;     // Создаем функцию
                 with UserFuncs[UserFuncs.Len-1] do
                 begin
                  i       :=  UFunc_min+(UserFuncs.Len-1);
                  name    :=  item.name;
          User_func_addr  :=  i-UFunc_min;
                  addr    :=  i;
                  f_body  :=  leftstr(s,CharPos('=',s)-1);
                  f_body  :=  midstr(f_body,CharPos('(',s)+1,CharPos(')',s));
                item.name :=  '';
                  for i:=1 to length(f_body)do
                  begin               // Выделяем параметры функции
                     if (f_body[i] in SetVars) then
                        item.name :=  f_body[i]
                     else if (length(item.name) = 0) then break     // Функция без параметров
                     else if (not Exists(Fu_data,item.name)) then
                     begin
                        fu_data.SetLen(fu_data.Len+1);
                        fu_data[fu_data.Len-1]  :=  item;
                        params[param_count]     :=  (fu_data.len-1)+NData;
                        inc(param_count);
                     end
                  end;
                  j       :=  CharPos('=',s);
                  f_body  :=  midstr(s,j+1,length(s));
                  i       :=  CharPos(';',f_body);
                  f_body  :=  leftstr(f_body,i);
                  pos     :=  j+length(f_body);
                  Read(f_body,sett,body);     //  Читаем тело функции
                  User_func_active  :=  false;
                  User_func_addr    :=  0;
                  FillChar(item,sizeof(item),0);
                 end
             end
        end;
        if (item.d_type = Ident) then
        begin
          if User_func_active and
             (not Exists(UserFuncs[User_func_addr].Fu_data,item.name)) then
          with UserFuncs[User_func_addr] do
          begin
            fu_data.SetLen(fu_data.Len+1);
            fu_data[fu_data.Len-1]  :=  item;
            pz.Add_pz((fu_data.len-1)+NData);
          end
          else if (not User_func_active) and
                  (not Exists(Gdata,item.name)) then
          begin
            Gdata.SetLen(Gdata.Len+1);
            Gdata[Gdata.len-1]  :=  item;
            pz.Add_pz((Gdata.len-1)+NData);
            inc(data_min);
          end;
          FillChar(item,sizeof(item),0);
        end;
      end {if};
                  // Если число
      if (s[pos] in SetNums) then with item do
      begin
          case d_type of
                Mat: begin
                       Matrix^[r_count,c_count]:=GetNum();
                       inc(c_count);
                       if (c_count = Matrix.ColsCount) then
                       begin
                         c_count  :=  0;
                         inc(r_count);
                       end
                     end;
               Vect: begin
                       Vector^[r_count] :=  GetNum();
                       inc(r_count);
                     end;
               else begin
                       consts.SetLen(consts.Len+1);
                       consts[consts.len-1] :=  GetNum();
                       pz.Add_pz(NConst-(consts.len-1));
                    end
          end;
          if (stack.Len > 0) and (stack[stack.len-1]  = UMinus) then
          begin
             case d_type of
                Mat: Matrix^[r_count,c_count-1] :=  -Matrix^[r_count,c_count-1];
               Vect: Vector^[r_count-1]         :=  -Vector^[r_count-1];
               else  consts[consts.len-1]       :=  -consts[consts.len-1];
             end; {case}
             stack.Del_st();    // Del minus sign
          end
      end;
                 // Если оператор или разделитель
      try case s[pos] of
          'i': with tmp,item do
               begin
                  iscomplex :=  true;
                  case d_type of
                     Mat: re  :=  Matrix^[r_count,c_count-2].float;
                    Vect: re  :=  Vector^[r_count-2].float;
                     else re  :=  consts[consts.len-2].float;
                  end;
                  if (stack[stack.len-1]  = Minus) then
                    case d_type of
                      Mat:  im  :=  -Matrix^[r_count,c_count-1].float;
                      Vect: im  :=  -Vector^[r_count-1].float;
                       else im  :=  -consts[consts.len-1].float
                    end
                  else
                    case d_type of
                      Mat:  im  :=  Matrix^[r_count,c_count-1].float;
                      Vect: im  :=  Vector^[r_count-1].float;
                       else im  :=  consts[consts.len-1].float
                    end;
                  case d_type of
                     Mat: Matrix^[r_count,c_count-2]  :=  tmp;
                    Vect: Vector^[r_count-2]  :=  tmp;
                    else begin
                      pz.SetLen(pz.Len-2);
                      consts.SetLen(consts.Len-1);
                      consts[consts.len-1]  :=  tmp;
                      pz.Add_pz(NConst-(consts.len-1));
                    end;
                  end;
                  stack.Del_st;
                  if d_type in [Mat,Vect]then dec(c_count);
                  inc(pos)
               end;
          '(': begin
                  pz.Pz_Control(Brac_op);
                  inc(bo);inc(pos)
               end;
          ')': begin
                if Func_params_active then Func_params_active:=false;
                pz.Pz_Control(Brac_cl);inc(bc);inc(pos)
               end;
          '!': begin pz.Pz_Control(Factorial);  inc(pos) end;
          'X': begin pz.Pz_Control(Cross);  inc(pos)  end;
          '*': begin pz.Pz_Control(Mul);  inc(pos)  end;
          '/': begin pz.Pz_Control(Division); inc(pos)  end;
          '-': begin
                  if (s[pos-1] in ['^',',','[','{','=','(','|',#0]) and
                      (not(s[pos+1] in [')','|']))
                  then pz.Pz_Control(UMinus)
                  else pz.Pz_Control(Minus);
                  inc(pos)
               end;
          '+': begin pz.Pz_Control(Plus); inc(pos)  end;
          '^': begin
                 pz.Pz_Control(Pow);  inc(pos)
               end;
          '`': begin
                pz.Add_pz(111);
                inc(der_order);
                inc(pos);
                while (s[pos]  = '`') do begin inc(der_order);  inc(pos) end;
                consts.SetLen(consts.Len+1);
                consts[consts.Len-1]  :=  der_order;
                pz.Add_pz(NConst-(consts.Len-1));
               end;
          '=': if (s[pos-1] in SetVars+['`']) then
               begin
                pz.Pz_Control(Assign);  inc(pos)
               end
               else raise Exception.Create('Переменная ожидалась но '+s[pos-1]+' встретился.');
          '|': if (s[pos-1] in ['|','(','=','+','-','*','/',#0,';'])  then
               begin
                  pz.Pz_Control(Func_abs);inc(pos)     // Если первый раз
               end
               else begin
                   repeat i :=  stack.Pop(); pz.Add_pz(i) until  (i  = Func_abs);
                   inc(pos)
               end;
          '{': begin
                  GetDim(r,c,false);
                  item.d_type :=  Vect;
                  item.name   :=  Gdata[Gdata.len-1].name;
                  New(item.Vector);
                  item.Vector.VectorLength  :=  r;
                  stack.Del_st;
                  pz.Del_pz;
                  r_count := 0;
                  inc(pos)
               end;
          '[': if (item.d_type  <>  Mat) then
               begin
                  item.d_type :=  Mat;
                  item.name   :=  Gdata[Gdata.len-1].name;
                  GetDim(r,c);
                  New(item.Matrix);
                  item.Matrix.SetMatrix(r,c);
                  stack.Del_st;      //  Удаляем =
                  pz.Del_pz;        //   Удаляем адрес массива тк инициализация происходит здесь
                  r_count := 0;
                  c_count := 0;
                  inc(pos);
               end else inc(pos);
      ']','}': inc(pos);
          ';': ;
          ':': if User_Func_Active then
               begin
                  if (s[pos-1]  <>  ')') then raise Exception.Create('Пропущена скобка в позиции '+IntToStr(pos));
                  pz.Add_pz(CPop);
                  inc(pos)
               end;
          ',': if (stack.Len  > 0) and (not (item.d_type in [Mat,Vect])) then
               begin
                  while (stack[stack.Len-1] <> Brac_op) do pz.Add_pz(stack.Pop);
                  inc(pos);
               end else inc(pos)
          else raise Exception.Create('Неизвестный символ или неправильный ввод.');
        end; {case}
      except
         Free;
         pz.Free;
         raise
      end;
      if (s[pos]  = ';')  and
         (not  (item.d_type in [Mat,Vect])) and
         ((pz.Len > 0)  and (pz[pz.len-1] <>  Semicolon)) then
      begin
         for i:=0 to stack.len-1 do pz.Add_pz(stack.Pop());
         pz.Add_pz(Semicolon);
      end;
    until (s[pos] = ';');
    delete(s,1,CharPos(';',s));
    strlen  :=  length(s);
    pos     :=  1;
    if (item.d_type in [Mat,Vect]) then
    begin
       if User_Func_Active then
          with UserFuncs[User_func_addr] do fu_data[fu_data.Len-1]  :=  item
       else
         Gdata[Gdata.Len-1] :=  item;
         FillChar(item,sizeof(item),0);
    end;
  until(pos >=  strlen);
  if (bo  > bc) then raise Exception.Create('Нехватает закрываюших скобок.')
  else if (bo < bc) then raise Exception.Create('Не хватает открывающих скобок.');
end;


initialization
  stack     :=  TStack.Create;
  consts    :=  TArray <TNumber>.Create;
  UserFuncs :=  TArray<TUserFunc>.Create;
  Gdata     :=  TArray <TDataItem>.Create;
  Gdata.SetLen(Def_const);

  item.name         :=  'pi';
  item.d_type       :=  constant;
  item.number.float :=  pi;
  Gdata[Gdata.len-2]:=  item;

  item.name         :=  'e';
  item.d_type       :=  constant;
  item.number.float :=  exp(1);
  Gdata[Gdata.len-1]:=  item;

finalization
  FreeAndNil(stack);
  FreeAndNil(Gdata);
  FreeAndNil(consts);
  FreeAndNil(UserFuncs);

end.
