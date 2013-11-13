class ReviewsController < ApplicationController
	before_filter :load_product
	before_filter :ensure_logged_in

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to product_path(@product), :notice => "Message posted"
  	else
  		render :action => :show
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
    redirect_to product_path(@product), notice: "Message successfully deleted"
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
