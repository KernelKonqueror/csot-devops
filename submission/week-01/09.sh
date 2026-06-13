#!/usr/bin/env bash
set -euo pipefail
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /tmp/server.key -out /tmp/server.crt \
    -subj "/CN=localhost" 2>/dev/null

cat << 'EOF' > /tmp/nginx-test.conf
# Override PID and error log to a writable directory
pid /tmp/nginx.pid;
error_log /tmp/error.log;

events {}

http {
    # Override access log
    access_log /tmp/access.log;
    
    # Override temp paths to avoid permission denied errors
    client_body_temp_path /tmp/client_body;
    proxy_temp_path       /tmp/proxy_temp;
    fastcgi_temp_path     /tmp/fastcgi_temp;
    uwsgi_temp_path       /tmp/uwsgi_temp;
    scgi_temp_path        /tmp/scgi_temp;

    server {
        listen 8443 ssl;
        ssl_certificate /tmp/server.crt;
        ssl_certificate_key /tmp/server.key;

        location / {
            return 200 "HTTPS OK\n";
        }
    }
}
EOF

nginx -c /tmp/nginx-test.conf