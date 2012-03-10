#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove NAME
	sudo rudix install NAME-*.pkg

program:
	@$(call info_color,Testing NAME program...)
	/usr/local/bin/NAME
	@$(call info_color,Done)

teardown:
	sudo rudix remove rudix
	@$(call info_color,Finished)

.PHONY: setup teardown program
