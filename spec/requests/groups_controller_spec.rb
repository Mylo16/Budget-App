require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET /groups' do
    before(:example) { get('/groups') }
    it 'Returns http found' do
      expect(response).to have_http_status(:found)
    end
    it 'Should be redirected to sign_in' do
      expect(response).to redirect_to(new_user_session_path)
    end
    it 'Includes the correct placeholder text' do
      expect(response.body).to include 'redirected'
    end
  end
end
