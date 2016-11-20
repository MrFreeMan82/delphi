unit uStack;

{$mode objfpc}{$H+}

interface

const STACK_INIT_LEN = 100;

type PStack = ^TStack;
     TStack = record
      body: array of pointer;
      top, idx: integer;
      empty: boolean;
end;

  procedure push(stack: PStack; value: pointer);
  procedure pop(stack: PStack; out value: pointer);
  function read(stack: PStack): pointer;
  procedure clear(stack: PStack);

implementation

procedure push(stack: PStack; value: pointer);
begin
    with stack^ do
    begin
         if idx = length(body) then setLength(body, length(body) + STACK_INIT_LEN);

         body[idx] := value;
         top := idx;
         empty := false;
         inc(idx)
    end;
end;

procedure pop(stack: PStack; out value: pointer);
begin
    with stack^ do
    begin
         value := @body[top];
         idx := top;
         if top > 0 then dec(top);
         empty := (top = 0) and (idx = 0);
    end;
end;

function read(stack: PStack): pointer;
begin
    if assigned(stack) then
        result := @stack^.body[stack^.top]
    else
        result := nil;
end;

procedure clear(stack: PStack);
begin
  stack^.body := nil;
  SetLength(stack^.body, STACK_INIT_LEN);
  stack^.top := 0;
  stack^.idx := 0;
  stack^.empty := true;
end;

end.

