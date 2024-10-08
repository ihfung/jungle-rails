class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"] # This is a basic authentication method that Rails provides. It will prompt the user for a username and password before allowing them to access any actions in this controller. The username and password are stored in the environment variables USERNAME and PASSWORD, which are set in the .env file.
  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end


  private

  def category_params
   params.require(:category).permit(
      :name
    )
  end

end

# class Admin::CategoriesController < ApplicationController the < means that Admin::CategoriesController inherits from ApplicationController. This means that the Admin::CategoriesController will have all the methods and properties of ApplicationController.
