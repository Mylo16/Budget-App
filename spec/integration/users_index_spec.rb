require 'rails_helper'

RSpec.describe 'users index', type: :system do
  before(:each) do
    driven_by(:rack_test)

    @user = User.create(name: 'Hernán Zamora', email: 'hernanzamora1999@gmail.com', password: '123456')

    visit root_path
  end

  describe 'User index page' do
    it 'Shows the content' do
      expect(page).to have_content('Budget App')
    end
  end
end
