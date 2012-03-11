#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: paramiko

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove paramiko
	sudo rudix install paramiko-*.pkg
	sudo rudix install pycrypto

paramiko:
	@$(call info_color,Testing paramiko module...)
	python -c 'import paramiko'

teardown:
	sudo rudix remove paramiko
	sudo rudix remove pycrypto
	@$(call info_color,Finished)
