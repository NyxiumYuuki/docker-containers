Build
`docker build . -t tensorflow-ovh:latest`

Testing
`docker run --rm -it --user=42420:42420 -p 8080:8080 ghcr.io/nyxiumyuuki/tensorflow-ovh:latest`
