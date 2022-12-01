Use curl to send the following HTTP request:

Host: https://jsonplaceholder.typicode.com
Method: GET
Path: /todos/12
You should get the following response body:

{
  "userId": 1,
  "id": 12,
  "title": "ipsa repellendus fugit nisi",
  "completed": true
}
Solution
```
curl -X GET https://jsonplaceholder.typicode.com/todos/12
```