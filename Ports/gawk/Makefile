include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Programming language that makes it possible to handle simple data-reformatting
Site=		http://www.gnu.org/software/gawk/
License=	GPL
Title=		Gawk
Name=		gawk
Version=	4.0.0
Revision=	2
URL=		http://ftp.gnu.org/gnu/gawk/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

define install_post_hook
install -m 644 $(SourceDir)/{FUTURES,LIMITATIONS,POSIX.STD,PROBLEMS} $(InstallDir)/$(DocDir)/$(Name)
endef
