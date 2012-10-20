# GNUFormula.mk - GNU Configure Formula
#
# Copyright (c) 2011-2012 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada
#

ifeq ($(RUDIX_ENABLE_NLS),yes)
GnuConfigureExtra += --enable-nls
BuildRequires += /usr/local/lib/libintl.la
else ifeq ($(RUDIX_ENABLE_NLS),no)
GnuConfigureExtra += --disable-nls
endif

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
GnuConfigureExtra += --disable-shared --enable-static
else ifeq ($(RUDIX_BUILD_STATIC_LIBS),no)
GnuConfigureExtra += --enable-shared --disable-static
endif

define gnu_configure
./configure $(GnuConfigureExtra) \
	--prefix=$(Prefix) \
	--mandir=$(ManDir) \
	--infodir=$(InfoDir) \
	$(if $(RUDIX_DISABLE_DEPENDENCY_TRACKING),--disable-dependency-tracking) \
	$(if $(RUDIX_SAVE_CONFIGURE_CACHE),--cache-file=$(PortDir)/config.cache)
endef

define install_gnu_documentation
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
	install -m 644 $$x $(PortDir)/$(InstallDir)/$(DocDir)/$(Name) ; \
done
rm -f $(InstallDir)/$(InfoDir)/dir
rm -f $(InstallDir)/$(LibDir)/charset.alias
rm -f $(InstallDir)/$(DataDir)/locale/locale.alias
endef

define build_inner_hook
$(call info_color,Running Configure)
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" $(EnvExtra) \
$(gnu_configure)
$(call info_color,Done)
cd $(BuildDir) ; $(make) $(MakeExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(make) install DESTDIR="$(PortDir)/$(InstallDir)" $(MakeInstallExtra)
$(install_base_documentation)
$(install_gnu_documentation)
endef

define test_build
cd $(BuildDir) ; $(make) check || $(call error_color,One or more tests failed)
endef

buildclean:
	cd $(BuildDir) ; $(make) clean
	rm -f build
