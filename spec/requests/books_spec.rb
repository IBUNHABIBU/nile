require 'rails_helper'

describe 'Books API', type: :request do 
    describe 'Get /books' do 
          let(:author) { create(:author) }
          let(:book) { build(:book) }
        it 'returns all book' do
            get '/api/v1/books'
            expect(response).to have_http_status(:success)
            expect(response.body.size).to eq(2)
        end
        it 'returns number of book' do
            get '/api/v1/books'
            expect(response.body.size).to eq(2)
        end
        it 'returns number of book' do
            get '/api/v1/books'
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    describe 'POST /books' do 
        it 'should create a new book' do
            post '/api/v1/books', params: { 
                book: { title: "Janware"},
            author: { first_name: "Jon", last_name: "doe"}
         }
            expect(response).to have_http_status(:created)
        end

        it 'should count no of books book' do
            expect{
              post '/api/v1/books', params: {
                  book: { title: "Janware"},
                  author: { first_name: "Jon", last_name: "doe"}
                 }
            }.to change { Book.count }.from(0).to(1)
        end
    end

    describe 'DELETE /books/:id' do 
        let(:book) { FactoryBot.create(:book, title: "Jononi oke") }
        let(:author) { FactoryBot.create(:author, first_name: "Msambwanda", last_name:"Mkubwa") }
        it 'should delete a selected book' do
            delete "/api/v1/books/#{book.id}"
            expect(response).to have_http_status(:no_content)
            puts "In this test the id #{book.id} is always generated randomly  at every test" 
        end

        # it 'should count no of books book' do
        #     expect{
        #         delete "/api/v1/books/#{book.id}"
        #     }.to change { Book.count }.from(1).to(0)
        # end
    end
end