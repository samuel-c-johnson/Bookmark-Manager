require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  has n, :links, through: Resource


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
