-module(ge_event).

-export([start_link/0,
		add_handler/2,
		delete_handler/2,
		test/1]).

start_link() ->
	gen_event:start_link({local, ?MODULE}).

add_handler(Handler, Args) ->
	gen_event:add_handler(?MODULE, Handler, Args).

delete_handler(Handler, Args) ->
	gen_event:delete_handler(?MODULE, Handler, Args).

test(Info) ->
	gen_event:notify(?MODULE, Info).