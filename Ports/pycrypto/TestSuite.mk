#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: pycrypto

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove pycrypto
	sudo rudix install pycrypto-*.pkg

teardown:
	sudo rudix remove pycrypto
	@$(call info_color,Finished)

pycrypto:
	@$(call info_color,Testing pycrypto module...)
	python -c 'import Crypto'
