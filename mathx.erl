-module(mathx).
-export([
  abs/1,
  pi/0,
  square_diff/2,
  square_diff_sum/2
]).


pi() -> 3.14159.

abs(X) -> logicx:ifte(X >= 0, X, -X).


% TODO: remove square_diff* functions
square_diff([],[]) -> [ 0 ];
square_diff([H1|T1],[H2|T2]) ->
  [(H1 - H2) * (H1 - H2) | square_diff(T1, T2)].

square_diff_sum(L1, L2) -> listsx:sum(square_diff(L1, L2)).
