include ../../Library/Python.mk

Title=		Supervisor
Name=		supervisor
Version=	3.0a12
Revision=	0
URL=		http://pypi.python.org/packages/source/s/supervisor/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSES.txt

define test_inner_hook
$(BinDir)/supervisorctl -h
$(BinDir)/supervisord -h
endef
