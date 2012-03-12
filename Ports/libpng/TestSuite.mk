#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: program

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove libpng
	sudo rudix install libpng-*.pkg

teardown:
	sudo rudix remove libpng
	@$(call info_color,Finished)

program:
	@$(call info_color,Testing libpng-config...)
	/usr/local/bin/libpng-config --version
	@$(call info_color,Done)


.PHONY: setup teardown program
