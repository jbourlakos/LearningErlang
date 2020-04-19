-module(iblogic).
-export([ifthenelse/3]).

ifthenelse(true, Value1, Value2) -> Value1;
ifthenelse(false, Value1, Value2) -> Value2.
