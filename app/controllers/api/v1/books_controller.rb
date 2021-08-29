require 'net/http'
module Api 
  module V1  
   class BooksController < ApplicationController
      MAX_PAGINATION = 100
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
        uri = URI('http://localhost:4567/update_sku')
        req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        req.body = { sku: '123', name: book_params[:name]}.to_json
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
          params.fetch(:limit, MAX_PAGINATION).to_i,
          MAX_PAGINATION
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