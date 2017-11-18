FROM alpine
RUN apk add --no-cache ca-certificates
COPY rabbit-api /rabbit-api
EXPOSE 80
ENTRYPOINT ["/rabbit-api"]

