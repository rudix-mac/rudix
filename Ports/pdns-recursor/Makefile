BuildRequires += $(IncludeDir)/boost/multi_index_container.hpp # boost

include ../../Library/GNU.mk

Title=		PowerDNS Recursor
Name=		pdns-recursor
Version=	3.5.2
Revision=	0
Site=		http://www.powerdns.com/
URL=		http://downloads.powerdns.com/releases/
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

define test_inner_hook
$(SBinDir)/pdns_recursor --version || [ $$? == 99 ]
endef
