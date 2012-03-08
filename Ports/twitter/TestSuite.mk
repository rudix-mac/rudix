#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: twitter

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove twitter
	sudo rudix install twitter-*.pkg
	@$(call info_color,Done)

twitter:
	@$(call info_color,Testing twitter command...)
	/usr/local/bin/twitter
	@$(call info_color,Done)

teardown:
	sudo rudix remove twitter
	@$(call info_color,Finished)
