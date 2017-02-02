BuildRequires += $(BinDir)/pcre-config # static-pcre

include ../../Library/Configure.mk

Title=		Nginx
Name=		nginx
Version=	1.7.2
Site=		http://nginx.org/
Source=		http://nginx.org/download//$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/LICENSE

ConfigureExtra += --prefix=$(DataDir)/nginx
ConfigureExtra += --sbin-path=$(BinDir)/nginx
ConfigureExtra += --conf-path=$(SysConfDir)/nginx/nginx.conf
ConfigureExtra += --error-log-path=$(LocalStateDir)/log/nginx/error.log
ConfigureExtra += --http-log-path=$(LocalStateDir)/log/nginx/access.log
ConfigureExtra += --pid-path=$(LocalStateDir)/run/nginx.pid
ConfigureExtra += --lock-path=$(LocalStateDir)/run/nginx.lck
ConfigureExtra += --with-ipv6 
ConfigureExtra += --with-http_ssl_module
## Currently file AIO is supported on FreeBSD 4.3+ and Linux 2.6.22+ only
#ConfigureExtra +=  --with-file-aio

# http://wiki.nginx.org/InstallOptions
# Valid for FreeBSD and MacOSX
ConfigureExtra += --with-ld-opt="-L /usr/local/lib"
ConfigureExtra += --with-cc-opt="-I /usr/local/include"

define install_post_hook
rm -f $(InstallDir)/$(SBinDir)/nginx.old
rm -f $(InstallDir)/$(SysConfDir)/nginx/{fastcgi.conf,fastcgi_params,mime.types,nginx.conf,scgi_params,uwsgi_params}
mv $(InstallDir)/$(DataDir)/nginx/html/index.html $(InstallDir)/$(DataDir)/nginx/html/index.html.default
mv $(InstallDir)/$(DataDir)/nginx/html/50x.html $(InstallDir)/$(DataDir)/nginx/html/50x.html.default
endef

define test_hook
$(BinDir)/nginx -v 2>&1 | grep $(Version)
endef
