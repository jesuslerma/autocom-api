# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.7.1


* Database creation
```bash
$ rake db:create
```
* Database initialization
```bash
$ rake db:migrate
$ rake db:seed
```
* How to run the test suite
```
$ rspec
```
* Development Server
```bash
$ rails server
```

Once you have the development server, and whan to do **MANUAL TESTING** running you can run the following curls to start testing:

```bash
curl --request GET \
  --url http://localhost:3000/vehicles
```

```bash
curl --request GET \
  --url 'http://localhost:3000/vehicles?model_name=SONIC'
```

```bash
curl --request GET \
  --url 'http://localhost:3000/vehicles?model_name=SONIC&year=2021'
```

```bash
curl --request GET \
  --url 'http://localhost:3000/vehicles?model_name=SONIC&year=2021&rating=good'
```

```bash
curl --request GET \
  --url 'http://localhost:3000/vehicles?model_name=SONIC&year=2020'
```

```bash
curl --request POST \
  --url http://localhost:3000/vehicle_models \
  --header 'Authorization: Token token=TEST123' \
  --header 'Content-Type: application/json' \
  --data '{
  "name": "TRUCK",
  "brand": "TESLA",
  "market_price": 100000
}'
```

```bash
curl --request POST \
  --url http://localhost:3000/vehicles \
  --header 'Authorization: Token token=TEST123' \
  --header 'Content-Type: application/json' \
  --data '{
  "model": "TRUCK",
  "brand": "TESLA",
	"year": 1990,
  "price": 100000
}'
```
