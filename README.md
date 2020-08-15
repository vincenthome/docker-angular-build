# Docker Multistage Angular App

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

* Run docker-compose 

  ```
  docker-compose up -d --build
  ```

  - `-d` detached without any activities info.

  - `--build` force a rebuilt of the images with any source changes.

* Run docker cli Build and Run.

  ```
  docker build --rm -t angular-cli-build:latest .

  docker run --rm -d -p 443:443 -p 8080:80 angular-cli-build:latest
  ```

* Misc

  - [multi-stage with chrome headless](https://mherman.org/blog/dockerizing-an-angular-app)
  - [Dockerizing an Angular App for Production](https://mherman.org/blog/dockerizing-an-angular-app)
  - [Publish & Run from DockerHub](https://medium.com/@DenysVuika/your-angular-apps-as-docker-containers-471f570a7f2)
  - [Configuration, Environment, Chrom headless](https://medium.com/@tiangolo/angular-in-docker-with-nginx-supporting-environments-built-with-multi-stage-docker-builds-bb9f1724e984)
  - [Puppeteer Tutroial](https://www.aymen-loukil.com/en/blog-en/google-puppeteer-tutorial-with-examples)
  - [Puppeteer Get Started](https://developers.google.com/web/tools/puppeteer)
  - [Puppeteer API](https://github.com/GoogleChrome/puppeteer)
  
  
  

