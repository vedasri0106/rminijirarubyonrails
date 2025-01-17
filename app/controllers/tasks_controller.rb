# # app/controllers/tasks_controller.rb
# class TasksController < ApplicationController
#     def update
#       task = Task.find(params[:id])
#       task.status = params[:status]
      
#       if task.save
#         # Update task status using Turbo Stream
#         render turbo_stream: turbo_stream.replace("task_#{task.id}", partial: "tasks/task", locals: { task: task })
#       else
#         redirect_to project_path(task.project), alert: 'Error updating task'
#       end
#     end
#   end
# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append("tasks", partial: "tasks/task", locals: { task: @task })
          end
          format.html { redirect_to project_path(@task.project), notice: 'Task updated successfully.' }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title, :description, :status, :project_id, :assigned_to_id)
    end
  end

  