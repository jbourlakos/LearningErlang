-module(mathx).
-export([
  abs/1,
  pi/0,
  root/1,
  root/2
]).


pi() -> 3.14159.

abs(X) -> logicx:ifte(X >= 0, X, -X).

root(X) -> root(X, 2).

root(X, Y) -> math:exp((1/Y)*math:log(X)).