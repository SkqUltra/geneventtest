-module(test).

-compile(export_all).

start_app() ->
    application:start(getest).
    