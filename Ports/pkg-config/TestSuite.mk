#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: pkg-config

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove pkg-config
	sudo rudix install pkg-config-*.pkg

pkg-config:
	@$(call info_color,Testing pkg-config program...)
	/usr/local/bin/pkg-config --version
	@$(call info_color,Done)

teardown:
	sudo rudix remove pkg-config
	@$(call info_color,Finished)
