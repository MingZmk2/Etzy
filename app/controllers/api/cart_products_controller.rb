class Api::CartProductsController < ApplicationController
    def create
      @cart = CartProduct.find_by_user_and_product(params[:buyer_id], params[:product_id])
      if @cart
        @cart.quantity += params[:quantity]
      else
        @cart = CartProduct.new(cart_params)
      end

      if @cart.save
        # render :show
        render "/api/carts/show"
      else
        render json: { errors: @cart.errors.full_messages }, status: 422
      end
    end

    def index
      if current_user
        @carts = CartProduct.where(buyer_id: current_user.id)
      else
        @carts = CartProduct.all
      end
      # render :index
      render: "/api/carts/index"
    end

    def show
      @cart = CartProduct.find_by(id: params[:id])
      # render :show
      render "/api/carts/show"
    end

    
    def update
      @cart = CartProduct.find_by(id: params[:id])
      
      if @cart.update(cart_params)
        # render :show
        render "/api/carts/show"
      else
        render json: { errors: @cart.errors.full_messages }, status: 422
      end
    end

    def destroy
      @product = CartProduct.find_by(id: params[:id])
      if @product && @product.destroy
        render: "/api/carts/index"
      else
        render json: ["Error Not Found"], status: 404
      end
      # head :no_content 
    end

    private

    def cart_params
        params.require(:cart_item).permit(:buyer_id, :product_id, :quantity)
    end

end
