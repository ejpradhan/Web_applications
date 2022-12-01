# POST /sort-names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

_Fill the table below with your own design._
|What does it do?|Method|Path|Query parameters?|Body parameters?|
|--|--|--|--|--|

* sorting the names in alphabetical order
* Method: POST
* Path: /sort-names
* query parameters: N/A
* body parameters: 
* names = Joe,Alice,Zoe,Julia,Kieran



## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._


When body param `names` is `Joe,Alice,Zoe,Julia,Kieran`
```
Alice,Joe,Julia,Kieran,Zoe
```

When body param `names` is `Kate, Daniel, Mike`
```
Daniel, Kate, Mike
```

## 3. Write Examples

_Replace these with your own design._

# 1 Request:

POST /sort-names

# with body parameters: 
names=Joe,Alice,Zoe,Julia,Kieran 

# Expected response:(list is sorted )
```
Alice,Joe,Julia,Kieran,Zoe
```
# 2 Request:
POST /sort-names

# with body parameters: 
names=Kate, Daniel, Mike

# Expected response:(list is sorted )
```
Daniel,Kate,Mike
```

 ## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'POST /sort-names' do
    it 'returns a string of 5 sorted names' do

      response = post('/sort-names, names: Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end

    it 'returns a string of 3 sorted names' do

      response = post('/sort-names, names: Kate,Daniel,Mike')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Daniel,Kate,Mike")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->