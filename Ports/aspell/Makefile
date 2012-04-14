include ../../Library/GNU.mk

Title=          GNU Aspell
Name=           aspell
Version=        0.60.6.1
Revision=       0
URL=            http://ftp.gnu.org/gnu/aspell/
Source=         $(Name)-$(Version).tar.gz

ReadMeFile=     $(BuildDir)/README
LicenseFile=    $(BuildDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation
endif
