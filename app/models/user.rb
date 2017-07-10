class User < ApplicationRecord
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # To validate username
  # For example, if my username is equal to your email I'm not
  # allowed to choose this username as my username and that means the username must be unique.
  # However, note that relying ONLY on this second validation still allows a user to choose someone
  # else's valid email address as a username, as long as that email is not yet associated with an
  # account. This should therefore be used only as a backup validation.
  validate :validate_username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
