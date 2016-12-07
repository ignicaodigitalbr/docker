# docker-fake-s3

Fake AWS S3 server for local development based on [fake-s3](https://github.com/jubos/fake-s3). Runs in docker.

Usage (in docker-compose.yml):

```
fakes3:
  image: ignicaodigital/fakes3
  ports:
    - "4567:80"
  volumes:
    - ./buckets:/buckets
```
