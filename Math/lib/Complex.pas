{***************************************************************************}
{                                                                           }
{             Модуль:   Комплексные числа                                   }
{             Описание: Операции с комплексными числами                     }
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit Complex;

interface
uses SysUtils;

type
  TNumberView=(DecFrac,Frac);
  TComplexView=(Algeb,Trig,Exponent);

type PFormat=^TFormat;
     TFormat=packed record
     settings:TFormatSettings;
     NumberView:TNumberview;
     ComplexView:TComplexView
end;

type
  TNumber=record
      re,im:double;
      class operator Add(const A,B:TNumber):TNumber;inline;
      class operator Subtract(const A,B:TNumber):TNumber;inline;
      class operator Multiply(const A,B:TNumber):TNumber;inline;
      class operator Divide(const A,B:TNumber):TNumber;
      class operator Negative(const A:TNumber):TNumber;inline;
      class operator Positive(const A:TNumber):TNumber;inline;
      class operator Equal(const A,B:TNUmber):boolean;inline;
      class operator Implicit(const a:extended):TNumber;
      function ToString(const sett:TFormat):Ansistring;
end;

    function IsNan(const AValue: Extended): Boolean;
    function Fact(const A:double):integer;

    function AbsVal(const A:TNumber):double;assembler;overload;
    function AbsVal(const A:double):double;overload;inline;

    function Arg(const A:TNumber):double;assembler;

    function Pow(const A,Exponent:Double):double;overload;
    function Pow(const A:TNumber;Exponent:Double):TNumber;assembler;overload;

    function Sqrtn(const A:TNumber;const N:double):TNumber;assembler;overload;
    function Sqrtn(const A,N:double): double;overload;

    function Ex(const N:TNumber):TNumber;assembler;overload;
    function Ex(const N:double):double;overload;inline;

    function LNat(const N:double):double;overload;inline;
    function LNat(const N:TNumber):TNumber;assembler;overload;
    function LNatNeg(const N:double):TNumber;inline;

    function Cosinus(const A:TNumber):TNumber;assembler;overload;
    function Cosinus(const A:double):double;overload;inline;

    function HypCos(const A:double):double;assembler;
    function HypSin(const A:double):double;assembler;

    function Sinus(const A:double):double;overload;inline;
    function Sinus(const A:TNumber):TNumber;assembler;overload;

    function Tangent(const A:Tnumber):Tnumber;
    function Cotangent(const A:TNumber):TNumber;
    function Secant(const A:Tnumber):Tnumber;
    function Cosecant(const A:Tnumber):Tnumber;

const
      e:extended      = 1e-10;
      Inf:extended    = 1.0/0.0;
      NegInf:extended = -1.0/0.0;
      NaN:extended    = 0.0/0.0;

implementation
{ TComplex }

function IsNan(const AValue: Extended): Boolean;
type
  TExtented = packed record
    Mantissa: Int64;
    Exponent: Word;
  end;
  PExtended = ^TExtented;
begin
  Result := ((PExtended(@AValue)^.Exponent and $7FFF)  = $7FFF) and
            ((PExtended(@AValue)^.Mantissa and $7FFFFFFFFFFFFFFF) <> 0);
end;

{$REGION  'Asm procs'}
     // st=base  st1=exp
procedure PowerN();near;assembler;
var   i,s:integer;
const t:double= 1.00001;
      t2:double=0.99999;
asm
   PUSH    EAX
   PUSH    ECX
   PUSH    EDX
   FLD     e
   FCHS
   FCOMI   st,st(1)          // test a<0
   JNB     @neg
   MOV     s,$01
   JMP     @test_exp
@neg:
   MOV     s,-$01
@test_exp:
   FCHS                  // смена знака у е
   FXCH
   FABS
   FCOMI   st,st(1)         // test a=0
   JB      @end
   FLD     st(2) //b
   FABS
   FCOMI   st,st(2)     //  test b=0
   JNB     @run
   FLD1
   JMP     @end
@run:
   FLD     st
   FRNDINT
   FCOMPP
   FNSTSW  AX
   SAHF
   JZ      @int_power
   FLD     t
   FLD     t2
   FXCH    st(2)
   XOR     ECX,ECX
   JMP     @cycle
   @loop:
      FSQRT
      INC   ECX
