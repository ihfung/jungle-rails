class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"] # This is a basic authentication method that Rails provides. It will prompt the user for a username and password before allowing them to access any actions in this controller. The username and password are stored in the environment variables USERNAME and PASSWORD, which are set in the .env file.
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
