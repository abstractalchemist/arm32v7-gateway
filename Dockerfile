FROM arm32v6/alpine
RUN apk update --no-cache && \
    apk add --no-cache nginx && \
    adduser -D -u 1000 -g 'www' www && \
    mkdir /www /run/nginx && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    ln -sf /dev/stdout /var/log/nginx/access.log
ADD default.conf /etc/nginx/conf.d


EXPOSE 80

CMD ["nginx", "-g", "daemon off; "]