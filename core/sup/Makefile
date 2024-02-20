ROOT = ../..
PROJECT = sup

ESCRIPT = sup
CLEAN_MOAR = clean-escript

export ERL_LIBS = $(ROOT)/core/kazoo_stdlib/:$(ROOT)/core/kazoo:$(ROOT)/core/kazoo_config

all: compile $(ESCRIPT)

$(ESCRIPT): src/sup.erl
	@$(REBAR) escriptize

clean-escript:
	@rm -f $(ESCRIPT)

include $(ROOT)/make/kz.mk
