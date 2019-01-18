class ProductsController < ApplicationController
    
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.category = @category
        if @product.save
            redirect_to @category
        else
            redirect_to root_path
        end
    end
    
    def update
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to root_path
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :category_id)
    end
end
