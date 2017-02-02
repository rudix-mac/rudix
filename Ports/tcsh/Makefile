include ../../Library/GNU.mk

Title=		Tcsh
Name=		tcsh
Version=	6.20.00
Site=		http://www.tcsh.org/Home
Source=		ftp://ftp.astron.com/pub/tcsh/$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/Copyright

define test_hook
$(BinDir)/tcsh --version | grep $(Version)
endef
