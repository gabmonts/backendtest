class ListingsController < ApplicationController
  before_action :set_listing, only: [show, update, destroy]

  def index
    @listings = Listing.all
    render json: @listings
  end

  def show
    render json: @listings
  end

  def create
    @listing = Listing.create(params)
    render json: @listing
  end

  def update
    if @listing.update(params)
      render json: @Listing
    else
      render json: { error: 'Unable to update' }
    end
  end

  def destroy
    @listing.destroy
    render json: @listings
    redirect_to listings_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
