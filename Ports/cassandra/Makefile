RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache Cassandra
Name=		cassandra
Version=	1.2.3
Revision=	0
#URL=		http://www.apache.org/dist/cassandra/apache-cassandra/$(Version)
URL=		http://www.us.apache.org/dist/cassandra/$(Version)
Source=		apache-$(Name)-$(Version)-bin.tar.gz

ReadMeFile=	$(InstallDir)$(LibDir)/cassandra/README.txt
LicenseFile=	$(InstallDir)$(LibDir)/cassandra/LICENSE.txt

UncompressedName=apache-cassandra-$(Version)

define install_inner_hook
install -d $(InstallDir)$(LibDir)
tar zxf $(PortDir)/$(Source) -C $(InstallDir)$(LibDir)
mv $(InstallDir)$(LibDir)/apache-cassandra-$(Version) \
	$(InstallDir)$(LibDir)/cassandra
rm -rf $(InstallDir)$(LibDir)/cassandra/bin/linux-x86-*
#install -d $(InstallDir)$(BinDir)
#ln -sf $(LibDir)/cassandra/bin/cassandra $(InstallDir)$(BinDir)
mv $(InstallDir)$(LibDir)/cassandra/conf \
	$(InstallDir)$(LibDir)/cassandra/conf.default
rm -rf $(InstallDir)$(LibDir)/cassandra/example
rm -rf $(InstallDir)$(LibDir)/cassandra/data/*
endef

define test_inner_hook
sudo $(LibDir)/cassandra/bin/cassandra
sleep 15
sudo killall java
endef
