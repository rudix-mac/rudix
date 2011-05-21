BuildRequires=	$(LibDir)/librsync.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/PythonFormula.mk

Description=	rdiff-backup backs up one directory to another, possibly over a network
Site=		http://rdiff-backup.nongnu.org/
License=	GPL
Title=		Rdiff-backup
Name=		rdiff-backup
Version=	1.2.8
Revision=	2
URL=		http://savannah.nongnu.org/download/rdiff-backup/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
define prep_post_hook
perl -p -i.orig -e s/\'rsync\'/\'\\/usr\\/local\\/lib\\/librsync.a\\/\'/g $(SourceDir)/setup.py
endef
endif
