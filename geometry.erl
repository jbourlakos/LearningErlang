-module(geometry).
-export([
  point/1,
  point/2,
  point/3,
  point_n/1,
  line/2,
  distance/1,
  distance/2,
]).

% point/1
point(X) -> {point_n, [X]}.

% point/2
point(X,Y) -> {point_n, [X, Y]}.

% point/3
point(X,Y,Z) -> {point_n, [X, Y, Z]}.

% point_n/1
point_n([X|Xs]) -> {point_n, [X|Xs]}.

line({point_n, [X1|X1s]}, {point_n, [X2|X2s]}) ->
  {line_n, {point_n, [X1|X1s]}, {point_n, [X2|X2s]}}.

distance({line_n, {point_n, Xs1}, {point_n, Xs2}}) ->
  % TODO
  %sqrt((X11 - X21)^2 + (X12 - X22)^2 + (X13 - X23)^2 + ...)
  math:sqrt(
    listsx:reduce(
      fun (A, B) -> A + B end,
      0,
      listsx:map(
        fun ({Fst,Snd}) -> (Fst - Snd) * (Fst - Snd) end,
        listsx:zip(Xs1, Xs2)
      )
    )
  ).


distance(Point1, Point2) -> distance(line(Point1, Point2)).

distanceN(Order


% area
% perimeter