#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: xml2 xslt

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove libxml2-python
	sudo rudix install libxml2-python-*.pkg
	@$(call info_color,Done)

xml2:
	@$(call info_color,Testing XML2 module...)
	python -c 'import libxml2'
	@$(call info_color,Done)

xslt:
	@$(call info_color,Testing XSLT module...)
	python -c 'import libxslt'
	@$(call info_color,Done)

teardown:
	sudo rudix remove libxml2-python
	@$(call info_color,Finished)
