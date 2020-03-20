SRC=/home/src
NGINX=nginx-1.17.9
PHP=php-7.4.4
GEOIP=geoip-1.1.1
IMAGICK=imagick-3.4.4

wget -qO- https://nginx.org/download/$NGINX.tar.gz | tar -zx -C $SRC
cd $SRC/$NGINX
#grep 'nginx/' src/core/*
sed -i 's!nginx/!lzx/!' src/core/nginx.h
#grep 'Server: nginx' src/http/*
sed -i 's!Server: nginx!Server: lzx!' src/http/ngx_http_header_filter_module.c
#grep 'nginx' src/http/*
sed -i 's!<center>nginx</center>!<center>lzx</center>!' src/http/ngx_http_special_response.c


wget -qO- https://www.php.net/distributions/$PHP.tar.gz | tar -zx -C $SRC
cd $SRC/$PHP/ext
wget -qO- https://pecl.php.net/get/$GEOIP.tgz | tar -zx && mv $GEOIP geoip
wget -qO- https://pecl.php.net/get/$IMAGICK.tgz | tar -zx && mv $IMAGICK imagick
