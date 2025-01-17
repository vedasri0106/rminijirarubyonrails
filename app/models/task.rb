# app/models/task.rb
class Task
    attr_accessor :id, :title, :description, :status, :project_id, :assigned_to_id
    STATUSES = ['to_do', 'in_progress', 'done']
  
    @@tasks = []
  
    def initialize(title, description, status, project_id, assigned_to_id)
      @id = SecureRandom.uuid
      @title = title
      @description = description
      @status = status
      @project_id = project_id
      @assigned_to_id = assigned_to_id
      @@tasks << self
    end
  
    def self.all
      @@tasks
    end
  
    def self.find(id)
      @@tasks.find { |task| task.id == id }
    end
  end  