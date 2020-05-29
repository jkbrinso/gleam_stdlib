-module (binary_native).
-export ([int_to_u32/1, int_from_u32/1, append/2, part/3]).

append(First, Second) ->
  <<First/binary, Second/binary>>.

part(Bin, Pos, Len) ->
  try {ok, binary:part(Bin, Pos, Len)} catch
    error:badarg -> {error, nil}
  end.

int_to_u32(I) when 0 =< I, I < 4294967296 ->
  {ok, <<I:32>>};
int_to_u32(_) ->
  {error, nil}.

int_from_u32(<<I:32>>) ->
  {ok, I};
int_from_u32(_) ->
  {error, nil}.