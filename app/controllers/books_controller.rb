class BooksController < ApplicationController
    def index 
      render json: Book.all 
    end 
    
    def create
       Book.create(title: "Jenefa", author: "deo")
    end
end
