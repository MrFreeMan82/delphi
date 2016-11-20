unit uLogging;

interface
uses Classes,SysUtils, Variants;

type TLogger = class
  private
    log: Text;
  public
    constructor Create(Filename : string);
    destructor Destroy;override;
    procedure Logg(const logtext: array of Variant);
end;

var Logger: TLogger;

implementation

{ TLogger }

constructor TLogger.Create(Filename: string);
begin
    AssignFile(log, Filename);
    Rewrite(log);
end;

destructor TLogger.Destroy;
begin
  CloseFile(log);
  inherited;
end;

procedure TLogger.Logg(const logtext: array of Variant);
var i,len : integer;
    s : string;
begin
    s   := '';
    len := length(logtext);

    for i := 0 to len - 1 do s := s + VarToStr(logtext[i]);
    Write(log, FormatDateTime('hh:mm:ss', Time), ': ');
    Writeln(log, s);
end;

end.
