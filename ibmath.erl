-module(ibmath).
-export([pi/0, abs/1]).

pi() -> 3.14159.

abs(X) -> iblogic:ifthenelse(X >= 0, X, -X).
