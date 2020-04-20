-module(hash).
-export([
  new/0,
  subset_of/2
]).

% Design based on Ruby's Hash class.
% See: https://ruby-doc.org/core-2.7.0/Hash.html

% Implementation based on `maps` module.
% See: https://erlang.org/doc/man/maps.html

new() -> maps:new().

is_hash(H) -> is_map(H).

% Ruby: each
iterator(Hash) -> maps:iterator(Hash).

% Ruby: keys
keys(Hash) -> maps:keys(Hash).

% Ruby: ==
equals(Hash, OtherHash) -> Hash == OtherHash.

% Ruby: !=
not_equal(Hash, OtherHash) -> Hash /= OtherHash.

% Ruby: <=
subset_of(Hash, OtherHash) -> Hash <= OtherHash.

% Ruby: <
proper_subset_of(Hash, OtherHash) -> Hash < OtherHash

% Ruby: >=
superset_of(Hash, OtherHash) -> Hash >= OtherHash.

% Ruby: >
proper_superset_of(Hash, OtherHash) -> Hash > OtherHash.

% Ruby: []
get(Hash, Key) -> maps:get(Key, Hash).

% Ruby: []=
put(Hash, Key, Value) -> maps:put(Key, Value, Hash).

% Ruby: merge
merge(Hash, OtherHash) -> maps:merge(Hash, OtherHash).