include ../../Library/GNU.mk

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

Title=		DASH
Name=		dash
Version=	0.5.8
Revision=	0
Site=		http://gondor.apana.org.au/~herbert/dash/
Source=		http://gondor.apana.org.au/~herbert/dash/files/$(Name)-$(Version).tar.gz
Checksum=	cd058935bba545427caa375337afe8a6309477d2
License=	BSD

ReadMeFile=	README

define test_inner_hook
$(BinDir)/dash -c 'echo $$0' | grep dash
endef
