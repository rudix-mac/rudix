include ../../Library/GNU.mk

Title=		p11-glue
Name=		p11-kit
Version=	0.23.14
Site=		https://p11-glue.github.io/p11-glue/p11-kit.html
Source=		https://github.com/p11-glue/p11-kit/archive/0.23.14.tar.gz
License=        GPL2

define gnu_configure
./autogen.sh $(GnuConfigureExtra) \
       --prefix=$(Prefix) \
       --mandir=$(ManDir) \
       --infodir=$(InfoDir) \
       --disable-trust-module \
       $(if $(findstring yes,$(RUDIX_DISABLE_DEPENDENCY_TRACKING)),--disable-dependency-tracking) \
       $(if $(findstring yes,$(RUDIX_SAVE_CONFIGURE_CACHE)),--cache-file=$(PortDir)/config.cache)
endef
