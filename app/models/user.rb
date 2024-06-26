class User < ActiveRecord::Base

  has_secure_password

  # Validation for the user model to ensure all fields are filled in
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # Method to authenticate user which is called in the sessions controller and then in the login view to authenticate the user
  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase) #change the email to lowercase and remove any whitespaces and then match it with the email in the database
    if user && user.authenticate(password) #if the user exists and the password is correct then return the user and user.authenticate comes from the has_secure_password method
      user
    else
      nil
    end
  end
end