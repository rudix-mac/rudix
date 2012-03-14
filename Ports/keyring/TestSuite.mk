#!/usr/bin/make -f

include ../../Library/Python.mk

all: setup tests teardown

tests: module

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove keyring
	sudo rudix install keyring-*.pkg

teardown:
	sudo rudix remove keyring
	@$(call info_color,Finished)

module:
	@$(call info_color,Testing module keyring...)
	$(Python) -c 'import keyring'
	@$(call info_color,Done)


.PHONY: setup teardown program
