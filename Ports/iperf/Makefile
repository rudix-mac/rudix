include ../../Library/GNU.mk

Title=		Iperf
Name=		iperf
Version=	3.6
Site=		https://github.com/esnet/iperf
Source=		http://downloads.es.net/pub/iperf/$(Name)-$(Version).tar.gz
License=	BSD
ReadMeFile=    $(SourceDir)/README.md
LicenseFile=    $(SourceDir)/docs/_esnet/LICENSE

define test_hook
$(BinDir)/iperf
endef
