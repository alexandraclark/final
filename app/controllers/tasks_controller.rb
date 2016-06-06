class TasksController < ApplicationController
  def index
    @events = Event.all
  end
end
