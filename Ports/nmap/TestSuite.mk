#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove nmap
	sudo rudix install nmap-*.pkg

teardown:
	sudo rudix remove nmap
	@$(call info_color,Finished)

program:
	@$(call info_color,Testing nmap...)
	/usr/local/bin/nmap localhost
	@$(call info_color,Done)


.PHONY: setup teardown program
