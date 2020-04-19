-module(main).
-export([start/0]).

% start() ->
%  io:fwrite("hello world\n").

start() ->
  A = 3,
  B = 5,
  Res = logicx:ifte([
    {A < B, [
      C = A + B,
      math:sqrt(C)
    ]},
    {A > B, (
      A - B
    )},
    {default, 0}
  ]),
  io:fwrite("~w~n", [Res]).
  
