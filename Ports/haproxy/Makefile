include ../../Library/Unix.mk

Title=		HAProxy
Name=		haproxy
Version=	1.4.24
Revision=	0
URL=		http://haproxy.1wt.eu/download/1.4/src
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

MakeExtra += TARGET=macosx

define test_inner_hook
$(SBinDir)/haproxy -vv
endef
