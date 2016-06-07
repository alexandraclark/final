class SuppliesController < ApplicationController

  def index
    user = User.find_by(id: session[:user_id])
    if user
      guest_status = Guest.find_by(id: user.guest_id)
      invitations = Invitation.where(guest_id: guest_status.id).pluck("event_id")
      @events = Event.where(id: invitations)
    else
      render 'layouts/no_supplies'
    end
  end

  def update
    @supply = Supply.find(params[:id])

    if params[:supply][:purchased] == "1"
      @supply.update(purchased: true)
    else
      @supply.update(purchased: false)
    end

    redirect_to supplies_url
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
      render 'new'
    end
  end

  def edit
    @supply = Supply.find_by(id: params[:id])
  end

  def update
    @supply = Supply.find(params[:id])

    if params[:supply][:if_patch]
      @supply.title = params[:supply][:title]
      @supply.quantity = params[:supply][:quantity]
      @supply.price = params[:supply][:price]
      @supply.guest_id = params[:supply][:guest_id]
      @supply.purchase_url = params[:supply][:purchase_url]
      @supply.purchased = params[:supply][:purchased]
    end

    if params[:supply][:purchased] == "1"
      @supply.update(purchased: true)
    else
      @supply.update(purchased: false)
    end

    redirect_to supplies_url
  end

  def destroy
    supply = Supply.find_by(id: params[:id])
    if supply
      supply.delete
    end
    redirect_to supplies_url
  end

end
