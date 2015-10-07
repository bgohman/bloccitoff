RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods
  #After calling FactoryGirl.lint, you'll likely want to clear out the database, as built factories will
  #create associated records. The provided example above uses the database_cleaner gem to clear out the
  #database; be sure to add the gem to your Gemfile under the appropriate groups.
  #config.before(:suite) do
  #  begin
  #    DatabaseCleaner.start
  #    FactoryGirl.lint
  #  ensure
  #    DatabaseCleaner.clean
  #  end
  #end

end