@cycle:
   FCOMI   st,st(1)
   JNB     @loop            // пока >t
   FCOMI   st,st(2)         //  или
   JB      @loop            // пока <t2
   FLD1
   FSUBP
   FMUL    st,st(4)
   FLD1
   FADDP
   TEST    ECX,ECX
   JZ      @end
   @loop2:
      FMUL    st,st
      DEC     ECX
   JNZ     @loop2
   JMP     @end
@int_power:
   FLD     st(2)
   FISTP   i
   FLD     st
   MOV     CX,$01
   MOV     EAX,i
   CDQ
   XOR     EAX,EDX        //  abs(eax)
   SUB     EAX,EDX
   @loop3:
   CMP     AX,CX
   JZ      @exit
      FMUL   st,st(1)
      DEC    EAX
   JNZ     @loop3
@exit:
   TEST    EDX,EDX
   JZ      @end       // if pos exponent
   FLD1
   FDIVRP
@end:
   FIMUL   s        // sing
   FFREE   st(1)
   FFREE   st(2)
   FFREE   st(3)
   FFREE   st(4)
   POP     EDX
   POP     ECX
   POP     EAX
end;
      // st arg
procedure Sinh();near;assembler;
const two:double=2.0;
asm
     FLD      st
     FABS
     FLD      e
     FCOMIP   st,st(1)
     JNB      @one
     FSTP     st
     FLD      st
     FCHS
     CALL     Exp
     FXCH
     CALL     Exp
     FSUBR
     FDIV     two
     JMP      @end
     @one:
     FSTP     st(1)
     FSTP     st
     FLD1
@end:
end;
     // st arg
procedure Cosh();near;assembler;
const two:double=2.0;
asm
     FLD      st
     FABS
     FLD      e
     FCOMIP   st,st(1)
     JNB      @one
     FSTP     st
     FLD      st
     FCHS
     CALL     Exp
     FXCH
     CALL     Exp
     FADD
     FDIV     two
     JMP      @end
     @one:
     FSTP     st(1)
     FSTP     st
     FLD1
@end:
end;

{$ENDREGION}

function HypCos(const A:double):double;
asm
   FLD     A
   CALL    Cosh
   FSTP    @result
end;

function HypSin(const A:double):double;
asm
   FLD     A
   CALL    Sinh
   FSTP    @result
end;

function Cosinus(const A:double):double;
begin
  result := cos(a)
end;
   // cos(x+yi)=cos(x)cosh(y)-sin(x)sinh(y)i
function Cosinus(const A:TNumber):TNumber;
asm
   FLD      A.im
   CALL     Cosh
   FLD      A.re
   FCOS
   FMUL
   FSTP     result.re
   FLD      A.im
   CALL     Sinh
   FLD      A.re
   FSIN
   FCHS
   FMUL
   FSTP    result.im
end;

function Sinus(const A:double):double;
begin
  result := sin(a)
end;
     // sin(x+yi)=sin(x)cosh(y)+cos(x)sinh(y)i
function Sinus(const A:TNumber):TNumber;
asm
   FLD      A.im
   CALL     Cosh
   FLD      A.re
   FSIN
   FMUL
   FSTP     result.re
   FLD      A.im
   CALL     Sinh
   FLD      A.re
   FCOS
   FMUL
   FSTP    result.im
end;

function Tangent(const A:Tnumber):Tnumber;
begin
    result:=sinus(A)/cosinus(A);
end;

function Secant(const A:Tnumber):Tnumber;
begin
  result:=1/cosinus(A)
end;

function Cosecant(const A:Tnumber):Tnumber;
begin
  result:=1/sinus(A)
end;

function Cotangent(const A:TNumber):TNumber;
begin
  result:=cosinus(A)/sinus(A)
end;
      //  Натуральный логарифм
function LNat(const N:double):double;
begin
   result := Nan;
   if (N > e) then result := ln(n);
end;

function LNatNeg(const N:double):TNumber;
begin
   result.re := Nan;
   result.im := Nan;
   if (N < e) then
   begin
      result.im := ln(abs(n));
      result.re := pi
   end
end;

