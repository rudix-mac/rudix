#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove lftp
	sudo rudix install lftp-*.pkg

teardown:
	sudo rudix remove lftp
	@$(call info_color,Finished)

program:
	@$(call info_color,Testing lftp...)
	/usr/local/bin/lftp
	@$(call info_color,Done)


.PHONY: setup teardown program
