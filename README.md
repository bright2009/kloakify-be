# kloakify-be
Backend for Kloakify

## Setup
1. Rails Version: 7.1.3
2. Ruby Version: 3.2.2

## Installation
1. Clone the repo
2. Run `bundle install`
3. Run `rails db:create`
4. Run `rails db:migrate`
6. Run `rails s`

## Testing with Postman or Thunder Client
1. Open Postman or Thunder Client
2. Create a new request
3. Set the request type to `POST`
4. Set the request URL to `http://localhost:3000/api/v1/sign_up`
5. Set the request body to `raw` and `JSON`
6. Add the following JSON to the request body:
```
{
  "user": {
    "email": "kloakifyuser@gmail.com",
    "password":"password"
  }
}
```


