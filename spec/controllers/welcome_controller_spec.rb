require 'rails_helper'
require 'support/spec_test_helper'


RSpec.describe WelcomeController, type: :controller do
  before do
    @user = User.new(name: 'test', email: 'test@example.com', password: 'password')
    @item = @user.items.build
  end

  describe 'home' do
    it 'should get home and assign a user and item' do
      login_as(@user)
      get 'home'
      expect(response).to render_template(:home)
      #expect(assigns(:users)).to eq(@user)
      expect(@item).to be_a_new(Item)
    end
  end

  describe 'about' do
    it 'should get about' do
      get 'about'
      expect(response).to render_template(:about)
    end
  end


end