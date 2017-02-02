include ../../Library/Python.mk

Title=		Psycopg
Name=		psycopg
Version=	2.5
Site=		http://initd.org/psycopg/
Source=		http://initd.org/psycopg/tarballs/PSYCOPG-2-5/$(Name)2-$(Version).tar.gz
License=	GPL

LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=$(Name)2-$(Version)

define test_hook
$(Python) -c 'import psycopg2'
endef
