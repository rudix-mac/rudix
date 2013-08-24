include ../../Library/GNU.mk

Title=		Tcsh
Name=		tcsh
Version=	6.18.01
Revision=	0
URL=		ftp://ftp.astron.com/pub/tcsh/
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/Copyright

define test_inner_hook
$(BinDir)/tcsh --version
endef
