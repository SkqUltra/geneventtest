-module(ge_event_appender).

-behaviour(gen_event).

-export([add_handler/0, delete_handler/0, add_error_logger/0]).

-export([init/1, handle_event/2, handle_call/2,
		handle_info/2, code_change/3, terminate/2]).

add_handler() ->
	ge_event:add_handler(?MODULE, []).

delete_handler() ->
	ge_event:delete_handler(?MODULE, []).

add_error_logger() ->
	error_logger:add_report_handler(?MODULE).

init([]) ->
	io:format("Add a Handler~n"),
	{ok, []}.

handle_event(woshilurjia, State) ->
	io:format(hehe),
	{ok, State};
handle_event(Event, State) ->
	self() ! test,
	case Event =:= self of
		true -> io:format("self is :~p~n", [self()]);
		_ -> skip
	end,
	io:format("event get:~p~n",[Event]),
	{ok, State}.

handle_info(play_with_self, State) ->
	self()!play_with_self,
	io:format("play_with_self~n"),
	{ok, State};
handle_info(send_msg_to_self, State) ->
	self()!123,
	io:format("get send_msg_to_self~n"),
	{ok, State};
handle_info(_, State) ->
	io:format("info get~n"),
	{ok, State}.

handle_call(_Request, State) ->
	io:format("call get~n"),
    Reply = ok,
    {ok, Reply, State}.

terminate(_Reason, _State) ->
	io:format("Delete a Handler~n"),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
