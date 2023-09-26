require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :view do
  describe 'Testing groups index page' do
    before(:each) do
      @user = User.create(name: 'Hernán', email: 'hernanzamora1999@gmail.com', password: '123456')

      @group1 = Group.create(name: 'Food', user_id: @user.id, icon: 'image1.png')
      @group2 = Group.create(name: 'Bills', user_id: @user.id, icon: 'image2.png')
      @group3 = Group.create(name: 'Clothes', user_id: @user.id, icon: 'image3.png')

      assign(:groups, [@group1, @group2, @group3])

      render
    end

    it 'Check if the group have been added to the list' do
      expect(rendered).to have_content 'Food'
      expect(rendered).to have_content 'Bills'
      expect(rendered).to have_content 'Clothes'
    end
  end
end
