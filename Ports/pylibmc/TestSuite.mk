#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: import

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove pylibmc
	sudo rudix install pylibmc-*.pkg
	@$(call info_color,Done)

import:
	@$(call info_color,Importing pylibmc module...)
	python -c 'import pylibmc'
	@$(call info_color,Done)

teardown:
	sudo rudix remove pylibmc
	@$(call info_color,Finished)
