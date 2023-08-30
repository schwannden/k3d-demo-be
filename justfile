set dotenv-load

default:
    @just --list --unsorted

test:
  echo "version: $(poetry version -s)"

# build image
build:
  docker build . -f Dockerfile.prod -t "schwannden/k3d-demo-be:$(poetry version -s)"

# publish image
publish:
  docker push "schwannden/k3d-demo-be:$(poetry version -s)"

# start minio server
start:
  docker compose up -d

# stop minio server
stop:
  docker compose down

# restart minio server
restart: stop start