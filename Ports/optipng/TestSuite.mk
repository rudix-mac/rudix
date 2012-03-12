#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program libpng

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove optipng
	sudo rudix install optipng-*.pkg

teardown:
	sudo rudix remove rudix
	@$(call info_color,Finished)

program:
	@$(call info_color,Testing optipng program...)
	/usr/local/bin/optipng -h
	@$(call info_color,Done)

libpng:
	@$(call info_color,Testing libpng linkage...)
	otool -L /usr/local/bin/optipng | grep -v libpng
	@$(call info_color,Done)

.PHONY: setup teardown program libpng

