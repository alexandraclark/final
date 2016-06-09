class SuppliesController < ApplicationController

  before_action :find_guests, only: [:new, :edit, :update]

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
          render 'layouts/no_supplies'
        end
      else
        render 'layouts/no_supplies'
      end
    else
      render 'layouts/no_supplies'
    end
  end

  def update
    @supply = Supply.find(params[:id])
    @event = Event.find_by(id: @supply.event_id)

    if params[:supply][:purchased] == "1"
      @supply.update(purchased: true)
    else
      @supply.update(purchased: false)
    end

    if !(params[:supply][:if_patch].nil?)
      @supply.title = params[:supply][:title]
      @supply.quantity = params[:supply][:quantity]
      @supply.price = params[:supply][:price]
      @supply.guest_id = params[:supply][:guest_id]
      @supply.purchase_url = params[:supply][:purchase_url]
      @supply.purchased = params[:supply][:purchased]
    end

    if @supply.save and !(params[:supply][:if_patch].nil?)
      redirect_to supplies_url
    elsif @supply.save
      redirect_to :back
    else
      render :edit
    end

  end

  def new
    @event = params[:event]
    @supply = Supply.new
  end

  def create
    @supply = Supply.new
    @supply.event_id = params[:supply][:event_id]
    @supply.title = params[:supply][:title]
    @supply.quantity = params[:supply][:quantity]
    @supply.price = params[:supply][:price]
    @supply.guest_id = params[:supply][:guest_id]
    @supply.purchase_url = params[:supply][:purchase_url]
    @supply.purchased = false

    if @supply.save
      redirect_to supplies_url, notice: "Supply added!"
    else
      find_guests
      @event = Event.find_by(:id => params[:supply][:event_id]).title
      params[:event_id] = params[:supply][:event_id]
      render 'new'
    end
  end

  def edit
    @supply = Supply.find_by(id: params[:id])
  end

  def destroy
    supply = Supply.find_by(id: params[:id])
    if supply
      supply.delete
    end
    redirect_to supplies_url
  end

end
