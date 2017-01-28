# https://pypi.python.org/pypi/midi

include ../../Library/Python.mk

Title=		Python MIDI library
Name=		python-midi
Version=	0.2.3
Site=		https://github.com/vishnubob/python-midi
Source=		https://github.com/vishnubob/python-midi/archive//v$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.mediawiki
LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/mididump $(SourceDir)/mary.mid | grep midi.Pattern
endef
