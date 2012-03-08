#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: fab python

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove fabric
	sudo rudix install fabric-*.pkg

fab:
	@$(call info_color,Testing fab executable...)
	/usr/local/bin/fab

python:
	@$(call info_color,Testing Python module...)
	python -c 'from fabric.api import run ; run("uptime")'

teardown:
	sudo rudix remove fabric
	$(call info_color,Finished)
