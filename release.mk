include make/deps.mk

app:: MAKE += -frelease.mk
relx-rel: MAKE += -frelease.mk

include erlang.mk