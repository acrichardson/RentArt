class ProductsController < ApplicationController


  def index
    @products = policy_scope(Product)
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to products_path
  end

  def my_products
    @products = current_user.products
    authorize @products
  end

  private

  def product_params
    params.require(:product).permit(:name, :details, :user_id, :photo)
  end

end
