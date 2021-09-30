
`docker build . -t tensorflow-ovh:latest`

Testing

`docker run --rm -it --user=42420:42420 8080:8080 tensorflow-ovh:latest`
