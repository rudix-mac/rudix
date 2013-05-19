BuildRequires += $(LibDir)/libvstr.la # static-libvstr
BuildRequires += $(LibDir)/libgmp.la # static-gmp

include ../../Library/GNU.mk

Title=		StrongSwan
Name=		strongswan
Version=	5.0.3
Revision=	0
URL=		http://download.strongswan.org
Source=		$(Name)-$(Version).tar.bz2

GnuConfigureExtra += --disable-kernel-netlink
