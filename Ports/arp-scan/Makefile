include ../../Library/GNU.mk

Title=		Arp Scan
Name=		arp-scan
Version=	1.9
Revision=	0
Site=		http://www.nta-monitor.com/tools-resources/security-tools/arp-scan
URL=		http://www.nta-monitor.com/files/arp-scan
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/arp-scan --version 2>&1 | grep $(Version)
endef
