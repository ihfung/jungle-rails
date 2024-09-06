# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Visit `http://localhost:3000` in your browser

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- cypress

## Cypress Setup 
 1. Run `npm install cypress -v 12.17.4 --save-dev`
 2. Add and install the appropriate gems in the appropriate section:
    Gemfile:
        group :development, :test do
        gem "cypress-rails"
        gem 'database_cleaner-active_record'
    end
 3. Run bundle install
 4. Initialize cypress by `bin/rails cypress:init`
 5. Cypress and Rails integration
    In the config/initializers/ folder, create a file called cypress_rails.rb.
    Add the following code to the file:
    ```ruby

    require 'database_cleaner/active_record'
    DatabaseCleaner.strategy = :truncation

    return unless Rails.env.test?

    CypressRails.hooks.before_server_start do
    # Called once, before either the transaction or the server is started
    end

    CypressRails.hooks.after_transaction_start do
      # Called after the transaction is started (at launch and after each reset)
    end

    CypressRails.hooks.after_state_reset do
      # Triggered after `/cypress_rails_reset_state` is called
    end

    CypressRails.hooks.before_server_stop do
      # Called once, at_exit
    end
    ```
 6. Secrets
    Go to the config/secrets.yml file. You will notice you already have a secret token for the development environment. You will need the same for the test environment so that at the end your file will look something like this:
    ```yml
    development:
      secret_token: "my_secret_token"
      secret_key_base: "abcdef0123456789"

    test:
      secret_token: "my_secret_token"
      secret_key_base: "abcdef0123456789"
    ```
 7. Create Cypress Folder and Add Support File
    Create a cypress folder in the root of the project. Switch into the newly created directory and add 3 folders named e2e, fixtures and support. Inside the support folder, create a e2e.js file. Cypress looks for this file so, even though we don't need to put anything inside of it, we need to create it.

 8. run `bin/rails cypress:open` to open the cypress test runner