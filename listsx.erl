-module(listsx).
-export([
  map/2,
  sum/1,
  zip/2
]).


% map/2
map(F, []) -> [];
map(F, [H|T]) -> [F(H) | map(F,T)].

% sum/1
% Summarize all elements
sum([]) -> 0;
sum([H|T]) -> H + sum(T).

% zip/2
% combine pairwise elements from two lists, into one list
zip([], []) -> [];
zip([], [H2|T2]) -> [{nothing , H2} | zip([], T2)];
zip([H1|T1], []) -> [{H1, nothing} | zip(T1, [])];
zip([H1|T1] , [H2|T2] ) -> [{H1, H2} | zip(T1, T2)].
