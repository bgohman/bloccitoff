require 'rails_helper'

RSpec.describe ItemsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:post, '/items').to('items#create', {}) } 
  it { should route(:delete, '/items/1').to('items#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:logged_in_user) }
  it { should use_before_filter(:correct_user) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end