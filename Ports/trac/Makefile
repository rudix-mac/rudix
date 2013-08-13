Requires += org.rudix.pkg.genshi,genshi,genshiinstall.pkg

include ../../Library/Python.mk

Title=		Trac
Name=		trac
Version=	1.0.1
Revision=	0
URL=		http://download.edgewall.org/trac/
Source=		Trac-$(Version).tar.gz

define test_inner_hook
$(BinDir)/trac-admin --version
endef
