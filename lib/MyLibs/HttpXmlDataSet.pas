unit HttpXmlDataSet;

interface

uses
	SysUtils, DBClient, xmlxform, IdHttp, Classes;

type
	EHttpXMLError=class(Exception)
	end;
	THttpXMLDataSet=class(TClientDataSet)
		private
			transform:TXMLTransform;
			http:TIdHTTP;
			fURL:String;
			fOpened:boolean;
			fTransformationFile:String;
			FProxyPort: integer;
			FProxyServer: String;
			FProxyUsername: String;
		    FProxyPassword: String;
			function getOpened(): boolean;
			procedure setOpened(opened: boolean);
			function getURL(): String;
			procedure setURL(url: String);
			function getTransformationFile(): String;
			procedure setTransformationFile(transformationFile: String);
			procedure SetProxyPort(const Value: integer);
			procedure SetProxyServer(const Value: String);
			procedure SetProxyPassword(const Value: String);
			procedure SetProxyUsername(const Value: String);
		public
			constructor	Create(AOwner: TComponent); override;
			procedure Open();
		published
			property Opened: boolean read getOpened write setOpened;
			property URL: String read getURL write setURL;
			property transformationFile: String read getTransformationFile write setTransformationFile;
			property ProxyServer:	String read FProxyServer write SetProxyServer;
			property ProxyPort:		integer read FProxyPort write SetProxyPort;
			property ProxyUsername:	String read FProxyUsername write SetProxyUsername;
			property ProxyPassword: String read FProxyPassword write SetProxyPassword;
	end;

procedure Register;

implementation

constructor THttpXMLDataSet.Create(AOwner:TComponent);
begin
	inherited;

	transform:=TXMLTransform.Create(self);
	http:=TIdHTTP.Create(Self);
	http.ProxyParams.ProxyServer := ProxyServer;
	http.ProxyParams.ProxyPort := ProxyPort;
	http.ProxyParams.ProxyUsername := ProxyUsername;
	http.ProxyParams.ProxyPassword := ProxyPassword;
end;

procedure THttpXMLDataSet.Open;
var
    data:String;
begin
	fOpened:=true;
	data:=http.Get(URL);
    if (data='') then
		raise EHttpXMLError.Create('Ошибка получения информации с сервера.'#10#13'Проверьте соединение с интернетом.');

	try
		XMLData:=transform.TransformXML(data,transformationFile);
		inherited Open;
	except on E:Exception do
		begin
			raise EHttpXMLError.Create('Ошибка обработки информации с сервера:'#10#13+E.Message);
			exit;
		end;
	end;
end;

function THttpXMLDataSet.getOpened:boolean;
begin
	Result:=fOpened;
end;

procedure THttpXMLDataSet.setOpened(opened:boolean);
begin
	if (fOpened<>opened) then
	begin
		if (opened=true) then
			Open
		else
		begin
			Close;
			fOpened:=false;
		end;
	end
end;

function THttpXMLDataSet.getURL:String;
begin
	Result:=fURL;
end;

procedure THttpXMLDataSet.setURL(url:String);
begin
	fURL:=url;
end;

function THttpXMLDataSet.getTransformationFile:String;
begin
	Result:=fTransformationFile;
end;

procedure THttpXMLDataSet.setTransformationFile(transformationFile:String);
begin
	self.fTransformationFile:=transformationFile;
end;

procedure Register;
begin
  RegisterComponents('Samples', [THttpXMLDataSet]);
end;

procedure THttpXMLDataSet.SetProxyPort(const Value: integer);
begin
	FProxyPort := Value;
	if (http <> nil) then
		http.ProxyParams.ProxyPort := Value;
end;

procedure THttpXMLDataSet.SetProxyServer(const Value: String);
begin
	FProxyServer := Value;
	if (http <> nil) then
		http.ProxyParams.ProxyServer := Value;
end;

procedure THttpXMLDataSet.SetProxyPassword(const Value: String);
begin
	FProxyPassword := Value;
	if (http <> nil) then
		http.ProxyParams.ProxyPassword := Value;
end;

procedure THttpXMLDataSet.SetProxyUsername(const Value: String);
begin
	FProxyUsername := Value;
	if (http <> nil) then
		http.ProxyParams.ProxyUsername := Value;
end;

end.
