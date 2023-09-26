require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'Eric', email: 'ericopokuantwi384@gmail.com', password: '123456')
  end
  describe 'GET /users' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
