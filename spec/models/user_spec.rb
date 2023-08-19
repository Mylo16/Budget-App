require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Eric', email: 'ericopokuantwi384@gmail.com', password: '123456')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end
end
