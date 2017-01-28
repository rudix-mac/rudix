include ../../Library/Python.mk

Title=		Python HTTP Requests
Name=		python-requests
Version=	2.3.0
Site=		http://python-requests.org
Source=		https://github.com/kennethreitz/requests/archive/v$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=requests-$(Version)

define test_inner_hook
$(Python) -c 'import requests'
endef
