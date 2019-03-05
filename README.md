# README

## SUBSCRIPTION API

This is an API developed as a recruitment exercise.
It serves as an internal API that recieves subscription requestes and processes them through an external payment gateway.
Once the payment is succesfull, the subscrption & customer can be created.
The API renders messages that can be used to build a frontend of the subsription system.

### Ruby version
ruby 2.5.3p

### Rails version
Rails 5.2.2

### Databse
The default rails database - Sqlite, to avoid any complications while cloning.

### Gems used

Additional gems used:

- gem 'dotenv-rails' to encrypt the API token

- gem 'attr_encrypted' to encrypt the customers tokens

- gems: 'rspec-rails', 'factory_bot_rails','shoulda-matchers', 'faker', 'database_cleaner' for testing.


### Installation

1. Clone respected git repository

2. Install all dependencies

3. bundle install

4. Create db and migrate schema

5. **Run db seeds** for the plans to be present in the db

6. set your API key (token) in the .env file (please see .env-example).


### Use

1. run the server

2. send JSON request

- **example request with curl:**

```
curl -X POST

-H "Content-Type: application/json"

-d '{"subscription_request": {"name": "test", "address": "TestAdress", "zipcode": "10045", "card_num": "4242424242424242", "expiration": "2021-03-03 00:58:14 +0100", "cvv": "123", "billing_zip": "10045", "plan_id": "4"}}' 

localhost:3000/subscription_requests
```
- You will get a response with JSON informing whether the request was succesful & the subscripion was created or an error explaining what went wrong on the way.


### Security

For better security, the customers tokens recieved from the payment gateway are encrypted before saving in db.
Credit Card numbers are not stored and they are filtered from showing in the logs as well.


### To do's:

* Requests specs

* Moving the creation of a subscription to a Service Object

* Allowing multiple subscriptions for one user

* Add transaction to avoid charging while not making subscription 


