BuildRequires += $(IncludeDir)/boost/multi_index_container.hpp # boost

include ../../Library/GNU.mk

Title=		PowerDNS Recursor
Name=		pdns-recursor
Version=	3.5.2
Site=		http://www.powerdns.com/
Source=		http://downloads.powerdns.com/releases//$(Name)-$(Version).tar.bz2
License=	GPL

define test_hook
$(SBinDir)/pdns_recursor --version || [ $$? == 99 ]
endef