function LNat(const N:TNumber):TNumber;
asm
   CALL    AbsVal
   FLDLN2
   FXCH
   FYL2X
   FSTP    result.re
   CALL    Arg
   FSTP    result.im
end;


     // Экспонента
function Ex(const N:double):double;
begin
  result := exp(n)
end;

function Ex(const N:TNumber):TNumber;
asm
   FLD    N.re
   CALL   Exp
   FLD    N.im
   FCOS
   FMULP
   FSTP   result.re
   FLD    N.re
   CALL   Exp
   FLD    N.im
   FSIN
   FMULP
   FSTP   result.im
end;

          // Модуль
function AbsVal(const A:double):double;
begin
  result := abs(a)
end;

function AbsVal(const A:TNumber):double;
asm
   FLD    A.im
   FLD    st
   FMUL
   FLD    A.re
   FLD    st
   FMUL
   FADD
   FSQRT
end;

function Fact(const A:double):integer;
var i:byte;n:integer;
begin
  result:=1;
  n:= trunc(abs(A));
  if (n > 1) then
      for i:=1 to n do result := result * i
end;
          // Аргумент
function Arg(const A:TNumber):double;
const two:double=2;
asm
    FLD     e
    FLD     st
    FCHS
    FLD     A.im
    FLD     st
    FABS
    FLD     A.re
    FLD     st
    FABS
    FCOMI    st,st(5)
    JNB      @next1
    FXCH     st(2)
    FCOMI    st,st(5)
    FXCH     st(2)
    JNB      @next1
    FLD      Nan           //  re=0 & im=0
    JMP      @end
@next1:
    FXCH
    FCOMI    st,st(5)
    FXCH
    JB       @next2
    FXCH     st(2)
    FCOMI    st,st(5)
    FXCH     st(2)
    JNB      @next2
    FLDZ                 //  re>0 & im=0
    JMP      @end
  @next2:
    FXCH
    FCOMI    st,st(4)
    FXCH
    JNB      @next3
    FXCH     st(2)
    FCOMI    st,st(5)
    FXCH     st(2)
    JNB      @next3
    FLDPI               //  re<0 & im=0
    JMP      @end
  @next3:
    FCOMI    st,st(5)
    JNB      @next4
    FXCH     st(3)
    FCOMI    st,st(5)
    FXCH     st(3)
    JB       @next4
    FLDPI              //  re=0 & im>0
    FDIV     two
    JMP      @end
  @next4:
    FCOMI    st,st(5)
    JNB      @next5
    FXCH     st(3)
    FCOMI    st,st(4)
    FXCH     st(3)
    JNB      @next5
    FLDPI              //  re=0 & im<0
    FCHS
    FDIV     two
    JMP      @end
  @next5:
    FXCH
    FCOMI    st,st(5)
    JB       @next6
    FXCH     st(2)
    FCOMI    st,st(5)
    FXCH     st(2)
    JB       @next6
    FLD      A.im         // re>0 & im <>0
    FLD      A.re
    FDIV
    FLD1
    FPATAN
    JMP      @end
  @next6:
    FCOMI    st,st(4)
    JNB      @next7
    FXCH     st(3)
    FCOMI    st,st(4)
    FXCH     st(3)
    JNB      @next7
    FLD      A.im        // re<0  & im<0
    FLD      A.re
    FDIV
    FLD1
    FPATAN
    FLDPI
    FCHS
    FADDP
    JMP     @end
  @next7:
    FCOMI    st,st(4)
    JNB      @end
    FXCH     st(3)
    FCOMI    st,st(5)
    FXCH     st(3)
    JB       @end
    FLD      A.im      // re<0  &  im>0
    FLD      A.re
    FDIV
    FLD1
    FPATAN
    FLDPI
    FADDP
@end:
  FFREE   st(1)
  FFREE   st(2)
  FFREE   st(3)
  FFREE   st(4)
  FFREE   st(5)
  FFREE   st(6)
end;
                // Извлечение корня n-ой степени
function Sqrtn(const A,N:double): double;
asm
   FLD    N
   FLD    e
   FCHS
   FCOMIP st,st(1)
   JNB    @error
   FLD    A
   FLD1
   FDIV
   CALL   PowerN
   FSTP   @result
@error:
   FLD    NAN
   FSTP   @result
