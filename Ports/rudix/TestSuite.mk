#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program install available search update remove

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

available:
	@$(call info_color,Testing rudix available...)
	/usr/local/bin/rudix available | wc -l
	@$(call info_color,Done)

search:
	@$(call info_color,Testing rudix search...)
	/usr/local/bin/rudix search rudix
	@$(call info_color,Done)

update:
	@$(call info_color,Testing rudix update...)
	/usr/local/bin/rudix update
	@$(call info_color,Done)

remove:
	@$(call info_color,Testing rudix remove...)
	sudo /usr/local/bin/rudix remove wget
	@$(call info_color,Done)

teardown:
	sudo ./rudix.py remove rudix
	@$(call info_color,Finished)

.PHONY: setup teardown program install remove
