unit uGlobal;

interface
uses SysUtils, Classes, StdCtrls, uData;

procedure LoadComboBox(cbo:TComboBox; data:TSQLiteUniTable);

implementation

procedure LoadComboBox(cbo:TComboBox; data:TSQLiteUniTable);
begin
      cbo.Clear;

      while not data.EOF do
      begin
            cbo.Items.AddObject(data.FieldAsString(1), TObject(data.FieldAsInteger(0)));

            data.Next;
      end;
end;

end.
