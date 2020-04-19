-module(logicx).
-export([ifte/3, ifte/1]).

ifte(true , Value1, Value2) -> Value1;
ifte(false, Value1, Value2) -> Value2.

ifte( []                          ) -> true;
ifte( [ {true   , Val}   | Rest ] ) -> Val;
ifte( [ {default, Val}   | Rest ] ) -> Val;
ifte( [ {false  , _  }   | Rest ] ) -> ifte(Rest).


