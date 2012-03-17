BuildRequires=	$(LibDir)/librsync.la

include ../../Library/Python.mk

Title=		Rdiff-backup
Name=		rdiff-backup
Version=	1.2.8
Revision=	3
URL=		http://savannah.nongnu.org/download/rdiff-backup/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
define prep_post_hook
perl -p -i.orig -e s/\'rsync\'/\'\\/usr\\/local\\/lib\\/librsync.a\\/\'/g $(SourceDir)/setup.py
endef
endif
