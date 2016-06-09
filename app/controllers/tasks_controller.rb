class TasksController < ApplicationController

  before_action :find_guests, only: [:new, :edit]

  def find_guests
    user = User.find_by(id: session[:user_id])
    if user
      guest_status = Guest.find_by(id: user.guest_id)
      if guest_status
        invitations = Invitation.where(guest_id: guest_status.id).pluck("event_id")
        all_invitations = Invitation.where(event_id: invitations).pluck("guest_id")
        @guests = Guest.where(id: all_invitations)
      end
    end
  end

  def index
    user = User.find_by(id: session[:user_id])
    if user
      guest_status = Guest.find_by(id: user.guest_id)
      if guest_status
        invitations = Invitation.where(guest_id: guest_status.id).pluck("event_id")
        @events = Event.where(id: invitations)
        if @events.length == 0
          render 'layouts/no_tasks'
        end
      else render 'layouts/no_tasks'
      end
    else
      render 'layouts/no_tasks'
    end
  end

  def new
    @task = Task.new
    @event = params[:event]
    @event_id = params[:event_id]
  end

  def update
    @task = Task.find(params[:id])

    if !(params[:task][:if_patch].nil?)
      @task.item = params[:task][:item]
      if !@task.due_date.nil?
        @task.due_date = params[:task][:due_date]
      end
      @task.tag = params[:task][:tag]
      @task.guest_id = params[:task][:guest_id]
    end

    if params[:task][:completed] == "1"
      @task.update(completed: true)
    else
      @task.update(completed: false)
    end

    if @task.save and !(params[:task][:if_patch].nil?)
      redirect_to tasks_url
    elsif @task.save
      redirect_to :back
    else
      render :edit
    end

  end

  def create
    @task = Task.new
    @task.list_id = params[:task][:list_id]
    @task.item = params[:task][:item]
    if !params[:task][:due_date].empty?
      @task.due_date = params[:task][:due_date]
    end
    @task.tag = params[:task][:tag]
    @task.guest_id = params[:task][:guest_id]
    @task.completed = false
    @task.completed_date = nil
    if @task.save
      redirect_to tasks_url, notice: "Task added!"
    else
      find_guests
      @event = Event.find_by(:id => params[:task][:event_id]).title
      list = List.find_by(:id => params[:task][:list_id]).event_id
      params[:event_id] = Event.find_by(id: list)
      render 'new'
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def destroy
    task = Task.find_by(id: params[:id])
    if task
      task.delete
    end
    redirect_to tasks_url
  end

end
