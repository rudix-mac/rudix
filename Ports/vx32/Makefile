include ../../Library/Config.mk
RUDIX_UNIVERSAL=no
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Arch=i386

Title=		Vx32
Name=		vx32
Version=	0.12
Revision=	5
URL=		http://pdos.csail.mit.edu/~baford/vm/release/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/ADVENTURE
LicenseFile=	$(PortDir)/LICENSE

BuildDir = $(Name)-build/src
GnuMakeExtra = libvx32/libvx32.a 9vx/9vx vxrun/vxrun

GnuMakeInstallExtra = prefix=$(InstallDir)$(Prefix)

define install_post_hook
install -d $(InstallDir)/$(LibDir)
install -m 644 $(SourceDir)/src/libvx32/libvx32.a $(InstallDir)/$(LibDir)
install -d $(InstallDir)/$(IncludeDir)/vx32
install -m 644 $(SourceDir)/src/libvx32/*.h $(InstallDir)/$(IncludeDir)/vx32
install -d $(InstallDir)/$(BinDir)
install -m 755 $(SourceDir)/src/9vx/9vx $(InstallDir)/$(BinDir)
install -m 755 $(SourceDir)/src/vxrun/vxrun $(InstallDir)/$(BinDir)
install -m 755 $(SourceDir)/src/vxrun/vxrungcc $(InstallDir)/$(BinDir)
install -m 644 $(SourceDir)/ADVENTURE $(InstallDir)/$(DocDir)/vx32
install -m 644 $(SourceDir)/doc/*.pdf $(InstallDir)/$(DocDir)/vx32
endef
