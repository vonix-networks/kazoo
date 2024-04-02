DEPS ?= amqp_client \
	certifi \
	chatterbox \
	couchbeam \
	cowboy \
	cowlib \
	ecsv \
	eflame \
	eiconv \
	erlang_localtime \
	erlazure \
	erlcloud \
	erlsom \
	erlydtl \
	fs_event \
	fs_sync \
	gen_smtp \
	getopt \
	gproc \
	gun \
	horse \
	inet_cidr \
	jesse \
	jiffy \
	lager \
	lager_syslog \
	meck \
	nklib \
	plists \
	poolboy \
	proper \
	ranch \
	recon \
	reloader \
	syslog \
	wsock \
	zucchini \
	enotify \
	yamerl \
	jsone \
	mimerl \
	eper \
	parsexml

BUILD_DEPS = parse_trans
IGNORE_DEPS = hamcrest

ifeq ($(CIRCLECI),true)
    DEPS += coveralls
    dep_coveralls = git https://github.com/markusn/coveralls-erl 1.4.0
    DEPS += proper
endif

dep_ranch = git https://github.com/ninenines/ranch.git 1.8.0
dep_cowboy = git  https://github.com/ninenines/cowboy.git 2.10.0
dep_cowlib = git  https://github.com/ninenines/cowlib.git 2.12.1

dep_gun = git https://github.com/2600hz/erlang-gun 2600hz-2.0.0-pre.3-4.3

# dep_apns = git https://github.com/2600hz/erlang-apns4erl.git 2600hz-2.4.2


dep_amqp_client = hex 3.7.14
dep_certifi = hex 2.13.0
dep_chatterbox = hex 0.8.0
dep_quickrand  =  hex 2.0.7
dep_eflame = git https://github.com/proger/eflame 34d0c19dee808d614d75d91c143386d5120efb4b
dep_eiconv = git https://github.com/zotonic/eiconv
dep_escalus = git https://github.com/esl/escalus 4.2.11
dep_exml = git https://github.com/paulgray/exml 2.2.1
dep_jiffy = git https://github.com/2600hz/erlang-jiffy 2600hz
dep_meck = git https://github.com/eproxus/meck
dep_qdate_localtime = git https://github.com/choptastic/qdate_localtime 1.2.1
dep_nklib = git https://github.com/NetComposer/nklib v0.4.1
dep_plists = git https://github.com/vonix-networks/plists 1.0.1-vonix

dep_erlcloud = git https://github.com/erlcloud/erlcloud 3.2.4

dep_erlazure = git https://github.com/lazedo/erlazure.git add-start-link

dep_couchbeam = git https://github.com/vonix-networks/erlang-couchbeam 1.5.0-vonix # Created new branch branch from kazoo5 and merged master into it
###dep_couchbeam = git https://github.com/benoitc/couchbeam 1.4.1
### waiting for pull requests
### https://github.com/benoitc/couchbeam/pull/158
### https://github.com/benoitc/couchbeam/pull/164
### https://github.com/benoitc/couchbeam/pull/165
### https://github.com/benoitc/couchbeam/pull/166
### https://github.com/benoitc/couchbeam/pull/174

dep_jesse = git https://github.com/2600hz/jesse 1.5-rc13
##dep_jesse = git https://github.com/for-GET/jesse 1.5.0-rc2

dep_lager = git https://github.com/erlang-lager/lager 3.9.2
# dep_trie = git https://github.com/okeuday/trie v1.5.4
dep_fs_event = git https://github.com/jamhed/fs_event 783400da08c2b55c295dbec81df0d926960c0346
dep_fs_sync = git https://github.com/jamhed/fs_sync 2cf85cf5861221128f020c453604d509fd37cd53
dep_inet_cidr = git https://github.com/2600hz/erlang-inet_cidr.git 1.0.2
### PR opened upstream ###
dep_erlang_localtime = git https://github.com/2600hz/erlang-localtime 2600hz


### need to update upstream ###
# dep_hep = git https://github.com/lazedo/hep 1.5.4
dep_ecsv = git https://github.com/lazedo/ecsv ecsv-1

### for scripts/dev-start-*.sh
dep_reloader = git https://github.com/lazedo/reloader v0.1

### build
dep_parse_trans = git https://github.com/uwiger/parse_trans 3.4.1

dep_horse = git https://github.com/ninenines/horse

dep_proper = git https://github.com/manopapad/proper v1.4

dep_syslog = git https://github.com/2600hz/erlang-syslog bbad537a1cb5e4f37e672d2e2665659e850662d0

# dep_fcm = git https://github.com/softwarejoint/fcm-erlang.git b2f68a4c6f0f59475597a35e2dc9be13d9ba2910

dep_gen_smtp = git https://github.com/2600hz/erlang-gen_smtp 3f80bfcd4fd8704739d264eb4d5005d4392f2a35
## pinning gen_smtp because upstream made some breaking changes (using maps in some options)
## adding check to not convert if the From/To encodings match
## latest commit to origin/2600Hz: Fixes for encoding email address in a single comma separated header line

dep_wsock = git https://github.com/vonix-networks/wsock 1.1.8-vonix

dep_enotify = hex 0.1.0
dep_yamerl = hex 0.10.0
dep_jsone = hex 1.8.1
dep_mimerl = hex 1.2.0
dep_eper = hex 0.99.1
dep_parsexml = hex 1.0.0