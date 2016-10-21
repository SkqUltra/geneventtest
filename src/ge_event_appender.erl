-module(ge_event_appender).

-behaviour(gen_event).

-export([add_handle/0, delete_handle/0]).

-export([init/1, handle_event/2, handle_call/2,
		handle_info/2, code_change/3, terminate/2]).

add_handle() ->
	ge_event:add_handler(?MODULE, []).

delete_handle() ->
	ge_event:delete_handler(?MODULE, []).

init([]) ->
	{ok, []}.

handle_event(_, State) ->
	io:format("event get~n"),
	{ok, State}.

handle_info(_, State) ->
	{ok, State}.

handle_call(_Request, State) ->
    Reply = ok,
    {ok, Reply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
