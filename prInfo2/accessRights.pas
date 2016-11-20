unit accessRights;

interface

uses
    Classes, Controls, Menus, Dialogs, ComCtrls, dm, StdCtrls,
    DBCtrlsEh, DBLookupEh, DBCtrls, RegExpr, SysUtils, DB, Forms, globals;

type
	// Класс-подборка функций для установки прав доступа в окнах
	// (запрет/разрешение/скрытие контролов) по информации из БД.
	TAccessRightsManager=class
	private
        class procedure trimList(var list:TStringList);
		class function FindObjectByPath(top:TComponent;path:String;alertIfNotFound:boolean):TComponent;
		class procedure SetControlAccessState(control:TComponent;action:String);
		class procedure ApplyRule(currentUser:TUser;window:TComponent;rightUsers,targetObject,checkObject,checkMode:string;checkObjectValue:real;action:String);
		class function IsTrue(ObjectValue:real;CheckMode:String;CheckValue:real):boolean;
	public
		class procedure SetWindowAccessState(userType:TUser;window:TComponent);
		class procedure DisableWindow(window:TControl);
		class procedure EnableWindow(window:TControl);
	end;

implementation


// Удаляет пустые элементы списка, удаляет лишние пробелы
// в элементах списка
class procedure TAccessRightsManager.trimList(var list:TStringList);
var
	i:integer;
begin
	for i:=0 to list.Count-1 do
	begin
		list[i]:=trim(list[i]);

		if (list[i]='') then
			list.Delete(i);
	end;
end;

// Устанавливаем состояние контрола. По смыслу: "+" - разрешить нажать/редактировать,
// "-" - read-only - можно смотреть, трогать низя, "/" - спрятать.
class procedure TAccessRightsManager.SetControlAccessState(control:TComponent;action:String);
begin
	if (not ((control is TControl)or(control is TMenuItem))) then
	begin
		MessageDlg('Недопустимый тип объекта при использовании прав доступа!',mterror,[mbOk],0);

		exit;
	end;

	if (action='/') then
	begin
		if (control is TMenuItem) then
			TMenuItem(control).Visible:=false
		else if (control is TTabSheet) then
			TTabSheet(control).TabVisible:=false
		else
		begin
			TControl(control).Visible:=false;
			TControl(control).Enabled:=false;
		end;
	end
	else if (action='+') then
	begin
		if (control is TMenuItem) then
		begin
			TMenuItem(control).Visible:=true;
			TMenuItem(control).Enabled:=true;
		end
		else
		begin
			TControl(control).Visible:=true;
			TControl(control).Enabled:=true;

			if (control is TTabSheet) then
				TTabSheet(control).TabVisible:=true

			else if (control is TEDit) then
				TEdit(control).ReadOnly:=false

			else if (control is TMemo) then
				TMemo(control).ReadOnly:=false

			else if (control is TCustomDBEditEh) then
				TCustomDBEditEh(control).ReadOnly:=false

			else if (control is TDBLookupComboBox) then
				TDBLookupComboBox(control).ReadOnly:=false

      else if (control is TDBRichEdit) then
        TDBRichEdit(control).ReadOnly := false;
		end
	end
	else if (action='-') then
	begin
		if (control is TMenuItem) then
		begin
			TMenuItem(control).Visible:=true;
			TMenuItem(control).Enabled:=false;
		end
		else
    if control is TDBRichEdit then
    begin
        TDBRichEdit(control).Visible := true;
        TDBRichEdit(control).Enabled := true;
        TDBRichEdit(control).ReadOnly := true;
    end
    else
		begin
			TControl(control).Visible:=true;
			TControl(control).Enabled:=true;

			if (control is TTabSheet) then
				TTabSheet(control).TabVisible:=true

			else if (control is TEDit) then
				TEdit(control).ReadOnly:=true

			else if (control is TMemo) then
				TMemo(control).ReadOnly:=true

			else if (control is TCustomDBEditEh) then
				TCustomDBEditEh(control).ReadOnly:=true

			else if (control is TDBLookupComboBox) then
				TDBLookupComboBox(control).ReadOnly:=true

      else if (control is TDBMemo) then
        TDBMemo(control).ReadOnly:=true

      else if (control is TDBRichEdit) then
        TDBRichEdit(control).ReadOnly := true

			else
				TControl(control).Enabled:=false;
		end;
	end;
