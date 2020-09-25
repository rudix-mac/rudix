include ../../Library/UNIX.mk

Title=		LaTex to RTF
Name=		latex2rtf
Version=	2.3.17
Site=		http://www.gnu.org/software/gtypist
Source=		https://sourceforge.net/projects/$(Name)/files/$(Name)-unix/$(Version)/$(Name)-$(Version).tar.gz/download
License=	GPLv2
LicenseFile=	$(SourceDir)/Copyright

PatchLevel=-p0

define test_hook
$(BinDir)/$(latex2rtf) -V | grep $(Version)
endef
