unit uAccessRightRule;

interface
uses SysUtils, Classes, uData, Controls, Menus, ComCtrls;

  procedure SetWindowAccessState(userType:integer; window:TComponent);
implementation


function isOurUserType(ut_id: integer; enabledUsers: string):boolean;
var sl: TStringList;
    i:integer;
begin
     if enabledUsers = '*' then exit(true);

     i := 0;
     result := false;
     sl := TStringList.Create;
     sl.Delimiter := ';';
     sl.StrictDelimiter := true;
     sl.DelimitedText := trim(enabledUsers);

     while (result <> true) or (i < sl.Count) do
     begin
          result := strToInt(sl[i]) = ut_id;
          inc(i);
     end;

     freeAndNil(sl);
end;

function findObject(window: TComponent; objName: string): TComponent;
begin
    result := window.FindComponent(objName);
end;

// Устанавливаем состояние контрола. По смыслу: "+" - разрешить нажать/редактировать,
// "-" - read-only - можно смотреть, трогать низя, "/" - спрятать.
procedure setControlAccessState(control: TComponent; action: string);
begin
    if action = '/' then
    begin
          if control is TTabSheet then TTabSheet(control).TabVisible := false;
    end
    else if action = '-' then
    begin
         if control is TTabSheet then TTabSheet(control).Enabled := false;
    end
    else if action = '+' then
    begin
        if control is TTabSheet then
        begin
            TTabSheet(control).TabVisible := true;
            TTabSheet(control).Enabled := true;
        end;
    end;

end;

procedure ApplyRule(ut_id: integer;
										window: TComponent;
										enabledUsers, targetObject, checkObject, checkMode:string;
										checkObjectValue: double;
										action: String);

var sl:TStringList;
	  i:integer;
    checkObjectFound:TComponent;
    objectVal:double;
begin
      if not isOurUserType(ut_id, enabledUsers) then exit;

      sl := TStringList.Create;
      sl.Delimiter := ';';
      sl.StrictDelimiter := true;
      sl.DelimitedText := trim(targetObject);

      for i := 0 to sl.Count - 1 do
      begin
          checkObjectFound := findObject(window, sl[i]);
          if checkObjectFound = nil then continue;

          if (checkObjectFound is TControl) or
              (checkObjectFound is TMenuItem) then
                        setControlAccessState(checkObjectFound, action);

      end;
      freeAndNil(sl);
end;

       // Находит все правила, связанные с этим окном, и устанавливает их
procedure SetWindowAccessState(userType:integer; window:TComponent);

begin
     data.qAccessRight.Close;
     data.qAccessRight.ParamByName('wnd').AsString := window.Name;
     data.qAccessRight.Open;

     if data.qAccessRight.IsEmpty then exit;

     while not data.qAccessRight.Eof do
     begin
        ApplyRule(userType,
                  window,
                  data.qAccessRightARR_USER_TYPES.AsString,
                  data.qAccessRightARR_TARGET_OBJECT_NAME.AsString,
                  data.qAccessRightARR_CHECK_OBJECT_NAME.AsString,
                  data.qAccessRightARR_CHECK_MODE.AsString,
                  data.qAccessRightARR_CHECK_OBJECT_VALUE.AsFloat,
                  data.qAccessRightARR_ACTION.AsString);

        data.qAccessRight.Next
     end;

end;

end.
