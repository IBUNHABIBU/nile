# Useful tips and commands

`rails g migration AddAuthorToBooks author:references  `

got to the add_author_to_books table and remove the null and foreign key

` add_reference :books, :author, null: false, foreign_key: true`

How to remove column to a table 

`rails g migration RemoveAuthorFromBooks author:string`



