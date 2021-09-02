require 'rails_helper'

describe 'Authentication', type: :request do 
  
  describe 'POST /authenticate' do 
    let(:user) { create(:user) }
   it 'authenticate the client' do
     post '/api/v1/authenticate', params: { username: user.username, password: '123'} 
     expect(response).to have_http_status(:created)
     expect(response_body).to eq({
       'token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w'
     })
   end

   it 'returns error when username is missing' do
    post '/api/v1/authenticate', params: { password: '123'} 
    expect(response).to have_http_status(:unprocessable_entity)
   end

   it 'returns error when username is missing' do
    post '/api/v1/authenticate', params: { username: 'mrmisifa' } 
    expect(response).to have_http_status(:unprocessable_entity)
   end

   it 'returns error when password is incorrect' do 
    
   end
  end
end