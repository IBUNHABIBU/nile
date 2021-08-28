# Useful tips and commands

`rails g migration AddAuthorToBooks author:references  `

got to the add_author_to_books table and remove the null and foreign key

` add_reference :books, :author, null: false, foreign_key: true`

How to remove column to a table 

`rails g migration RemoveAuthorFromBooks author:string`

I have learnt new concept which is controller representers

### curl command
1. `curl http://localhost:3000/api/v1/books` list all books

