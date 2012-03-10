include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://bvi.sourceforge.net/
License=	GPL
Description=	Binary visual display editor, based on vi
Title=		Bvi $(Version)
Name=		bvi
Version=	1.3.2
Revision=	7
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).src.tar.gz
ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

define post_install_hook
cp -a $(BUILDDIR)/html $(INSTALLDOCDIR)
endef

define test_inner_hook
$(if $(RUDIX_UNIVERSAL),$(call test_universal))
endef
