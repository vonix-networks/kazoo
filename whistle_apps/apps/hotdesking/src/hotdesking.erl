%%%-------------------------------------------------------------------
%%% @author Edouard Swiac <edouard@2600hz.org>
%%% @copyright (C) 2011, VoIP INC
%%% @doc
%%% Retrieve your configuration and data (voicemails, callflows) from
%%% any device
%%% @end
%%% Created :  29 Jul 2011 by Eoduard <edouard@2600hz.org>
%%%-------------------------------------------------------------------
-module(hotdesking).

-include_lib("whistle/include/whistle_types.hrl"). 

-author('Edouard Swiac <edouard@2600hz.org>').
-export([start/0, start_link/0, stop/0]).

%%--------------------------------------------------------------------
%% @public
%% @doc
%% Starts the app for inclusion in a supervisor tree
%% @end
%%--------------------------------------------------------------------
-spec start_link/0 :: () -> startlink_ret().
start_link() ->
    start_deps(),
    hotdesking_sup:start_link().

%%--------------------------------------------------------------------
%% @public
%% @doc
%% Starts the app
%% @end
%%--------------------------------------------------------------------
-spec start/0 :: () -> ok.
start() ->
    start_deps(),
    application:start(hotdesking).

%%--------------------------------------------------------------------
%% @public
%% @doc
%% Stop the app
%% @end
%%--------------------------------------------------------------------
-spec stop/0 :: () -> ok.
stop() ->
    ok = application:stop(hotdesking).

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Ensure that all depencencies for this app are already running
%% @end
%%--------------------------------------------------------------------
-spec start_deps/0 :: () -> ok.
start_deps() ->
    whistle_apps_deps:ensure(?MODULE), % if started by the whistle_controller, this will exist
    ensure_started(sasl), % logging
    ensure_started(crypto), % random
    ensure_started(whistle_amqp), % amqp wrapper
    ensure_started(whistle_couch). % couch wrapper

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Verify that an application is running
%% @end
%%--------------------------------------------------------------------
-spec ensure_started/1 :: (App) -> ok when
      App :: atom().
ensure_started(App) ->
    case application:start(App) of
	ok ->
	    ok;
	{error, {already_started, App}} ->
	    ok
    end.
