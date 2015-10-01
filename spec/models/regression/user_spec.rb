require 'rails_helper'

RSpec.describe User, regressor: true do

  # === Relations ===
  
  
  it { is_expected.to have_many :items }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :password_digest }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :remember_digest }
  it { is_expected.to have_db_column :activation_digest }
  it { is_expected.to have_db_column :activated }
  it { is_expected.to have_db_column :activated_at }
  it { is_expected.to have_db_column :reset_digest }
  it { is_expected.to have_db_column :reset_sent_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["email"] }

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(65)).for :name }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(66)).for :name }
  it { is_expected.to allow_value(Faker::Lorem.characters(255)).for :email }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(256)).for :email }
  it { is_expected.to allow_value(Faker::Lorem.characters(72)).for :password }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(73)).for :password }
  it { is_expected.to allow_value(Faker::Lorem.characters(6)).for :password }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(5)).for :password }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end