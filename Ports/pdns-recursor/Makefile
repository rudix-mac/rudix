BuildRequires += $(IncludeDir)/boost/multi_index_container.hpp # boost

include ../../Library/GNU.mk

Title=		PowerDNS Recursor
Name=		pdns-recursor
Version=	3.3
Revision=	0
URL=		http://downloads.powerdns.com/releases/
Source=		$(Name)-$(Version).tar.bz2


define test_inner_hook
$(SBinDir)/pdns_recursor --version || [ $$? == 99 ]
endef
