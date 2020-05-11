include ../../Library/GNU.mk

Title=		p11-glue
Name=		p11-kit
Version=	0.23.20
Site=		https://p11-glue.github.io/p11-glue/p11-kit.html
Source=		https://github.com/p11-glue/p11-kit/archive/0.23.14.tar.gz
License=        GPL2

GnuConfigureExtra += --disable-nls
GnuConfigureExtra += --disable-trust-module

define gnu_configure
./autogen.sh $(GnuConfigureExtra) \
       --prefix=$(Prefix) \
       --mandir=$(ManDir) \
       --infodir=$(InfoDir) 
endef
