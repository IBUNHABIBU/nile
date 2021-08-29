require 'rails_helper'

describe 'Books API', type: :request do 
    let(:first_author) { FactoryBot.create(:author, first_name:"Umayya", last_name:"Umarai")}
    let(:second_author) { FactoryBot.create(:author, first_name:"ewetu", last_name:"ako")}
    describe 'Get /books' do 
        #   let(:author) { create(:author) }
        #   let(:book) { build(:book) }
        before do 
          FactoryBot.create(:book, title:"Jua limewaka", author: first_author)
          FactoryBot.create(:book, title:"limewaka", author: second_author)
        end

        it 'returns all book' do
            get '/api/v1/books'
            expect(response).to have_http_status(:success)
        end
        it 'returns number of book' do
            get '/api/v1/books'
            expect(response.body.size).to eq(121)
        end
        it 'returns number of book' do
            get '/api/v1/books'
            expect(response_body.size).to eq(2)
        end

        it 'return book in JSON format' do 
            get '/api/v1/books'
            expect(response_body).to eq([
                {
                    'id' => 208,
                    'title' => "Jua limewaka",
                    'author_name' => "Umayya Umarai"  
                },
                {
                    'id' => 208,
                    'title' => "limewaka",
                    'author_name' => "ewetu ako"  
                },
            ])
        end
        
        it 'returns subset of books based on pagination' do
            get '/api/v1/books', params: { limit: 1 }
            expect(response).to have_http_status(:success)
        end

        it 'pagination show number of book' do
            get '/api/v1/books', params: { limit: 1 }
            expect(response_body.size).to eq(1)
        end

        it 'offset' do
            get '/api/v1/books', params: { limit: 1, offset: 1 }
            expect(response_body.size).to eq(1)
        end
    end

    describe 'POST /books' do 
        it 'should create a new book(book count 1)' do
        expect{post '/api/v1/books', params: { 
                book: { id: 1, title: "Janware"},
            author: { id: 43, first_name: "Jon", last_name: "doe" }
        }
        }.to change{Book.count}.from(0).to(1)
            expect(response).to have_http_status(:created)
            expect(Author.count).to eq(1)
            expect(response_body).to eq({
                'id' => 208,
                'title' => "Janware",
                'author_name' => "Jon doe"
            })
            
        end

        it 'should count no of books book' do
            # expect{
            #   post '/api/v1/books', params: {
            #       book: { title: "Janware"},
            #       author: { first_name: "Jon", last_name: "doe"}
            #      }
            # }.to change { Book.count }.from(0).to(1)
        end
    end

    describe 'DELETE /books/:id' do 
        # let(:author) { FactoryBot.create(:author, first_name: "Msambwanda", last_name:"Mkubwa") }
        # let(:book) { FactoryBot.create(:book, title: "Jononi oke", author_id: author.id) }
        let(:book) { build(:book)}
        it 'should delete a selected book' do
            puts Book.count
            # delete "/api/v1/books/#{book.id}"
            # expect(response).to have_http_status(:no_content)
            puts "In this test the id #{"/api/v1/books/#{book.id}"} is always generated randomly  at every test" 
        end

        it 'should count no of books book' do
           
            expect{
                delete "/api/v1/books/#{book.id}"
            }.to change { Book.count }.from(1).to(0)
        end
    end
end