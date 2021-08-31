module Api
  module V1
    class AuthenticationController < ApplicationController
      def create
       p params.inspect  
      end
    end
  end 
end