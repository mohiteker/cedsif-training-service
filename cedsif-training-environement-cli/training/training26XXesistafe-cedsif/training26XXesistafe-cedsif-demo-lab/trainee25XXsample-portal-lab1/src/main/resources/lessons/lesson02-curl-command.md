#1-Create object
curl --location --request POST 'http://localhost:8080/endpoint25xxdemo210/api/v25/login' \
--header 'Content-Type: application/json' \
--data-raw '{
    "user": {
      "username": "xxxxxxxxxx",
      "password": "xxxxxxxxxxx"
    }
}'

#2-Read object
