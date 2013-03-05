include ../../Library/Python.mk

Title=		Genshi (Python Module)
Name=		genshi
Version=	0.7
Revision=	0
URL=		http://ftp.edgewall.com/pub/genshi/
Source=		Genshi-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(Python) -c 'import genshi'
endef
