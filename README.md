# Create Image angular-cli-build:latest

## Angular CLI with Docker

I ran `ng new myapp` to generate the app. Then added the following files:

```bash
.dockerignore
docker-compose.yml
docker-compose.debug.yml
Dockerfile
nginx.conf
```

## Update angular.json 's outputPath

```
"outputPath": "dist",
```

## Running

* Run docker cli Build and Run.

  ```
  docker build --rm -t angular-cli-build:latest .

  docker run --rm -d -p 443:443 -p 8080:80 angular-cli-build:latest
  ```

* Run docker-compose 

  ```
  docker-compose up -d --build
  ```

  - `-d` detached without any activities info.

  - `--build` force a rebuilt of the images with any source changes.