end;


// Применить правило из БД к объекту.
// Параметры: currentUser - текущий юзер,
// window - окно, где контрол должен лежать
// rightUser - пользователь, который в правиле упомянут ("*" или номера типов через ";")
// targetObject - объекты, к которым правило применять. "*" или имена (или пути к ним) через ";"
// checkObject checkMode checkObjectValue - проверяется условие, что checkObject должен находиться
// с checkObjectValue в отношении checkMode (<,>,<=,>=,=,<>), чтобы правило имело действие
// action - чего сделать с targetObject, если и пользователь - подходит, и условие выполняется.
class procedure TAccessRightsManager.ApplyRule(currentUser:TUser;
										 window:TComponent;
										 rightUsers,targetObject,checkObject,checkMode:string;
										 checkObjectValue:real;
										 action:String);

	// Проверяет, подходит ли текущий пользователь нашему правилу
	function checkUserInRight:boolean;
	var
		re:TRegExpr;
		sl:TStringList;
		i:integer;
	begin
		Result:=false;

		re:=nil;

		if (rightUsers='*') then
		begin
			Result:=true;

			exit;
		end;

		try
			re:=TRegExpr.Create;
			sl:=TStringList.Create;
			re.Expression:='\;';
			re.Split(rightUsers,sl);
			trimList(sl);

			for i:=0 to sl.Count-1 do
			begin
				if ((Result<>true)and(int2user(StrToInt(sl[i]))=currentUser)) then
					Result:=true;
			end;
		finally
			if (Assigned(re)) then
				re.Free;
			if (Assigned(sl)) then
				sl.Free;
		end;
	end;

var
	re:TRegExpr;
	sl:TStringList;
	i:integer;
    checkObjectFound:TComponent;
    objectVal:real;
begin
	re:=nil;

	// проверим, чтобы у правила был такой пользователь, как надо
	if (not checkUserInRight) then
		exit;

	if (checkObject<>'') then
	begin
		// Дополнительное условие - не выполняется?
        checkObjectFound:=FindObjectByPath(window,checkObject,false);
        if (checkObjectFound=nil) then
            checkObjectFound:=FindObjectByPath(nil,checkObject,false);
        if ((checkObjectFound=nil)or(not(checkObjectFound is TComponent))) then
		begin
			MessageDlg('Объект не найден: '+checkObject,mtError,[mbOk],0);

			exit;
		end;

		if (checkObjectFound is TField) then
			objectVal:=TField(checkObjectFound).AsFloat
		else
			objectVal:=checkObjectFound.Tag;

		if (not IsTrue(objectVal,checkMode,checkObjectValue)) then
			exit;
	end;

	if (targetObject<>'*') then
	begin
		try
			re:=TRegExpr.Create;
			sl:=TStringList.Create;
			re.Expression:='\;';
			re.Split(targetObject,sl);
			trimList(sl);

			// Найти и обезвредить! Ставим всем таргетам соотв. уровень доступа
			for i:=0 to sl.Count-1 do
				if ((FindObjectByPath(window,sl[i],true) is TControl)or
					(FindObjectByPath(window,sl[i],true) is TMenuItem)) then
					SetControlAccessState(TControl(FindObjectByPath(window,sl[i],true)),action);
		finally
			if (Assigned(re)) then
				re.Free;
			if (Assigned(sl)) then
				sl.Free;
		end;
	end
	else
	begin
		// Найти и обезвредить! Ставим всем контролам в окне соотв. уровень доступа
		if (window is TWinControl) then
			for i:=0 to TWinControl(window).ControlCount-1 do
				SetControlAccessState(TWinControl(window).Controls[i],action);
	end;
end;


