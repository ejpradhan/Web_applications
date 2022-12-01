# REST routing

# Albums resoucre

## List all albums

```
#1 Request:
GET  /albums

Response: (200 OK):
A list of albums

``` 

## Find a specific album
```
#2 Request:
GET  /albums/:id

Response: (200 OK):
A specific album
```

## Create a new album
```
#3  Request:
POST  /albums

With body parameters:
title="OK, Computer"
release_year="1997"
artist_id="5"

Response: (200 OK):
No content, creates the new resource (the new album)

```