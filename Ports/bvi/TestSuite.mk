#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove bvi
	sudo rudix install bvi-*.pkg

program:
	@$(call info_color,Testing bvi program...)
	/usr/local/bin/bvi
	@$(call info_color,Done)

teardown:
	sudo rudix remove bvi
	@$(call info_color,Finished)

.PHONY: setup teardown program
