# GNUFormula.mk - Formula to build in GNU Style (with help of configure)
# Copyright (c) 2011 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

ifeq ($(RUDIX_ENABLE_NLS),yes)
GnuConfigureExtra += --enable-nls
BuildRequires += /usr/local/lib/libintl.la
else ifeq ($(RUDIX_ENABLE_NLS),no)
GnuConfigureExtra += --disable-nls
endif

define build_inner_hook
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" \
$(gnu_configure)
cd $(BuildDir) ; $(gnu_make) $(GnuMakeExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(gnu_make) install DESTDIR="$(PortDir)/$(InstallDir)" $(GnuMakeInstallExtra)
$(install_base_documentation)
for x in $(wildcard \
	$(BuildDir)/AUTHORS* \
	$(BuildDir)/ACKS* \
	$(BuildDir)/CHANGES* \
	$(BuildDir)/COPYING* \
	$(BuildDir)/CREDITS* \
	$(BuildDir)/NOTICE* \
	$(BuildDir)/README* \
	$(BuildDir)/INSTALL* \
	$(BuildDir)/NEWS* \
	$(BuildDir)/LICENSE* \
	$(BuildDir)/ChangeLog*) ; do \
	install -m 644 $$x $(InstallDir)/$(DocDir)/$(Name) ; \
done
endef

define test_inner_hook
$(if $(RUDIX_UNIVERSAL),$(call test_universal))
cd $(BuildDir) ; $(gnu_make) check
endef
