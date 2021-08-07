class BooksRepresenter 
    def initialize(books)
        @books = books 
    end

    def as_json 
        books.map do |book|
            {
               id: book.id,
               title: book.title,
               author_first_name: book.author.first_name, 
               author_last_name: book.author.last_name,
            }
        end
    end
    private 

    attr_reader :books 
   
end