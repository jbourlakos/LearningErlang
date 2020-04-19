-module(geometry).
-export([
  point/1,
  point/2,
  point/3,
  pointN/1,
  line/2,
  distance/1
]).

% point/1
point(X) -> {pointN, [X]}.

% point/2
point(X,Y) -> {pointN, [X, Y]}.

% point/3
point(X,Y,Z) -> {pointN, [X, Y, Z]}.

% pointN/1
pointN([X|Xs]) -> {pointN, [X|Xs]}.

line({pointN, [X1|X1s]}, {pointN, [X2|X2s]}) ->
  {lineN, {pointN, [X1|X1s]}, {pointN, [X2|X2s]}}.

distance({lineN, {pointN, Xs1}, {pointN, Xs2}}) ->
  % TODO
  %sqrt((X11 - X21)^2 + (X12 - X22)^2 + (X13 - X23)^2 + ...)
  math:sqrt(mathx:square_diff_sum(Xs1, Xs2)).
  

% distance
% area
% perimeter