BuildRequires += $(BinDir)/autoconf # autoconf
BuildRequires += $(BinDir)/aclocal  # automake
BuildRequires += $(BinDir)/libtool  # libtool

include ../../Library/GNU.mk

Title=      jq
Name=       jq
Version=    1.6
Site=       https://github.com/stedolan/jq
Source=     $(Site)/releases/download/$(Name)-$(Version)/$(Name)-$(Version).tar.gz
License=    MIT

GnuConfigureExtra += --disable-maintainer-mode

define after_prep_hook
autoreconf -fi $(BuildDir)/configure.ac
endef

define test_hook
sudo $(BinDir)/jq --version | grep $(Version)
endef
