#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove mtr
	sudo rudix install mtr-*.pkg

teardown:
	sudo rudix remove mtr
	@$(call info_color,Finished)

program:
	@$(call info_color,Testing mtr program...)
	sudo /usr/local/sbin/mtr google.com
	@$(call info_color,Done)


.PHONY: setup teardown program