end;

function Sqrtn(const A:TNumber;const N:double): TNumber;
var tmp:double;
const two:double=2;
asm
   FLD      n
   FLD      e
   FCHS
   FCOMIP   st,st(1)
   JNB      @error
   FSTP     st
   CALL     AbsVal
   FXCH
   FLD1
   FDIVR
   FXCH
   CALL     PowerN
   FSTP     tmp
   CALL     Arg
   FLD      tmp
   FXCH
   FLD    n
   FLD    st
   FLDPI
   FMUL
   FMUL   two
   FADD   st,st(2)
   FLD    st
   FDIV   st,st(2)
   FCOS
   FMUL   st,st(4)
   FSTP   result.re
   FLD    st(2)
   FABS
   FSTP   st
   FDIVR
   FSIN
   FMUL   st,st(2)
   FSTP   result.im
   JMP    @end
@error:
   FLD    NaN
   FST    result.re
   FSTP   result.im
@end:
   FFREE  st
   FFREE  st(1)
   FFREE  st(2)
end;
          // Возведение в степень
function Pow(const A,Exponent:Double):double;
asm
   FLD    Exponent
   FLD    A
   CALL   PowerN
   FSTP   @result
end;

function Pow(const A:TNumber;Exponent:Double):TNumber;
var abs_val:double;
asm
   CALL   AbsVal
   FLD    Exponent
   FXCH
   CALL   PowerN
   FSTP   abs_val
   CALL   Arg
   FLD    Exponent
   FXCH
   FMULP
   FLD    st
   FLD    abs_val
   FXCH
   FCOS
   FMUL   st,st(1)
   FSTP   result.re
   FXCH
   FSIN
   FMUL
   FSTP   result.im
end;

class operator TNumber.Implicit(const a:extended):TNumber;
asm
   FLD    a
   FLDZ
   FSTP   result.im
   FSTP   result.re
end;

class operator TNumber.Equal(const A,B:TNUmber):boolean;
begin
   result := (abs(A.re - B.re) < e) and (abs(A.im - B.im) < e)
end;

{$REGION ' Арифметические операции '}
class operator Tnumber.Positive(const A:TNumber):TNumber;
begin
    result.re := +A.re;
    result.im := +A.im;
end;

class operator TNumber.Negative(const A:TNumber):TNumber;
begin
   result.re := -A.re;
   result.im := -A.im;
end;

class operator TNumber.Subtract(const A,B:TNumber):TNumber;
begin
   result.re := A.re - B.re;
   result.im := A.im - B.im;
end;

class operator TNumber.Divide(const A,B:TNumber):TNumber;
var ch,zn:Double;
label ZeroDivide;
begin
   result.re := NAN;
   result.im := NAN;

   ch := (A.re * B.re) + (A.im * B.im);
   zn := (B.re * B.re) + (B.im * B.im);

   if absval(zn) > e then
   begin
        result.re := ch / zn;
        ch := (A.im * B.re) - (A.re * B.im);
        result.im := ch / zn;
   end

   { else if (A.iscomplex) and (not B.iscomplex)then
    begin
      if absval(B.float)>e then
      begin
       iscomplex:=true;
       re:=A.re/B.float;
       im:=A.im/B.float;
      end
      else goto ZeroDivide
    end

    else if (not A.iscomplex) and (B.iscomplex)then
    begin
      iscomplex:=true;
      if Absval(B.im)<Abs(B.re) then
      begin
        if  absval(B.re)<e then goto ZeroDivide;
        ch := B.im/B.re;
        zn := B.re+B.im*ch;
        if absval(zn)>e then
        begin
          re := A.float/zn;
          im := -A.float*ch/zn;
        end
        else goto ZeroDivide
      end else
      begin
        if abs(B.im)<e then goto ZeroDivide;
        ch := B.re/B.im;
        zn := B.im+B.re*ch;
        if absval(zn)>e then
        begin
          re := A.float*ch/zn;
          im := -A.float/zn;
        end
        else goto ZeroDivide
      end
    end

    else begin
      iscomplex:=false;
      if (absval(B.float)>e) then float:=A.float/B.float
      else goto ZeroDivide;
    end;

    exit(result);
ZeroDivide:
     result.iscomplex:=false;
     result.float:=Nan }
