require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: 'test', email: 'test@example.com', password: 'password')
  end

  describe 'validations' do
    it '@user is a valid user' do
      expect(@user).to be_valid
    end
    it 'is invalid without a name' do
      @user.name = ' '
      expect(@user).not_to be_valid
    end
    it 'is invalid with too long a name' do
      @user.name = 'a' * 66
      expect(@user).not_to be_valid
    end
    it 'is invalid without an email' do
      @user.email = ' '
      expect(@user).not_to be_valid
    end
    it 'is invalid with too long an email' do
      @user.email = 'a' * 244 + 'example.com'
      expect(@user).not_to be_valid
    end

    it "accepts valid email addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
    it "rejects invalid email addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
    it 'rejects duplicate email addresses' do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).not_to be_valid
    end
    it 'is invalid without a password' do
      @user.password = ' '
      expect(@user).not_to be_valid
    end

    it 'is invalid with too short a password' do
      @user.password = 'a' * 5
      expect(@user).not_to be_valid
    end

  end

  describe '#authenticated' do
    it 'returns false for a user with nil digest' do
      expect(@user.authenticated?(:remember, '')).to eq(false)
    end
  end

  describe '#downcase_email' do
  	it 'converts email addresses to all lowercase' do
      other_user = User.create(name: 'test', email: 'Test@eMail.com', password: 'password')
      expect(@user.downcase_email).to eq('test@example.com')
      expect(other_user.downcase_email).to eq('test@email.com')
  	end
  end

  describe '#remember' do
    it 'generates a remember token' do
      @user.remember
      expect(@user.remember_digest).to be_present
      expect(@user.remember_digest.length).to eq(60)
    end
  end

end