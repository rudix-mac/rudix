#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: daemon

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove dovecot
	sudo rudix install dovecot-*.pkg
	sudo killall dovecot

daemon:
	@$(call info_color,Testing dovecot daemon...)
	sudo /usr/local/sbin/dovecot -c tests/dovecot.conf
	@$(call info_color, Done)

teardown:
	sudo killall dovecot
	sudo rudix remove dovecot
	@$(call info_color,Finished)
