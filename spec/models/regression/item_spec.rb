require 'rails_helper'

RSpec.describe Item, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :complete }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["user_id"] }
  it { is_expected.to have_db_index ["user_id", "created_at"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :name }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end