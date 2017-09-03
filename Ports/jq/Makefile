BuildRequires += $(BinDir)/autoconf # autoconf

include ../../Library/GNU.mk

Title=      jq
Name=       jq
Version=    1.5
Site=       https://github.com/stedolan/jq
Source=     $(Site)/releases/download/$(Name)-$(Version)/$(Name)-$(Version).tar.gz
License=    MIT

GnuConfigureExtra += --disable-maintainer-mode
ConfigureExtra += --sbindir=$(BinDir)
MakeInstallExtra += sbindir=$(BinDir)

define test_hook
sudo $(BinDir)/jq --version | grep $(Version)
endef
