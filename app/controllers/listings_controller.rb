class ListingsController < ApplicationController
  before_filter :load_listing, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_logged_in, except: [:index, :show]
  before_filter :load_categories, only: [:new, :edit]

  def index
  	@listings = Listing.order(created_at: :desc).last(25)
  end

  def show
    if current_user && (current_user.id != @listing.user_id)
      @message = @listing.messages.build
    end
  end

  def new
  	@listing = Listing.new
  end

  def create
  	@listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

  	if @listing.save
  		redirect_to listings_path, notice: "Yay, listing added!"
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
    @listing.user_id = current_user.id

  	if @listing.update_attributes(listing_params)
  		redirect_to listing_path(@listing), notice: "Listing updated"
  	else
  		render :edit
  	end
  end

  def destroy
  	@listing.destroy
  	redirect_to listings_path
  end

  private
  def listing_params
    params[:listing][:price_in_cents] = ((params[:listing][:price_in_dollars]).to_f * 100).ceil
  	params.require(:listing).permit(:name, :description, :price_in_cents, :photo, :user_id, :category_id)
  end

  def load_listing
    @listing = Listing.find(params[:id])
  end

  def load_categories
    @categories = Category.all
  end
end
