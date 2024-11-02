require "csv"

class ProductsController < ApplicationController
  before_action :check_admin_privilege, except: ["index", "show"] #Will exclude only index and show actions to go through check_admin_privilege. This to protect the application from Hackers.
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    new_product_params = product_params.to_unsafe_h # Method called from ActionConttoller parameters object. It converts paramater into regular Ruby hash, allowing access to all parameter without strong parameters restringtions
    new_product_params.delete("images") if new_product_params["images"].all?(&:blank?) # If the Images paramas from the product hash is blank, then delete images. Otherwise, do not delete images if User does not upload new images in the form
    respond_to do |format|
      if @product.update(new_product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export_csv
    @products = Product.joins(:category).select("products.name AS product_name, products.price AS product_price, categories.name AS category_name")

    respond_to do |format|
      format.csv { send_data generate_csv(@products), filename: "products-#{Date.today}.csv", type: "text/csv" }
    end
  end

  private

  def generate_csv(products)
    CSV.generate(headers: true) do |csv|
      csv << [ "Name", "Price $CAD", "Category" ] # Sets csv headers

      products.each do |product|
        csv << [ product.product_name, product.product_price, product.category_name ] # select the attributes from query
      end
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :description, :price, :category_id, images: [] ])
    end
end
