PkgFile = $(DistName)-$(Version).tgz

define pkg_hook
cd $(InstallDir)$(Prefix) && tar -zcvf $(PortDir)/$(PkgFile) .
endef

define before_test_hook
tar -zxvf $(PkgFile) -C $(Prefix)
endef
