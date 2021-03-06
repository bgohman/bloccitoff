
  def is_logged_in?
    !session[:user_id].nil?
  end

  def login_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email: user.email,
                                  password: password,
                                  remember_me: remember_me }
    else
      session[:user_id] = user.id
    end
  end

  # Returns true inside an integration test.
  def integration_test?
    defined?(post_via_redirect)
  end