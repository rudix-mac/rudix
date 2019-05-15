include ../../Library/GNU.mk

Title=		MP4V2
Name=		mp4v2
Version=	3.0.4.0
Site=		https://github.com/TechSmith/mp4v2
Source=		https://github.com/TechSmith/$(Name)/archive/Release-ThirdParty-MP4v2-$(Version).tar.gz
License=        GPL
UncompressedName=$(Name)-Release-ThirdParty-MP4v2-$(Version)

define test_hook
$(BinDir)/mp4v2 --version | grep $(Version)
endef
