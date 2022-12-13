class Api::ProductsController < ApplicationController
    # include ActiveStorage::SetCurrent
    # before_action do
    #   ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    # end
  
    def index
      @products = Product.all
      render :index
    end

    def show
      @product = Product.find(params[:id])
      if @product
          render :show
        else
          render json: {product: nil}
      end
    end

end
