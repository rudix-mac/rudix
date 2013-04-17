include ../../Library/Python.mk

Title=		Psycopg
Name=		psycopg
Version=	2.5
Revision=	0
URL=		http://initd.org/psycopg/tarballs/PSYCOPG-2-5
Source=		$(Name)2-$(Version).tar.gz

LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=$(Name)2-$(Version)

define test_inner_hook
$(Python) -c 'import psycopg2'
endef
