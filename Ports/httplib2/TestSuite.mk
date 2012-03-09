#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: import

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove httplib2
	sudo rudix install httplib2-*.pkg

import:
	@$(call info_color,Testing httplib2 module...)
	python -c 'import httplib2'
	@$(call info_color,Done)

teardown:
	sudo rudix remove httplib2
	@$(call info_color,Finished)
