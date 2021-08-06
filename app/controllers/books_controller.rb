class BooksController < ApplicationController
    rescue_from ActiveRecord::RecordNotDestroyed
    def index 
      render json: Book.all 
    end 
    
    def create
    #    book = Book.new(title: params[:title], author: params[:author])
       book = Book.new(book_params)
       if book.save 
        render json: book, status: :created 
       else 
        render json: book.errors, status: :unproccessable_entity 
       end
    end

    def destroy
      Book.find(params[:id]).destroy!
      head :no_content 
      rescue ActiveRecord::RecordNotDestroyed 
        render json: {}, status: :unproccessable_entity
    end

    private 

    def book_params
        params.require(:book).permit(:title, :author)
    end
end
