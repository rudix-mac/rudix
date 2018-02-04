include ../../Library/Python.mk

Title=		Python pip
Name=		python-pip
Version=	9.0.1
Site=		https://pip.pypa.io/
Source=		https://pypi.python.org/packages/source/p/pip/pip-$(Version).tar.gz
Source=		https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=pip-$(Version)

define test_hook
$(BinDir)/pip --version | grep $(Version)
endef
