-module(echo_server_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		%% {URIHost, list({URIPath, Handler, Opts})}
		{'_', [
			{"/test2.html", cowboy_static, {priv_file, echo_server, "test2.html"}},
			{"/cgi", cgi_web_server, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(my_http_listener,
		[{port, 8080}],
		#{env => #{dispatch => Dispatch}}
	),
	echo_server_sup:start_link().

stop(_State) ->
	ok.
