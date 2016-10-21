{application, getest,
[{descript, "A test of gen_event"},
	{vsn, "0.1.0"},
	{modules, [
		ge_app,
		ge_event,
		ge_event_appender,
		ge_sup,
		test
	]},
	{registered, [ge_event, ge_sup]},
	{applications, [kernel, stdlib]},
	{mod, {ge_app, []}}
]}.