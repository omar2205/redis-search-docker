FROM redis/redis-stack:latest
# FROM alpine

ARG REDISPASSWORD
ARG REDISHOST
ARG PORT
ARG REDISPORT
ARG REDISUSER

# RUN apk add redis curl

# RUN curl -s https://transfer.sh/zBlW2b/redisearch.so -o /usr/lib/redisearch.so
# RUN curl -s https://transfer.sh/A1HOeQ/rejson.so -o /usr/lib/rejson.so

EXPOSE $PORT
EXPOSE $REDISPORT

# https://transfer.sh/zBlW2b/redisearch.so
# https://transfer.sh/A1HOeQ/rejson.so

COPY redis.conf /redis/etc/redis.conf

# CMD ["sh", "-c", "redis-server", "--requirepass", "$REDISPASSWORD", "--bind", "0.0.0.0", "--port", "$PORT", "--protected-mode", "no", "--loadmodule", "/usr/lib/redis/modules/redisearch.so", "--loadmodule", "/usr/lib/redis/modules/rejson.so"]
