require 'rails_helper'

RSpec.describe 'Entity', type: :request do
  before(:example) do
    @user = User.create(name: 'Eric', email: 'ericopokuantwi384gmail.com', password: '123456')
    @group = Group.create(icon: 'icon.png', name: 'Group', user_id: @user.id)
    @entity = Entity.create(name: 'Transaction', amount: '100', group_id: @group.id, user_id: @user.id)
  end

  describe 'GET /entities' do
    before(:example) { get('/groups/1/entities') }
    it 'returns http found' do
      expect(response).to have_http_status(:found)
    end
    it 'should be redirected to sign_in' do
      expect(response).to redirect_to(new_user_session_path)
    end
    it 'includes the correct placeholder text' do
      expect(response.body).to include 'redirected'
    end
  end
end
