include ../../Library/GNU.mk

Title=		Aewan
Name=		aewan
Version=	1.0.01
Site=		https://sourceforge.net/projects/aewan/
Source=		https://sourceforge.net/projects/aewan/files/aewan/$(Name)-$(Version)/$(Name)-$(Version).tar.gz
License=	GPLv2
ReadMeFile=	$(SourceDir)/README

PatchLevel=	-p1

# just make the broken tar not break the build
define prep_hook
tar -xvf $(Name)-$(Version).tar.gz || true
mv -v $(UncompressedName) $(SourceDir)
$(apply_patches)
endef
