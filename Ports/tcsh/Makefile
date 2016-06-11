include ../../Library/GNU.mk

Title=		Tcsh
Name=		tcsh
Version=	6.19.00
Revision=	0
Site=		http://www.tcsh.org/Home
Source=		ftp://ftp.astron.com/pub/tcsh/$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/Copyright

define test_inner_hook
$(BinDir)/tcsh --version | grep $(Version)
endef
