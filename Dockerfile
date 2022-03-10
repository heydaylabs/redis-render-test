FROM redis:6-alpine
FROM redislabs/rejson:latest as rejson

ENV LD_LIBRARY_PATH /var/lib/redis/modules

COPY redis.conf .
COPY --from=rejson ${LD_LIBRARY_PATH}/*.so ${LD_LIBRARY_PATH}/

ENTRYPOINT ["redis-server", "./redis.conf"]
CMD ["--loadmodule", "/var/lib/redis/modules/rejson.so"]
