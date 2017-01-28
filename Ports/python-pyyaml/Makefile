BuildRequires +=  $(LibDir)/libyaml.la # static-libyaml

include ../../Library/Python.mk

Title=		PyYAML
Name=		python-pyyaml
Version=	3.11
Site=		http://pyyaml.org
Source=		http://pyyaml.org/download/pyyaml/PyYAML-$(Version).tar.gz
License=	MIT
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=PyYAML-$(Version)

CFlags += -I$(IncludeDir)
LdFlags += -L$(LibDir)
SetupExtra += --with-libyaml

define test_inner_hook
$(Python) -c 'import yaml'
endef
