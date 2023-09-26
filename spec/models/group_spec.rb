require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'Eric', email: 'ericopokuantwi384@gmail.com', password: '123456')
    @group = Group.create(icon: 'icon.png', name: 'Food', user_id: @user.id)
  end

  describe 'Check group validations' do
    it 'has valid attributes' do
      expect(@group).to be_valid
    end

    it 'not valid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'not valid without an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'not valid without a user' do
      @group.user_id = nil
      expect(@group).to_not be_valid
    end
  end
end
