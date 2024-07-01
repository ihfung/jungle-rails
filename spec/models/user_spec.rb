require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.ca", password: "password", password_confirmation: "password")
  end

  describe 'Validations' do
    # validation examples here
    it "validates the user" do
      expect(@user).to be_valid
    end

    it "Invalid first name" do 
      @user.first_name = nil
      expect(@user).to be_invalid
    end

    it "Invalid last name" do
      @user.last_name = nil
      expect(@user).to be_invalid
    end

    it "Invalid email" do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it "Invalid password" do
      @user.password = nil
      expect(@user).to be_invalid
    end

    it "Invalid password confirmation" do
      @user.password_confirmation = nil
      expect(@user).to be_invalid
    end

    it "short password" do
      @user.password = "pass"
      expect(@user).to be_invalid
    end

    it "Invalid user with same email" do
      @user.save
      @user2 = User.new(first_name: "Jane", last_name: "Doe", email: "john@doe.ca", password: "password", password_confirmation: "password")
      expect(@user2).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "valid user" do
      @user.save
      expect(User.authenticate_with_credentials("john@doe.ca", "password")).to_not be_nil
    end

    it "valid user with whitespaces" do
      @user.save
      expect(User.authenticate_with_credentials("     john@doe.ca", "password")).to_not be_nil
    end
    
    it "valid user with different case" do
      @user.save
      expect(User.authenticate_with_credentials("John@Doe.Ca", "password")).to_not be_nil
    end
    
  end

end

