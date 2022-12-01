Use curl to send the following HTTP request:

Host: https://jsonplaceholder.typicode.com
Method: POST
Path: /todos
You should get the following response body:

{
  "id": 201
}

Solution:
```
curl -X POST https://jsonplaceholder.typicode.com/todos 
```