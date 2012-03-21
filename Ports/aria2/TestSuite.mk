#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: aria2

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove aria2
	sudo rudix install aria2-*.pkg

teardown:
	sudo rudix remove aria2
	rm -f rudix.py
	@$(call info_color,Finished)

aria2:
	@$(call info_color,Testing aria2c...)
	/usr/local/bin/aria2c --version
	/usr/local/bin/aria2c http://rudix.googlecode.com/hg/Ports/rudix/rudix.py
	@$(call info_color,Done)

.PHONY: setup teardown aria2
