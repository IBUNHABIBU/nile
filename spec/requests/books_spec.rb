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
        
    end
end