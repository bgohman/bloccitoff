require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
  	u = User.create(name: 'test', email: 'test@email.com', password: 'password')
  	@item = u.items.create(name: 'write tests')
  end
  describe '#days_left' do
  	it 'returns 7 for a new task' do
  	  expect(@item.days_left).to eq(7)
  	end

  	it 'returns the number of days left before task deletion' do
  	  @item.update_attributes(created_at: Time.zone.today - 3.days)
  	  expect(@item.days_left).to eq(4)
  	end
  end
end