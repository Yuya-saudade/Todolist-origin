class TasksController < ApplicationController
  before_action :authenticate_user

  def index
    @tasks = Task.all
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @task = Task.create(content: params[:content],memo: params[:memo],project: "inbox",user_id: @current_user.id)
    if @task.save
      flash[:notice] = "タスクを追加しました"
      redirect_to("/tasks/index")
    else
      @task.errors_full_messages.each do |message|
        flash[:notice] = message
      end
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
    @task.content = params[:content]
    @task.memo = params[:memo]
    @task.project = params[:project]
    @task.save
    if @task.save
      flash[:notice] = "変更を保存しました"
      redirect_to("/tasks/index")
    else
      @task.errors_full_messages.each do |message|
        flash[:notice] = message
      end
      redirect_to("/tasks/index")
    end
  end

  def completed
    @task = Task.find_by(id: params[:id])
    @task.project = "completed"
    @task.save
  end
end
