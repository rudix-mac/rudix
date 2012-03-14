#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove httptunnel
	sudo rudix install httptunnel-*.pkg

teardown:
	sudo rudix remove httptunnel
	@$(call info_color,Finished)

program:
	@$(call info_color,Testing httptunnel...)
	/usr/local/bin/hts -help
	/usr/local/bin/htc -help
	@$(call info_color,Done)


.PHONY: setup teardown program
