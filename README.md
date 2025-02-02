# Bredbandskollen
An easy way for you to measure your internet speed and to get help to improve it.
Created for users in Sweden.

## Function
This container returns a Json with current upload, download and latency
```json
{
  'Download': 208.99, 
  'Upload': 134.114, 
  'Ping': 15.4397
}
```

## run
```cmd
docker run --rm  --name bbk klaspihl/bbk_json
```