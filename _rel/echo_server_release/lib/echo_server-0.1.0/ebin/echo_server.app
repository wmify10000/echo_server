{application, 'echo_server', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['cgi_web_server','echo','echo_server_app','echo_server_sup','mochijson2']},
	{registered, [echo_server_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {echo_server_app, []}},
	{env, []}
]}.