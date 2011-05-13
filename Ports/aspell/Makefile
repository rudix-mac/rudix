ifeq ($(RUDIX_ENABLE_NLS),yes)
BuildRequires += /usr/local/lib/libintl.la
endif

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=           http://aspell.net/
License=        LGPL
Description=    GNU Aspell spell checker
Title=          GNU Aspell
Name=           aspell
Version=        0.60.6
Revision=       0
URL=            ftp://ftp.gnu.org/gnu/aspell/
Source=         $(Name)-$(Version).tar.gz

ReadMeFile=     $(BuildDir)/README
LicenseFile=    $(BuildDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIB),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif
