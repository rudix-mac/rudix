include ../../Library/GNU.mk

Title=		tcptrace
Name=		tcptrace
Version=	6.6.7
Site=		http://www.tcptrace.org/index.shtml
Source=		http://deb.debian.org/debian/pool/main/t/tcptrace/tcptrace_6.6.7.orig.tar.gz
License=	Public Domain

BuildRequires += $(LibDir)/libpcap.a

#define after_prep_hook
#patch -d $(SourceDir) < patches/00-install.diff
#endef
# ReadMeFile=	$(SourceDir)/README

define test_hook
$(BinDir)/tcptrace -v | grep $(Version)
endef
