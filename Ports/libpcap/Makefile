include ../../Library/GNU.mk

Title=		Libpcap
Name=		libpcap
Version=	1.6.2
Site=		http://www.tcpdump.org
Source=		http://www.tcpdump.org/release/$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/pcap-config --cflags --libs | grep $(Prefix)
endef
