require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'Eric', email: 'ericopokuantwi384@gmail.com', password: '123456')
    @group = Group.create(icon: 'icon.png', name: 'Group', user_id: @user.id)
    @entity = Entity.create(name: 'transaction', amount: '100', group_id: @group.id, user_id: @user.id,
                            author_id: @user.id)
  end

  describe 'Transaction validations' do
    it 'has valid attributes' do
      expect(@entity).to be_valid
    end

    it 'not valid without a name' do
      @entity.name = nil
      expect(@entity).to_not be_valid
    end

    it 'nont valid without a user' do
      @entity.user_id = nil
      expect(@entity).to_not be_valid
    end

    it 'not valid without an amount' do
      @entity.amount = nil
      expect(@entity).to_not be_valid
    end
  end
end
