class MessagesController < ApplicationController
	before_filter :load_product
	before_filter :ensure_logged_in

  def create
  	@message = @product.messages.build(message_params)
  	@message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to product_path(@product), :notice => "Message posted" }
        format.js {}
      else
        format.html { render 'products/show', alert: "Oops, there was an error. Please try again." }
        format.js {}
      end
    end
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy

    respond_to do |format|
      format.html { redirect_to product_path(@product), notice: "Message successfully deleted" }
      format.js { }
    end
  end

  private
  def message_params
  	params.require(:message).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
