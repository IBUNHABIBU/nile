require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do 
 describe 'GET index' do
  it 'has max limit of 100 books' do
   expect(Book).to receive(:limit).with(100).and_call_original
   get :index, params: { limit: 999} 
  end
 end
  describe 'POST create' do 
   let(:book_name) { 'Harry porter' }
   let(:user) { create(:user) }
   before do 
    allow(AuthenticationTokenService).to receive(:decode).and_return(user.id)
   end
   it 'calls updateSkuJob with correct params' do
    expect(UpdateSkuJob).to receive(:perform_later).with(book_name)
    post :create, params: {
     author: { first_name: 'jk', last_name: 'rowling', age: 48 },
     book: { title: 'Harry porter' }
    } 
   end
  end
end