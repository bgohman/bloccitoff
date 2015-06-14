class Item < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(:created_at) }
  validates :user_id, presence: true
  validates :name, presence: true
end
