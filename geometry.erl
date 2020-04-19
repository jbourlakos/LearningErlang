-module(geometry).
-export([
  point/1,
  point/2,
  point/3,
  point_n/1,
  line/2,
  distance/2,
  distance_n/3
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

distance_n({point_n, Xs1}, {point_n, Xs2}, Order) ->
  mathx:root(
    listsx:sum(
      listsx:map(
        fun ({Fst,Snd}) -> math:pow((Fst - Snd), Order) end,
        listsx:zip(Xs1, Xs2)
      )
    ),
    Order
  ).

distance(P1, P2) -> distance_n(P1, P2, 2). 



% area
% perimeter