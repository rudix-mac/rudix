include ../../Library/Python.mk

BuildRequires += $(PythonSitePackages)/crypto-2.6-py2.7.egg-info

Title=		ssh (Python module)
Name=		python-ssh
Version=	1.7.14
Revision=	0
URL=		http://pypi.python.org/packages/source/s/ssh/
Source=		ssh-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/PKG-INFO
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName = ssh-$(Version)

define test_inner_hook
cd $(BuildDir) ; $(Python) test.py
endef

define test_inner_hook
$(Python) -c 'import ssh'
endef
