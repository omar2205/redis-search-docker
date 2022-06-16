# FROM redis/redis-stack:latest
FROM alpine

ARG REDISPASSWORD
ARG REDISHOST
ARG PORT
ARG REDISPORT
ARG REDISUSER

RUN apk add redis

EXPOSE $PORT

CMD ["sh", "-c", "redis-server", "--bind", "0.0.0.0", "--port", "$PORT", "--protected-mode", "no", "--loadmodule", "/usr/lib/redis/modules/redisearch.so", "--loadmodule", "/usr/lib/redis/modules/rejson.so"]
