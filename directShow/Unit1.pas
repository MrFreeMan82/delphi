unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, idMultipartFormData,
  IdExplicitTLSClientServerBase, IdFTP;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    btPlayVideo: TButton;
    btPlay: TButton;
    IdHTTP: TIdHTTP;
    IdFTP1: TIdFTP;
    procedure btPlayVideoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    MyGraphBuilder: IGraphBuilder;
    MyMediaControl: IMediaControl;
    VideoWindow: IVideoWindow;
    Seek:IMediaSeeking;

    procedure downloadFile(const URL: string);
    function getPin(pFilter: IBaseFilter; pinDir: PIN_DIRECTION; name: string): IPin;
    function login(const URL, username, pawwsord: string): boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses ActiveX;

const fn = 'test.mp4';

{$R *.dfm}

procedure TForm1.downloadFile(const URL: string);
var outFile: TFileStream;
begin
     outFile := TfileStream.Create(fn, fmCreate);
     try
        idHTTP.Get(URL, outFile);
     finally
         outFile.Free;
     end;
end;

function TForm1.getPin(pFilter: IBaseFilter; pinDir: PIN_DIRECTION; name: string): IPin;
var
    bFound: Boolean;
    pEnum : IEnumPins;
    pPin : IPin;
    PinDirThis: PIN_DIRECTION;
    pinInfo: PIN_INFO;
begin
    Result := nil;
    bFound := false;
    pFilter.EnumPins(pEnum);
    pEnum.Reset;
    while (pEnum.Next(1, pPin, nil) = S_OK) do
    begin
        pPin.QueryPinInfo(pinInfo);
        pPin.QueryDirection(PinDirThis);
        if (pinDir = PinDirThis) then
        begin
            if (name = '') or (trim(pinInfo.achName) = name) then
            begin
                bFound := true;
                break;
            end;
        end;
    end;
    pEnum.Reset;
    if bFound then Result := pPin;

end;

function TForm1.login(const URL, username, pawwsord: string): boolean;
var loginForm:TIdMultiPartFormDataStream;
    res: string;
begin
     loginForm := TIdMultiPartFormDataStream.Create;
     loginForm.AddFormField('username', username);
     loginForm.AddFormField('password', password);
     res := idHTTP.Post(URL,)

end;

procedure TForm1.btPlayVideoClick(Sender: TObject);
var
    LAVSplitter, LAVDecoder, VMR: IbaseFilter;
    LAVAudioDecoder, DSound: IBaseFilter;

    CLSID_SPLITTER, CLSID_DECODER, CLSID_VMR: TGUID;
    CLSID_ADECODER, CLSID_DSOUND: TGUID;
    CLSID_SEEK: TGUID;

    pVSplitterOut, pVDecoderIn, pVDecoderOut, pVVMRIn: IPin;
    pASplitterOut, pADecoderIn, pADecoderOut, pDSoundIn: IPin;
    hr: HRESULT;
begin
     downloadFile('http://localhost/repo/1.mp4');

     CLSID_SPLITTER := stringToGUID('{B98D13E7-55DB-4385-A33D-09FD1BA26338}');
     CLSID_DECODER := stringToGUID('{EE30215D-164F-4A92-A4EB-9D4C13390F9F}');
     CLSID_VMR := stringToGUID('{70E102B0-5556-11CE-97C0-00AA0055595A}');
     CLSID_ADECODER := stringToGUID('{E8E73B6B-4CB3-44A4-BE99-4F7BCB96E491}');
     CLSID_DSOUND := stringToGUID('{79376820-07D0-11CF-A24D-0020AFD79767}');
     CLSID_SEEK := stringToGUID('{36B73880-C2C8-11CF-8B46-00805F6CEF60}');

     CoInitialize(nil);
     CoCreateInstance(CLSID_FilterGraph, nil, CLSCTX_INPROC_SERVER, IID_IGraphBuilder, MyGraphBuilder);
     MyGraphBuilder.QueryInterface(IID_IMediaControl, MyMediaControl);
     MyGraphBuilder.QueryInterface(IID_IVideoWindow, VideoWindow);
     MyGraphBuilder.QueryInterface(CLSID_SEEK, Seek);

     CoCreateInstance(CLSID_SPLITTER, nil, CLSCTX_INPROC, IID_IBaseFilter, LAVSplitter);
     MyGraphBuilder.AddSourceFilter(fn, '', LAVSplitter);

     CoCreateInstance(CLSID_DECODER, nil, CLSCTX_INPROC, IID_IBaseFilter, LAVDecoder);
     MyGraphBuilder.AddFilter(LAVDecoder, 'LAV Decoder');

     CoCreateInstance(CLSID_VMR, nil, CLSCTX_INPROC, IID_IBaseFilter, VMR);
     MyGraphBuilder.AddFilter(VMR, 'Video Render');

     CoCreateInstance(CLSID_ADECODER, nil, CLSCTX_INPROC, IID_IBaseFilter, LAVAudioDecoder);
     MyGraphBuilder.AddFilter(LAVAudioDecoder, 'LAV Audio Decoder');

     CoCreateInstance(CLSID_DSOUND, nil, CLSCTX_INPROC, IID_IBaseFilter, DSound);
     MyGraphBuilder.AddFilter(DSound, 'Direct Sound');

     pVSplitterOut := getPin(LAVSplitter, PINDIR_OUTPUT, 'Video');
     pVDecoderIn := getPin(LAVDecoder, PINDIR_INPUT, 'Input');
     MyGraphBuilder.Connect(pVSplitterOut, pVDecoderIn);

     pASplitterOut := getPin(LAVSplitter, PINDIR_OUTPUT, 'Audio');
     pADecoderIn := getPin(LAVAudioDecoder, PINDIR_INPUT, 'Input');
     MyGraphBuilder.Connect(pASplitterOut, pADecoderIn);

     pADecoderOut := getPin(LAVAudioDecoder, PINDIR_OUTPUT, 'Output');
     pDSoundIn := getPin(DSound, PINDIR_INPUT, '');
     MyGraphBuilder.Connect(pADecoderOut, pDSoundIn);

     pVDecoderOut := getPin(LAVDecoder, PINDIR_OUTPUT, 'Output');
     pVVMRIn := getPin(VMR, PINDIR_INPUT, 'Input');
     hr := MyGraphBuilder.Connect(pVDecoderOut, pVVMRIn);
     if hr <> S_OK then abort;

     VideoWindow.put_Owner(Self.Panel1.Handle);
     VideoWindow.put_WindowStyle(WS_CHILD or WS_CLIPSIBLINGS);
     VideoWindow.SetWindowPosition(0, 0, Panel1.ClientRect.Right, Panel1.ClientRect.Bottom);

     MyMediaControl.Run;
     CoUninitialize;
end;

procedure TForm1.Button1Click(Sender: TObject);
var stop, current: int64;
const sec = 10000000;
begin
     MyMediaControl.Pause;
     current := 10 * sec;
     stop := 0;
     seek.SetPositions(current, AM_SEEKING_AbsolutePositioning, stop, AM_SEEKING_NoPositioning);
     MyMediaControl.Run;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
    if assigned(VideoWindow) then
        VideoWindow.SetWindowPosition(0, 0, Panel1.ClientRect.Right, Panel1.ClientRect.Bottom);
end;

end.
