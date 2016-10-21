-module(ge_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	RestartStrategy = {one_for_one, 4, 3600},
	GEManager = {ge_event, {ge_event, start_link, []},
				permanent, 2000, worker, [ge_event]},
	{ok, {RestartStrategy,
		[GEManager]}}.
