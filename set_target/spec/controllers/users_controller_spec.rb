require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders new users template' do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do

    context 'with valid params' do
      it 'signs the user in' do
        post :create, params: {user: {username: 'John', password: 'jjjjjj'}}
        user = User.find_by(username: 'John')
        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context 'with invalid params' do
      it 'prints error messages' do
        post :create, params: {user: {username: 'John', password: ''}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

end
