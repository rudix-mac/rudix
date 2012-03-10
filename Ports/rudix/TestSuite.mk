#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program install remove

setup:
	@$(call info_color,Starting tests)
	sudo ./rudix.py remove rudix
	sudo ./rudix.py install rudix-*.pkg

program:
	@$(call info_color,Testing rudix program...)
	/usr/local/bin/rudix
	@$(call info_color,Done)

install:
	@$(call info_color,Testing rudix install...)
	sudo /usr/local/bin/rudix install wget
	@$(call info_color,Done)

remove:
	@$(call info_color,Testing rudix remove...)
	sudo /usr/local/bin/rudix remove wget
	@$(call info_color,Done)

teardown:
	sudo ./rudix.py remove rudix
	@$(call info_color,Finished)

.PHONY: setup teardown program install remove
