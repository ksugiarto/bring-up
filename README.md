# Bring Up

Bring Up will helps you to save the H1, H2,and H3 contents from a URL.

Just Bring Up your URL and let it do the job for you. Using Rails and 
JSONAPI-Resources makes this package is so compact and simple.

## Installation

Prerequisites: [Node.js](https://nodejs.org/en/) (>= 5.2.2)

Clone the repo to your local machine using HTTPS:

```shell
git clone https://github.com/ksugiarto/bring-up.git
```

Or using SSL:

```shell
git clone git@github.com:ksugiarto/bring-up.git
```

Install all prerequisites gems:

```shell
bundle
```

Run DB Migrate:

```shell
rails db:migrate
```

Run the server:

```shell
rails s
```

## Usage

### Create new

Bring Up new URL and store the contents, using curl:

```shell
curl -X POST \
  http://localhost:3000/papers \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
  "data": {
    "type": "papers",
    "attributes": {
      "url": "http://jsonapi-resources.com/v0.9/guide/index.html"
    }
  }
}'
```

You can change the `url` data to any URL that you want it to be grabbed.

If you are using Postman, you can set new request with these steps:

1. Create new request with `POST` method to `localhost:3000/papers`.
2. Add headers `Content-Type` with value `application/vnd.api+json`.
3. Add body with **raw** type with value:

```json
{
  "data": {
    "type": "papers",
    "attributes": {
      "url": "http://jsonapi-resources.com/v0.9/guide/index.html"
    }
  }
}
```

4. Hit the Send button.

### List all previous contents

Using curl:

```shell
curl -X GET \
  'http://localhost:3000/papers?include=contents&fields%5Bpapers%5D=url&fields%5Bcontents%5D=paper,name,value' 
```

This will retrieve all urls and its contents. You can change the which fields
that you want to show with change the `fields` section.

If you are using Postman, you can set new request with these steps:

1. Create new request with `GET` method to:

```
localhost:3000/papers?include=contents&fields[papers]=url&fields[contents]=paper,name,value
```

2. Hit the Send button.

### Checking database

Bring Up using sqlite3 as the database, you need to install sqlite3 first,
then go inside to `/db` folder and run the database:

```shell
sqlite3 development.sqlite3
```

## License

MIT License

Copyright (c) 2019 Kristono Sugiarto

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.