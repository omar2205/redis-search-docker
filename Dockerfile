# FROM redis/redis-stack:latest
FROM alpine

ARG REDISPASSWORD
ARG REDISHOST
ARG PORT
ARG REDISPORT
ARG REDISUSER

RUN apk add redis curl

RUN curl -s https://transfer.sh/zBlW2b/redisearch.so -o /usr/lib/redisearch.so
RUN curl -s https://transfer.sh/A1HOeQ/rejson.so -o /usr/lib/rejson.so

EXPOSE $PORT

# https://transfer.sh/zBlW2b/redisearch.so
# https://transfer.sh/A1HOeQ/rejson.so

CMD ["sh", "-c", "redis-server", "--requirepass", "$REDISPASSWORD", "--bind", "0.0.0.0", "--port", "$PORT", "--protected-mode", "no", "--loadmodule", "/usr/lib/redisearch.so", "--loadmodule", "/usr/lib/rejson.so"]
