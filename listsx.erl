-module(listsx).
-export([
  map/2,
  multiply/1,
  reduce/3,
  reduce_l/3,
  reduce_r/3,
  sum/1,
  zip/2
]).


% map/2
map(F, []) -> [];
map(F, [H|T]) -> [F(H) | map(F,T)].

% reduce/3
reduce(Op, Acc, List) -> reduce_l(Op, Acc, List).

% reduce_l/3
reduce_l(Op, Acc, []) -> Acc;
reduce_l(Op, Acc, [H|T]) -> reduce_l(Op, Op(Acc, H), T).

% reduce_r/3
reduce_r(Op, Acc, []) -> Acc;
reduce_r(Op, Acc, [H|T]) -> reduce_r(Op, Op(H, Acc), T).

% sum/1
% Summarize all elements
sum(List) -> reduce_l(fun (A, B) -> A + B end, 0, List).

% mult/1
% Multiply all elements
multiply(List) -> reduce_l(fun (A, B) -> A * B end, 1, List).

% zip/2
% combine pairwise elements from two lists, into one list
zip([], []) -> [];
zip([], [H2|T2]) -> [{undefined , H2} | zip([], T2)];
zip([H1|T1], []) -> [{H1, undefined} | zip(T1, [])];
zip([H1|T1] , [H2|T2] ) -> [{H1, H2} | zip(T1, T2)].
