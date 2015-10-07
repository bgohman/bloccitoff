require 'rails_helper'

describe "Sign in flow" do

  describe "successful" do
    it "redirects to the topics index" do
      user = FactoryGirl.create(:user)
      visit root_path
      within '.navbar-right' do
        click_link 'Log in'
      end
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      within 'form' do
        click_button 'Log in'
      end
      expect(current_path).to eq root_path
    end
  end


end