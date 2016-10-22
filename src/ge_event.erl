-module(ge_event).

-export([start_link/0,
		add_handler/2,
		delete_handler/2,
		test/2]).

start_link() ->
	io:format("event start~n"),
	{ok, Pid} = gen_event:start_link({local, ?MODULE}),
	io:format("Event Pid is:~p~n",[Pid]),
	{ok, Pid}.

add_handler(Handler, Args) ->
	gen_event:add_handler(?MODULE, Handler, Args).

delete_handler(Handler, Args) ->
	gen_event:delete_handler(?MODULE, Handler, Args).

test(notify, Info) ->
	gen_event:notify(?MODULE, Info);
test(call, {Handler, Info}) ->
	Ans = gen_event:call(?MODULE, Handler, Info),
	io:format("call ans is:~p~n",[Ans]);
test(_, Info) ->
	gen_event:notify(?MODULE, Info).