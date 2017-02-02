BuildRequires += $(BinDir)/cmake

include ../../Library/GNU.mk

Title=		YAJL
Name=		yajl
Version=	2.1.0
Site=		https://lloyd.github.io/yajl/
Source=		http://github.com/lloyd/yajl/tarball/$(Version)
License=        ISC

UncompressedName=lloyd-yajl-*
MakeFlags=

define test_hook
echo {} | $(BinDir)/json_verify
echo {} | $(BinDir)/json_reformat
endef
