module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing 
      def create
       p params.require(:username).inspect 
       user = User.find_by(params.require(:password))
       render json: { token: '123'}, status: :created 
      end

      private 

      def parameter_missing(e)
       render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end 
end