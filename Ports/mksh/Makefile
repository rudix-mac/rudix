include ../../Library/Unix.mk

Title=		Mir BSD Korn Shell
Name=		mksh
Version=	R56c
Site=		https://www.mirbsd.org/mksh.htm
Source=		http://www.mirbsd.org/MirOS/dist/mir/$(Name)/$(Name)-$(Version).tgz
License=        3-clause UCB

Files = https://www.mirbsd.org/TaC-mksh.txt

UncompressedName=	$(Name)

LicenseFile=	TaC-mksh.txt
ReadMeFile=		README

define	build_hook
cd $(BuildDir); mkdir build; cd build; /bin/sh ../Build.sh
endef

define install_hook
cd $(BuildDir); \
install -d $(DestDir)/$(Prefix)/{bin,share/doc/mksh/examples,share/man/man1} ; \
install -m 555 build/mksh $(DestDir)/$(Prefix)/bin; \
install -m 444 dot.mkshrc $(DestDir)/$(Prefix)/share/doc/mksh/examples; \
install -m 444 lksh.1 mksh.1 $(DestDir)/$(Prefix)/share/man/man1
endef
