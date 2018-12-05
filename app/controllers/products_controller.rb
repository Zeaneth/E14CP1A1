class ProductsController < ApplicationController
    
    def create
        @product.category_id = @category.id
        @category = Category.find(params[:category_id])
        @product = Product.new(product_params)
        if @product.save
            @category = @product.category
            redirect_to category_path
        else
            redirect_to @category
        end
    end
    
    private

    def product_params
        params.require(:product).permit(:name, :price)
    end
end
