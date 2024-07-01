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

    it "validate first name is empty" do 
      @user.first_name = nil
      expect(@user).to be_invalid
    end

    it "validate last name is empty" do
      @user.last_name = nil
      expect(@user).to be_invalid
    end

    it "validate email is empty" do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it "validate password is empty" do
      @user.password = nil
      expect(@user).to be_invalid
    end

    it "validate password confirmation is empty" do
      @user.password_confirmation = nil
      expect(@user).to be_invalid
    end

    it "validate for short password" do
      @user.password = "pass"
      expect(@user).to be_invalid
    end

    it "validate different user using the same email" do
      @user.save # save the user
      @user2 = User.new(first_name: "Jane", last_name: "Doe", email: "john@doe.ca", password: "password", password_confirmation: "password")
      expect(@user2).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "validate user" do
      @user.save
      expect(User.authenticate_with_credentials("john@doe.ca", "password")).to_not be_nil
    end

    it "validate user with whitespaces" do
      @user.save
      expect(User.authenticate_with_credentials("     john@doe.ca", "password")).to_not be_nil
    end
    
    it "validate user with lower/upper case" do
      @user.save
      expect(User.authenticate_with_credentials("John@Doe.Ca", "password")).to_not be_nil
    end
    
  end

end

