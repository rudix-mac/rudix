include ../../Library/GNU.mk

Title=		Arp Scan
Name=		arp-scan
Version=	1.9
Revision=	0
Site=		http://www.nta-monitor.com/tools-resources/security-tools/arp-scan
Source=		http://www.nta-monitor.com/files/arp-scan/$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/arp-scan --version 2>&1 | grep $(Version)
endef
