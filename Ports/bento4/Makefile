include ../../Library/Unix.mk

Title=		Bento4
Name=		bento4
Version=	1.5.1-624
Site=		https://www.bento4.com
Source=		https://github.com/axiomatic-systems/Bento4/archive/v${Version}.tar.gz
License=        GPL

LicenseFile=	${BuildDir}/Documents/LICENSE.txt
ReadMeFile=	${BuildDir}/README.md

UncompressedName=	${Title}-${Version}

define build_hook
cd ${BuildDir}/Build/Targets/universal-apple-macosx; \
xcodebuild -target All -configuration Release SYMROOT=build
endef

define install_hook
install -m 755 -d ${DestDir}/usr/local/bin ; \
find ${BuildDir}/Build/Targets/universal-apple-macosx/build/Release \
	-type f -perm 0755 \
	-exec install -m 755 {} ${DestDir}/usr/local/bin \; ;\
rm ${DestDir}/usr/local/bin/*.dylib; \
rm ${DestDir}/usr/local/bin/*Test*
endef
