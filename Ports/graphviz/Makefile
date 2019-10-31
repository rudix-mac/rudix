include ../../Library/GNU.mk

Title=		Graphviz
Name=		graphviz
Version=	2.40.1
Site=		https://graphviz.org
Source=		https://graphviz.gitlab.io/pub/graphviz/stable/SOURCES/graphviz.tar.gz
License=	EPL

define test_hook
$(BinDir)/dot --verison | grep $(Version)
endef
