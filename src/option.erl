-module(option).
-export([map/2,
         flat_map/2,
         defined/1]).

map(F, {ok, Value}) ->
    {ok, F(Value)};
map(F, None) ->
    None.

flat_map(F, O) ->
    case O of
        {ok, Value} ->
            F(Value);
        None -> None
    end.

defined({ok, _}) ->
    true;
defined(_) ->
    false.