end;

class operator TNumber.Multiply(const A,B:TNumber):TNumber;
begin
   result.re := (A.re * B.re) - (A.im * B.im);
   result.im := (A.im * B.re) + (A.re * B.im);
end;

class operator TNumber.Add(const A,B:TNumber):TNumber;
begin
   result.re := A.re + B.re;
   result.im := A.im + B.im;
end;
{$ENDREGION}

function Convert(num: double;accuracy:byte):Ansistring;
var ch,zn,i,sig:integer;
    r,h:double;
    israt:boolean;
begin
 if IsNan(num)then
    result:='Nan'
 else if (abs(num) > e) then
 begin
    if (num < -e) then sig := -1 else sig := 1;
    num := abs(num);
    h   := 10;
    for i:=1 to accuracy-1 do h := h * h;
    h := 1 / h;
    israt := (abs(num) < 1) and (abs(num) > e);
    ch := 1;
    zn := 1;

    if israt then
    begin
      ch := 1; zn := 2;
    end;

    r:=ch/zn;
    while (abs(r-num) > h) do    // Пока r <> num
    begin

      if (r < (num - h)) then inc(ch)  // Если r<num то
      else if (r > (num+h)) then inc(zn);

      r:=ch/zn;
    end;

    if (ch = zn) then
      result:='1'
    else if (zn = 1) then
      result:=Ansistring(IntToStr(ch*sig))
    else
      result:=Ansistring(IntToStr(ch*sig)+'/'+IntToStr(zn));

 end else result:='0';
end;

  {rmNearest=0, rmDown=1, rmUp=2, rmTruncate=3 }
procedure ChCW(const CW:Word);assembler;register;
var v:word;
asm
    SHL      AX,10
    FNSTCW   v
    OR       v,AX
    FLDCW    v
end;

function FloatToString(const num:double;const sett:TFormat):Ansistring;
var   s,t:integer;
      buf:double;
begin
  asm
        PUSH   dword ptr [EBP+$0c]
        PUSH   dword ptr [num]
        CALL   IsNan
        TEST   AL,AL
        JZ     @begin
        FLD    NaN
        JMP    @end
@begin:
        FLD    num
        FLD    e
        FCHS
        FCOMIP st,st(1)
        JNB    @neg    // if num<-e
        MOV    s,1
        JMP    @run
@neg:
        MOV    s,-1
@run:
        FABS
        FLD1
        FXCH
        FLD    st
        FISTP  t
        FILD   t
        MOV    EAX,sett
        MOVZX  ECX,[EAX].TFormat(settings).CurrencyDecimals
        MOV    EAX,$A   // multiplyer   10^x  stored in fpu
        FXCH
        FSUB   st,st(1)
        MOV    t,EAX
        FILD   t
        FXCH
        @loop:
          FMUL    st,st(1)
          FXCH
          FMUL    st(3),st
          FXCH
          FIST    t       //  trunc
          MOV     EAX,t
          TEST    EAX,EAX
          JZ      @zero
          FILD    t
          FLD     st
          FDIV    st,st(5)
          FADDP   st(4),st
          FSUBP
        @zero:
          DEC  ECX
        JNZ    @loop
        FXCH   st(2)
        FIMUL  s
@end:
        FSTP   buf
        FFREE  st
        FFREE  st(1)
        FFREE  st(2)
  end;
  result:=AnsiString(FloatToStr(buf,sett.settings));
end;

function TNumber.ToString(const sett:TFormat):Ansistring;
begin
Result:='';
with sett do
  case sett.NumberView of
     Frac: begin
              Result := Result + Convert(re,settings.CurrencyDecimals);

              if(im>-e)then
                 Result := Result + '+' + Convert(im,settings.CurrencyDecimals) + 'i'
              else
                 Result := Result + Convert(im,settings.CurrencyDecimals) + 'i';
           end;
  DecFrac: begin
              if abs(re) > e then
                 Result := Result + FloatToString(re,sett);
              if(im > -e) and (abs(re) > e) then
                 Result := Result + '+' + FloatToString(im,sett) + 'i'
              else
                 Result := Result + FloatToString(im,sett) + 'i';
           end;
  end
end;
end.

