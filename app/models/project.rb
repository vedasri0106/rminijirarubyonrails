# app/models/project.rb
class Project
    attr_accessor :id, :name, :description, :user_id, :tasks
    @@projects = []
  
    def initialize(name, description, user_id)
      @id = SecureRandom.uuid
      @name = name
      @description = description
      @user_id = user_id
      @tasks = []
      @@projects << self
    end
  
    def self.all
      @@projects
    end
  
    def self.find(id)
      @@projects.find { |project| project.id == id }
    end
  end  