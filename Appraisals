# frozen_string_literal: true

appraise "rails-5.2-stable" do
  gem "rails", github: "rails/rails", branch: "5-2-stable"

  platforms :ruby do
    gem "sqlite3", "~> 1.3.6"
  end
end

appraise "rails-6.0-stable" do
  gem "rails", github: "rails/rails", branch: "6-0-stable"

  platforms :ruby do
    gem "sqlite3", "~> 1.4"
  end
end

appraise "rails-6.1-stable" do
  gem "rails", github: "rails/rails", branch: "6-1-stable"
  gem "rspec-rails", "~> 6.0"

  platforms :ruby do
    gem "sqlite3", "~> 1.4"
  end
end

appraise "rails-7.0-stable" do
  gem "rails", github: "rails/rails", branch: "7-0-stable"
  gem "responders", "~> 3.0"
  gem "rspec-rails", "~> 6.0"

  platforms :ruby do
    gem "sqlite3", "~> 1.4"
  end
end

appraise "rails-7.1-stable" do
  gem "rails", github: "rails/rails", branch: "7-1-stable"
  gem "responders", "~> 3.0"
  gem "rspec-rails", "~> 6.0"

  platforms :ruby do
    gem "sqlite3", "~> 1.4"
  end
end

appraise "rails-edge" do
  gem "rails", github: "rails/rails", branch: :main
  gem "responders", "~> 3.0"
  gem "rspec-rails", "~> 6.0"

  platforms :ruby do
    gem "sqlite3", "~> 1.4"
  end
end
