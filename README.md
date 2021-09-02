# Useful tips and commands

`rails g migration AddAuthorToBooks author:references  `

got to the add_author_to_books table and remove the null and foreign key

` add_reference :books, :author, null: false, foreign_key: true`

How to remove column to a table 

`rails g migration RemoveAuthorFromBooks author:string`

### key notes

I have learnt new concept which is controller representers

You can delete a factory and create your own factory

Model.inspect it gives all attributes of a model

`described_class.perform_now('eloquent ruby')`

`described_class.call('123')`

Another important tip I got is how to organize your test, controller test, request test, model test etc that is important, i.e the first describe block must mention the respective class eg model or controller

in request spec we test all the http request and expect responses 

### curl command

Our routes herer is resources :books
1. `curl http://localhost:3000/api/v1/books` list all books
2. `curl --request POST http://localhost:3000/api/v1/books -v` 
3. `curl --header "Content-Type: application/json" --request POST --data '{"author": "Jumanne", title: "Prince" }' http://localhost:3000/api/v1/books`
4. `curl --header "Content-Type: application/json" --request DELETE http://localhost:3000/api/v1/books/1 -v` 
5.  `curl -X POST http://localhost:3000/api/v1/authenticate -H "Content-Type: application/json" -d '{"username": "mrmisifa", "password": "123" }' -v` hit user to get token
