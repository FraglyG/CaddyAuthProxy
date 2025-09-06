FROM caddy:2-alpine
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80

ENV API_KEY=""
ENV TARGET_DOMAIN="localhost"
ENV TARGET_PORT="8080"
ENV PORT="80"

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/health || exit 1

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]