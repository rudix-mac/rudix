#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: hoc

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove hoc
	sudo rudix install hoc-*.pkg

hoc:
	@$(call info_color,Testing hoc program...)
	echo "2 * PI" | /usr/local/bin/hoc
	@$(call info_color,Done)

teardown:
	sudo rudix remove hoc
	@$(call info_color,Finished)
