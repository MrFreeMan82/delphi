unit uData;

interface

uses
  SysUtils, Classes, Forms, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TTopicsInfo = record
      id: integer;
      pageCount: integer;
      name: string;
      dir: string;
      displayLabel: string;
  end;

  TTopicList = array of TTopicsInfo;

  Tdm = class(TDataModule)
    xmlDoc: TXMLDocument;
  private
    { Private declarations }

  public
    { Public declarations }
    function loadTopics(): TTopicList;
    function exePath(): string;
  end;

var
  dm: Tdm;

const TOPICS_DIR = 'Topics';

implementation

{$R *.dfm}

{ Tdm }

function Tdm.exePath: string;
begin
     result := ExtractFilePath(Application.ExeName);
end;

function Tdm.loadTopics(): TTopicList;
var xml: string;
    i, cnt: integer;
    root, node: IXMLNode;
begin
     xml := extractFilePath(Application.ExeName) + TOPICS_DIR + '\info.xml';
     xmlDoc.LoadFromFile(xml);
     root := xmlDoc.ChildNodes.FindNode('TOPICS');
     if root = nil then exit;

     cnt := root.ChildNodes.Count;
     setLength(result, cnt);

     for i := 0 to cnt - 1 do
     begin
          node := root.ChildNodes.Get(i);
          result[i].name := node.ChildNodes.FindNode('NAME').Text;
          result[i].dir  := node.ChildNodes.FindNode('DIR').Text;
          result[i].displayLabel := node.ChildNodes.FindNode('DISPLAY_LABEL').Text;
          result[i].id := strToInt(node.ChildNodes.FindNode('ID').Text);
          result[i].pageCount := strToInt(node.ChildNodes.FindNode('PAGE_CNT').Text);
     end;

end;

end.
