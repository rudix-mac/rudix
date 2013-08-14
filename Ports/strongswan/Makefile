BuildRequires += $(LibDir)/libvstr.la # static-vstr
BuildRequires += $(LibDir)/libgmp.la # static-gmp

include ../../Library/GNU.mk

Title=		StrongSwan
Name=		strongswan
Version=	5.1.0
Revision=	0
URL=		http://download.strongswan.org
Source=		$(Name)-$(Version).tar.bz2

GnuConfigureExtra += --disable-kernel-netlink
