include ../../Library/GNU.mk

Title=		tcptrace
Name=		tcptrace
Version=	6.6.7
Site=		http://www.tcptrace.org/index.shtml
Source=		http://www.tcptrace.org/download/$(Name)-$(Version).tar.gz
License=	Public Domain

BuildRequires += $(LibDir)/libpcap.a

define after_prep_hook
patch -d $(SourceDir) < patches/00-install.diff
endef
# ReadMeFile=	$(SourceDir)/README

# define test_hook
# $(BinDir)/mg --help | grep $(Version)
# endef
