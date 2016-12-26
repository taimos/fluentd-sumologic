# Logging docker to SumoLogic

## Create SumoLogic HTTP Collector

Create a new SumoLogic HTTP Collector and note the URL generated to send logs.

## Run Collector container

Build and run this image and expose the port 24224.

You have to export the endpoint and urltoken as environment variables

```
docker run --restart=always -p 24224:24224 --name sumologic -e SUMO_COLLECTOR=endpoint1.collection.eu.sumologic.com -e SUMO_URLTOKEN=SOMEBASE64STRING taimos/fluentd-sumologic
```

## Run application container 

You can now start your primary docker container with the following options:

```
docker run --log-driver fluentd --log-opt labels=app --label app=mysuper-server some-image:latest
```

This will log the Docker output to SumoLogic with _sourceName mysuper-server and the category you created with the HTTP collector