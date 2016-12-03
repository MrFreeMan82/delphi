unit VersionInfo;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypInfo;


type TVersionInfo = class
     private
        type  TVersionType =
                (vtCompanyName, vtFileDescription, vtFileVersion,vtInternalName,
                 vtLegalCopyright, vtLegalTradeMark, vtOriginalFileName,
                 vtProductName, vtProductVersion, vtComments);
        const Max_Types=9;
        var Ver_Info: array[0..Max_Types] of string;
     public
        constructor Create;
        property CompanyName:string read Ver_info[0];
        property FileDescription:string read Ver_info[1];
        property FileVersion:string read Ver_info[2];
        property InternalName:string read Ver_info[3];
        property LegalCopyright:string read Ver_info[4];
        property LegalTradeMark:string read Ver_info[5];
        property OriginalFileName:string read Ver_info[6];
        property ProductName:string read Ver_info [7];
        property ProductVersion:string read Ver_info[8];
        property Comments:string read Ver_info[9];
end;

implementation

constructor TVersionInfo.Create;
var
  AppName,Option_Str,VersionType,LangCharSet,FLanguageInfo:string;
  buffsize: cardinal;
  i,temp:integer;
  pcValue:PChar;
  pcBuf,Trans: PAnsiChar;
begin
  AppName := Application.ExeName;
  buffsize := GetFileVersionInfoSize(PChar(AppName), buffsize);
  if buffsize > 0 then
  begin
    pcBuf:=AllocMem(buffsize);
    GetFileVersionInfo(PChar(AppName), 0, buffsize, pcBuf);
     VerQueryValue(pcBuf,'\VarFileInfo\Translation',Pointer(Trans),buffsize);
    if buffsize = 4 then
    begin
      temp:=0;
      StrLCopy(@temp, Trans, 2);
      LangCharSet:=IntToHex(temp, 4);
      StrLCopy(@temp,Trans+2, 2);
      FLanguageInfo := LangCharSet+IntToHex(temp, 4);
      for i := 0 to Max_Types do
      begin
        VersionType := GetEnumName(TypeInfo(TVersionType), i);
        delete(VersionType,1,2);
        Option_Str:='\StringFileInfo\'+FLanguageInfo+'\'+VersionType;
        VerQueryValue(pcBuf, PChar(Option_Str), Pointer(pcValue), buffsize);
        if buffsize>0 then Ver_Info[i] := pcValue else Ver_Info[i]:='n/a'
      end;
    end;
    FreeMem(pcBuf, buffsize);
    Trans:=nil;
    pcValue:=nil
  end;
end;

end.
