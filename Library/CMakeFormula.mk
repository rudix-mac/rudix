# Scons Formula
#
# Copyright (c) 2011-2017 Rudá Moura (Rudix)
# Authors: Pedro A. Aranda Gutiérrez
#
BuildRequires += $(BinDir)/cmake
CMakeExtra = -DCMAKE_BUILD_TYPE=Release
CMakeExtra += -DCMAKE_INSTALL_PREFIX=$(Prefix)

ifeq ($(RUDIX_BUILD_STATIC_LIBS),yes)
CMakeExtra += -DBUILD_STATIC_LIBS=ON
endif

define build_pre_hook
mkdir -p $(BuildDir)/build && cd $(BuildDir)/build && cmake .. $(CMakeExtra)
endef

define build_hook
cd $(BuildDir)/build && make $(MakeExtra)
endef

define install_hook
cd $(BuildDir)/build && make DESTDIR="$(DestDir)" install $(MakeInstallExtra)
$(install_base_documentation)
$(strip_macho)
endef

buildclean:
	cd $(BuildDir) && rm -rf build
	rm -f build check
