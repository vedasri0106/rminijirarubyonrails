 # app/models/user.rb
class User
    attr_accessor :id, :username, :email, :password
    @@users = []
  
    def initialize(username, email, password)
      @id = SecureRandom.uuid
      @username = username
      @email = email
      @password = password
      @@users << self
    end
  
    def self.all
      @@users
    end
  
    def self.find(id)
      @@users.find { |user| user.id == id }
    end
  
    def self.authenticate(email, password)
      user = @@users.find { |user| user.email == email }
      user if user && user.password == password
    end
  end  