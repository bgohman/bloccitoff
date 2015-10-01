require 'rails_helper'

RSpec.describe PasswordResetsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/password_resets/new').to('password_resets#new', {}) }
  it { should route(:post, '/password_resets').to('password_resets#create', {}) } 
  it { should route(:get, '/password_resets/1/edit').to('password_resets#edit', {:id=>"1"}) }
  it { should route(:patch, '/password_resets/1').to('password_resets#update', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:get_user) }
  it { should use_before_filter(:valid_user) }
  it { should use_before_filter(:check_expiration) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end