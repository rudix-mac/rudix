BuildRequires += $(BinDir)/ocamlc # ocaml

include ../../Library/Unix.mk

Title=		Unison File Synchronizer
Name=		unison
Version=	2.40.102
Site=		http://www.cis.upenn.edu/~bcpierce/unison/
Source=		http://www.seas.upenn.edu/~bcpierce/unison//download/releases/stable//$(Name)-$(Version).tar.gz
License=	GPL

define build_inner_hook
cd $(BuildDir) && make UISTYLE=text
endef

define install_inner_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/unison $(DestDir)$(BinDir)/unison
$(install_base_documentation)
endef
