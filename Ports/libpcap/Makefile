include ../../Library/GNU.mk

Title=		Libpcap
Name=		libpcap
Version=	1.6.2
Revision=	0
Site=		http://www.tcpdump.org
Source=		http://www.tcpdump.org/release/$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

define test_inner_hook
$(BinDir)/pcap-config --cflags --libs | grep $(Prefix)
endef
