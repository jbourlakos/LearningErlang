-module(geometry).
-export([
  point/2, 
  point/3,
  line2d/2, 
  line/4,
  distance/1,
  distance/2
]).


point(X,Y) -> {point2d, X, Y}.

point(X,Y,Z) -> {point3d, X, Y, Z}.

line2d({point2d, X1, Y1}, {point2d, X2, Y2}) ->
  {line2d, point(X1, Y1), point(X2, Y2)}.

line2d(X1, Y1, X2, Y2) -> line2d(point(X1, Y1), point(X2, Y2)).

distance({line2d, {point2d, X1, Y1}, {point2d, X2, Y2}}) ->
  DX = ibmath:abs(X2 - X1),
  DY = ibmath:abs(Y2 - Y1),
  math:sqrt(DX*DX + DY*DY).

distance(P1, P2) -> distance(line2d(P1, P2)).

perimeter({rectangle, Width, Height}) -> 2 * (Width + Height);
perimeter({square, Side}) -> 4 * Side;
perimeter({circle, Radius}) -> 2 * ibmath:pi() * Radius;
perimeter({triangle, A, B, C}) -> A + B + C.

tau(S) -> perimeter(S) / 2.

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> ibmath:pi() * Radius * Radius;
area({triangle, A, B, C}) -> 
  T = tau({triangle, A, B, C}),
  RSq = T * (T - A) * (T - B) * (T - C),
  math:sqrt(RSq).
  