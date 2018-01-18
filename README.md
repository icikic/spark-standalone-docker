# Spark-standalone-docker

Simple standalone Spark cluster 

## Prerequisites

Docker Compose 1.18.0 and compatible Docker engine

## Usage

Start cluster with 2 worker nodes

- ```docker-compose up -d --scale worker=2```

Start spark-shell session

- ```spark-compose exec master bin/spark-shell --master spark://master:7077```

Start spark-shell with additional libraries

- ```spark-compose exec master bin/spark-shell --master spark://master:7077 --jars /libs/foo.jar```


