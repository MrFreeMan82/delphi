unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,VersionInfo, XPMan;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    ProductName: TLabel;
    ProgramIcon: TImage;
    Copyright: TLabel;
    Comments: TLabel;
    Version: TLabel;
    XPManifest1: TXPManifest;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  AboutBox: TAboutBox;
  Ver:TVersionInfo=nil;

implementation

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
begin
    if Ver=nil then Ver:=TVersionInfo.Create;
    ProductName.Caption:=Ver.ProductName;
    Version.Caption:='Версия: '+Ver.FileVersion;
    Copyright.Caption:='Программирование: '+Ver.LegalCopyright;
    Comments.Caption:=Ver.Comments;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  FreeAndNil(Ver);
  Close;
end;

end.
 