// Проверяет, правдиво ли утверждение, что ObjectValue находится с CheckValue
// в отношении CheckMode
class function TAccessRightsManager.IsTrue(ObjectValue:real;CheckMode:String;CheckValue:real):boolean;
begin
	// почему-то после знака сравнения на выходе из БД появляется пробел...
	CheckMode:=trim(CheckMode);

	Result:=false;

	if (CheckMode='=') then
	begin
		if (ObjectValue=CheckValue) then
		begin
			Result:=true;

			exit;
		end;
	end

	else if (CheckMode='<') then
	begin
		if (ObjectValue<CheckValue) then
		begin
			Result:=true;

			exit;
		end;
	end

	else if (CheckMode='>') then
	begin
		if (ObjectValue>CheckValue) then
		begin
			Result:=true;

			exit;
		end;
	end

	else if (CheckMode='<=') then
	begin
		if (ObjectValue<=CheckValue) then
		begin
			Result:=true;

			exit;
		end;
	end

	else if (CheckMode='>=') then
	begin
		if (ObjectValue>=CheckValue) then
		begin
			Result:=true;

			exit;
		end;
	end

	else if (CheckMode='<>') then
	begin
		if (ObjectValue<>CheckValue) then
		begin
			Result:=true;

			exit;
		end;
	end;
end;


// Ищет объект через Components и Controls по указанному пути,
// начиная я объекта top. Если top не указан, то начинает с Application.
class function TAccessRightsManager.FindObjectByPath(top:TComponent;path:String;alertIfNotFound:boolean):TComponent;

	// Найди мне контрол по имени childName хоть где-нибудь - хоть в
	// .Controls, хоть в .Components!
	function FindAnything(parent:TComponent;childName:String):TComponent;
	var
		tmp:TComponent;
	begin
		tmp:=nil;
		Result:=nil;

		if (parent is TWinControl) then
			tmp:=TWinControl(parent).FindChildControl(childName);

		if (tmp=nil) then
			tmp:=parent.FindComponent(childName);

		if (tmp<>nil) then
			Result:=tmp;
	end;
var
	re:TRegExpr;
	sl:TStringList;
	i,cnt:integer;
	maxFound:TComponent;
begin
	re:=nil;

	if (top=nil) then
		top:=Application;

	Result:=nil;
	maxFound:=top;

	try
		re:=TRegExpr.Create;
		re.Expression:='\.';
		sl:=TStringList.Create;
		re.Split(path,sl);
		trimList(sl);

		cnt:=0;
		for i:=0 to sl.Count-1 do
			if (maxFound<>nil) then
			begin
				inc(cnt);

				maxFound:=FindAnything(maxFound,sl[i]);
			end;

		if (((maxFound=nil)or(cnt<>sl.Count))and(alertIfNotFound)) then
			
//+			MessageDlg('Объект не найден: '+top.Name+'::'+path+' - '+sl[cnt-1],mtError,[mbOk],0)
			
		else
			Result:=maxFound;

	finally
		if (Assigned(re)) then
			re.Free;
		if (Assigned(sl)) then
			sl.Free;
	end;
end;


// Находит все правила, связанные с этим окном, и устанавливает их
class procedure TAccessRightsManager.SetWindowAccessState(userType:TUser;window:TComponent);
begin
	data.qryAccessRights.Filter:='ARR_WINDOW_NAME='''+window.Name+''' OR ARR_WINDOW_NAME='''+window.ClassName+'''';
	data.qryAccessRights.Filtered:=true;

	if (not data.qryAccessRights.IsEmpty) then
	begin
		data.qryAccessRights.First;
		while (not data.qryAccessRights.Eof) do
		begin
			ApplyRule(userType,
					  window,
					  data.qryAccessRightsARR_USER_TYPES.AsString,
					  data.qryAccessRightsARR_TARGET_OBJECT_NAME.AsString,
					  data.qryAccessRightsARR_CHECK_OBJECT_NAME.AsString,
					  data.qryAccessRightsARR_CHECK_MODE.AsString,
					  data.qryAccessRightsARR_CHECK_OBJECT_VALUE.Value,
					  data.qryAccessRightsARR_ACTION.AsString);

			data.qryAccessRights.Next;
		end;
	end;
end;


// Дисейблит всё, что есть в окне
class procedure TAccessRightsManager.DisableWindow(window: TControl);
begin
	ApplyRule(uAgent,window,'*','*','','',0,'-');
end;


// Энейблит всё, что есть в окне
class procedure TAccessRightsManager.EnableWindow(window: TControl);
begin
	ApplyRule(uAgent,window,'*','*','','',0,'+');
end;


end.
