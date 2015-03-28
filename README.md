# Todo API
[![Build Status](https://travis-ci.org/philcallister/grape-rack-roar-swagger.svg?branch=master)](https://travis-ci.org/philcallister/grape-rack-roar-swagger)
[![Code Climate](https://codeclimate.com/github/philcallister/grape-rack-roar-swagger/badges/gpa.svg)](https://codeclimate.com/github/philcallister/grape-rack-roar-swagger)

This is an example application showing how to use
[grape](https://github.com/intridea/grape) on Rack to create a simple API using
[ROAR](https://github.com/apotonick/roar) along with [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger).
This sample shows how to create a simple API without authentication, caching, etc.

## Environment

The sample was developed using the following 

1. JRuby 1.17.19
2. OS X 10.10.2
3. Rack
3. grape
4. ROAR
5. grape-swagger 

## Setup

Gem installation

```bash
bundle install --path .bundle/gems --binstubs .bundle/bin
```

Create and migrate

```bash
bundle exec rake db:migrate
bundle exec rake db:migrate RACK_ENV=test
```

Seed data

```bash
bundle exec rake db:seed
```

## Testing

```bash
bundle exec rake spec
```

## Run It

Start the server

```bash
bundle exec puma
```

## Usage

Getting all todos

```bash
curl -i http://localhost:9292/v1/todos
```

Getting all todos (include todo items)

```bash
curl -i http://localhost:9292/v1/todos?type=all
```

Getting a single todo

```bash
curl -i http://localhost:9292/v1/todos/1
```

Getting a single todo (include todo items)

```bash
curl -i http://localhost:9292/v1/todos/1?type=all
```

Getting the items for a todo

```bash
curl -i http://localhost:9292/v1/todos/1/items
```

Failure to get an item

```bash
curl -i http://localhost:9292/v1/items/999
```

Update a binary file

```bash
curl -X POST -i -F binary_file=@packers.png http://localhost:9292/v1/binary
```

## Swagger Support
First, install [Swagger UI](https://github.com/wordnik/swagger-ui) somewhere locally.

```bash
git clone https://github.com/wordnik/swagger-ui.git
```

Make sure the Rails server is running

```bash
bundle exec puma
```

From Chrome or Safari, open the locally installed Swagger __swagger-ui/dist/index.html__ file.  In the text
field that currently lists __http://petstore.swagger.wordnik.com/api/api-docs__, change this to
__http://localhost:9292/swagger_doc__

From here, you'll be able to explore the API through the Swagger UI.
