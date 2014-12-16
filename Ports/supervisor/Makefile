Requires += org.rudix.pkg.meld3,meld3,meld3install.pkg

include ../../Library/Python.mk

Title=		Supervisor
Name=		supervisor
Version=	3.0b2
Revision=	0
Site=		http://supervisord.org/index.html
URL=		http://pypi.python.org/packages/source/s/supervisor/
Source=		$(Name)-$(Version).tar.gz
License=	BSD Like

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSES.txt

define test_inner_hook
$(BinDir)/supervisorctl -h
$(BinDir)/supervisord -h
endef
