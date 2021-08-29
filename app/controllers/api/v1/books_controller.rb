require 'net/http'
module Api 
  module V1  
   class BooksController < ApplicationController
      def index 
        books = Book.limit(limit).offset(params[:offset]) 
        render json: BooksRepresenter.new(books).as_json
      end 
      
      def create
        author = Author.create!(auther_params)
        #  book = Book.new(title: params[:title], author: params[:author])
        book = Book.new(book_params.merge(author_id: author.id))
        # UpdateSkuJob.perform_later(book_params[:name])
       
        # raise 'exit'

        if book.save 
          render json: BookRepresenter.new(book).as_json, status: :created 
        else 
          render json: book.errors, status: :unproccessable_entity 
        end
      end

      def destroy
        Book.find(params[:id]).destroy!
        head :no_content 
      end

      private 

      def limit 
        [
          params.fetch(:limit, 100).to_i,
          100
        ].min
      end

      def book_params
        params.require(:book).permit(:title)
      end

      def auther_params
        params.require(:author).permit(:first_name, :last_name)
      end
    end
  end
end