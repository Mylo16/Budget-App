require 'rails_helper'

RSpec.describe 'entities/index.html.erb', type: :system do
  before(:each) do
    driven_by(:rack_test)

    @user = User.create(name: 'Eric', email: 'ericopokuantwi384@gmail.com', password: '123456')

    @group1 = Group.create(name: 'Food', user_id: @user.id, icon: 'image1.png')

    @entity = Entity.create(name: 'transaction1', amount: '100', user_id: @user.id, group_id: @group1.id,
                            author_id: @user.id)

    visit new_user_session_path
    fill_in 'Email', with: 'ericopokuantwi384@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit group_entities_path(group_id: @group1.id)
  end

  describe 'entities page' do
    it 'Check if the group have been added to the list' do
      expect(page).to have_content 'transaction1'
      expect(page).to have_content 'Transactions'
    end

    it 'Check form fields' do
      click_link 'Add Transaction'
      expect(page).to have_css('form')
    end

    it 'check that form has an amount field' do
      click_link 'Add Transaction'
      expect(page).to have_css('input#entity_name')
    end
  end
end
