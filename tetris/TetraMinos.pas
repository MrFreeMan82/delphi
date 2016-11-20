unit TetraMinos;

interface
uses sysutils;

type TTetraMinoType = (tLine,tZ,tRZ,tL,TRL,tT,tSQ);
type TAngle = (a0,a90,a180,a270);

resourcestring
  sLine   = '1111' +
            '0000' +
            '0000' +
            '0000';

  sLine90 = '1000' +
            '1000' +
            '1000' +
            '1000';

    sZ    = '1100' +
            '0110' +
            '0000' +
            '0000';

    sZ90  = '0100' +
            '1100' +
            '1000' +
            '0000';

   sRZ    = '0110' +
            '1100' +
            '0000' +
            '0000';

    sRZ90 = '1000' +
            '1100' +
            '0100' +
            '0000';

    sL    = '1000' +
            '1110' +
            '0000' +
            '0000';

    sL90 =  '1100' +
            '1000' +
            '1000' +
            '0000';

   sL180 =  '1110' +
            '0010' +
            '0000' +
            '0000';

   sL270 =  '0100' +
            '0100' +
            '1100' +
            '0000';

   sRL   =  '1110' +
            '1000' +
            '0000' +
            '0000';

   sRL90 =  '1100' +
            '0100' +
            '0100' +
            '0000';

   sRL180 = '0010' +
            '1110' +
            '0000' +
            '0000';

   sRL270 = '1000' +
            '1000' +
            '1100' +
            '0000';

   sT     = '1110' +
            '0100' +
            '0000' +
            '0000';

   sT90   = '0100' +
            '1100' +
            '0100' +
            '0000';

   sT180 =  '0100' +
            '1110' +
            '0000' +
            '0000';

  sT270 =   '1000' +
            '1100' +
            '1000' +
            '0000';

   sSQ   =  '1100' +
            '1100' +
            '0000' +
            '0000';

type TMino = array[0..3,0..3] of byte;

function CreatePrototype(CreateType : TTetraMinoType;Angle:TAngle):TMino;
function GetNewAngle(tp : TTetraminoType;angle : TAngle; Clockwise : boolean = true):TAngle;

implementation

{ TTetaminoTypes }

function GetNewAngle(tp : TTetraminoType; angle : TAngle; Clockwise : boolean = true):TAngle;
begin
      case tp of
        tLine,
        tZ,
        tRZ :  if angle in [a0,a180] then result := a90 else result := a0;


       tT,
       tL,
       TRL : if ClockWise then
                 begin
                    result := angle;
                    if (angle < a270) then inc(result) else result := a0;
                 end
                 else begin
                    result := angle;
                    if (angle > a0) then dec(result) else result := a270;
                 end;
        else     result := a0;
      end;
end;


function LoadResource(CreateType : TTetraMinoType;Angle:TAngle):string;
begin
     result := '';
     case CreateType of
            tLine : if Angle in [a0,a180] then result := sLine else result := sLine90;

            tZ    : if Angle in [a0,a180] then result := sZ else result := sZ90;

            tRZ   : if Angle in [a0,a180] then result := sRZ else result := sRZ90;

            tL    : case angle of
                      a0   : result := sL;
                      a90  : result := sL90;
                      a180 : result := sL180;
                      a270 : result := sL270;
                    end;

            TRL   : case angle of
                      a0   : result := sRL;
                      a90  : result := sRL90;
                      a180 : result := sRL180;
                      a270 : result := sRL270;
                    end;

            tT    : case angle of
                      a0   : result := sT;
                      a90  : result := sT90;
                      a180 : result := sT180;
                      a270 : result := st270;
                    end;

            tSQ   : result := sSQ;
     end;
end;

function CreatePrototype(CreateType : TTetraMinoType;Angle:TAngle):TMino;
var i,j,l : integer;
    s : string;
begin
    s := LoadResource(Createtype,Angle);
    l := 1;
    for i := 0 to 3 do
        for j := 0 to 3 do
        begin
              result[i,j] := ord(s[l]) - ord('0');
              inc(l)
        end;
end;

end.
