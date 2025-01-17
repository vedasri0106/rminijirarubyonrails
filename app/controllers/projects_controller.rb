 # app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
    before_action :set_project, only: [:show]
  
    def index
      # Simulating projects in memory (no database)
      @projects = [
        { id: 1, name: "Project 1" },
        { id: 2, name: "Project 2" }
      ]
  
      # Simulating tasks in memory (no database)
      @tasks = [
        { id: 1, project_id: 1, title: "Task 1", status: "done" },
        { id: 2, project_id: 1, title: "Task 2", status: "pending" },
        { id: 3, project_id: 2, title: "Task 3", status: "done" }
      ]
    end
  
    def show
      # Simulating tasks in memory (no database)
      all_tasks = [
        { id: 1, project_id: 1, title: "Task 1", status: "done" },
        { id: 2, project_id: 1, title: "Task 2", status: "pending" },
        { id: 3, project_id: 2, title: "Task 3", status: "done" }
      ]
      # Fetch tasks related to the selected project
      @tasks = all_tasks.select { |task| task[:project_id] == @project[:id] }
    end
  
    private
  
    def set_project
      # Simulate fetching a project by ID
      @project = @projects.find { |project| project[:id] == params[:id].to_i }
    end
    
  end  