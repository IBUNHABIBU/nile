require 'rails_helper'

describe 'Books API', type: :request do 
    describe 'Get /books' do 
        
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
        
            FactoryBot.create(:book, title: "Jon oke", author: "Majuto")
            FactoryBot.create(:book, title: "Manjegeka", author: "Imma")
            get '/api/v1/books'
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    describe 'POST /books' do 
        it 'should create a new book' do
            post '/api/v1/books', params: {book: { title: "Janware", author: "Denis"} }
            expect(response).to have_http_status(:created)
        end

        it 'should count no of books book' do
            expect{
              post '/api/v1/books', params: {book: { title: "Janware", author: "Denis"} }
            }.to change { Book.count }.from(0).to(1)
        end
    end

    describe 'DELETE /books/:id' do 
        let(:book) { FactoryBot.create(:book, title: "Jononi oke", author: "Maajuto") }
        it 'should delete a selected book' do
            delete "/api/v1/books/#{book.id}"
            expect(response).to have_http_status(:no_content)
            puts "In this test the id #{book.id} is always generated randomly  at every test" 
        end

        it 'should count no of books book' do
            expect{
              post '/api/v1/books', params: {book: { title: "Janware", author: "Denis"} }
            }.to change { Book.count }.from(0).to(1)
        end
    end
end