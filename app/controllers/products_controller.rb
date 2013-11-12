class ProductsController < ApplicationController
  before_filter :load_product, only: [:show, :edit, :update, :destroy]

  def index
  	@products = Product.all
  end

  def show
    if current_user
      @review = @product.reviews.build
    end
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path, notice: "Yay, product added!"
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product), notice: "Product updated"
  	else
  		render :edit
  	end
  end

  def destroy
  	@product.destroy
  	redirect_to products_path
  end

  private
  def product_params
    params[:product][:price_in_cents] = ((params[:product][:formatted_price]).to_f * 100).ceil
  	params.require(:product).permit(:name, :description, :price_in_cents, :photo)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
