# frozen_string_literal: true

source "https://rubygems.org"

gem "rails", github: "rails/rails", branch: "6-1-stable"

gem "ruby-lsp", require: false
platforms :ruby do
  gem "sqlite3"
end

# Require at least nokogiri 1.16.2 to avoid CVE-2024-25062
# https://github.com/advisories/GHSA-xc9x-jj77-9p9j
gem "nokogiri", ">= 1.16.2"

gemspec
