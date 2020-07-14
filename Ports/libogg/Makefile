include ../../Library/GNU.mk

Title=		LibOgg
Name=		libogg
Version=	1.3.4
Site=		http://www.xiph.org/ogg/
Source=		http://downloads.xiph.org/releases/ogg//$(Name)-$(Version).tar.gz
License=	BSD
ReadMeFile=	$(SourceDir)/README.md

define test_hook
grep libogg $(LibDir)/libogg.la
endef
