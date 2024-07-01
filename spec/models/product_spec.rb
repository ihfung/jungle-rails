require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
   
    # it 'all values are validated' do
    #  @category = Category.new(name: "Books")
    #   @product = Product.new(name: "A letter from an alien", price_cents: 1000, quantity: 2, category: @category)
    #   expect(@product).to be_valid
    #   expect(@product.errors.full_messages).to be_empty
    # end

    # # validate :name presence true
    # it 'Product is invalid' do
    #   @category = Category.new(name: "Electronics")
    #   @product = Product.new(name: nil, price_cents: 1000, quantity: 2, category: @category)
    #   expect(@product).to be_invalid
    #   expect(@product.errors.full_messages).to include("Name can't be blank")
    # end
    # # validate :price presence true
    # it 'validate price presence' do
    #   @category = Category.new(name: "Cards")
    #   @product = Product.new(name: 'Pokemon', price_cents: nil, quantity: 10, category: @category)
    #   expect(@product).to be_invalid
    #   expect(@product.errors.full_messages).to include("Price can't be blank")
    # end 
    # # validate :quantity presence true
    # it 'validate quantity presence' do
    #   @category = Category.new(name: "Apple")
    #   @product = Product.new(name: 'IPhone', price_cents: 140000, quantity: nil, category: @category)
    #   expect(@product).to be_invalid
    #   expect(@product.errors.full_messages).to include("Quantity can't be blank")
    # end
    # # validate :category presence true
    # it 'validate category presence' do
    #   @category = Category.new(name: "Kpop")
    #   @product = Product.new(name: 'NewJeans', price_cents: 140000, quantity: 5, category: nil)
    #   expect(@product).to be_invalid
    #   expect(@product.errors.full_messages).to include("Category can't be blank")
    # end
  end
end
