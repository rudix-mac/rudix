#BuildRequires += /usr/local/lib/libjpeg.a /usr/local/lib/libpng.a

include ../../Library/Python.mk

define build_pre_hook
cd $(BuildDir); \
rm Setup; \
python config.py; \
perl -p -i -e "s+-L/usr/local/lib *-lpng+/usr/local/lib/libpng.a+g; \
               s+-L/usr/local/lib *-ljpeg+/usr/local/lib/libjpeg.a+g" Setup
endef

define install_post_hook
mkdir $(InstallDir)/Library/Frameworks; \
cd $(InstallDir)/Library/Frameworks; \
cp -a /Library/Frameworks/SDL.framework ./; \
cp -a /Library/Frameworks/SDL_ttf.framework ./; \
cp -a /Library/Frameworks/SDL_image.framework ./; \
cp -a /Library/Frameworks/SDL_mixer.framework ./;
endef

Site=	http://www.pygame.org/
License=	LGPL
Description= Python Game Development Library
Title=		Pygame
Name=		pygame
Version=	1.9.1
Revision=	1
URL=		http://www.pygame.org/ftp/
Source=		$(Name)-$(Version)release.tar.gz
UncompressedName= $(Name)-$(Version)release

ReadMeFile=	$(BuildDir)/README.txt
LicenseFile=	$(BuildDir)/LGPL

Components= <component id="SDL" path="$(PortDir)/$(InstallDir)/Library/Frameworks/SDL.framework" version="1.2.14"/>
    <component id="SDL_image" path="$(PortDir)/$(InstallDir)/Library/Frameworks/SDL_image.framework" version="1.2.10"/>
    <component id="SDL_mixer" path="$(PortDir)/$(InstallDir)/Library/Frameworks/SDL_mixer.framework" version="1.2.11"/>
    <component id="SDL_ttf" path="$(PortDir)/$(InstallDir)/Library/Frameworks/SDL_ttf.framework" version="2.0.10"/>

