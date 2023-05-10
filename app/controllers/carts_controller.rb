class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  def names=(value)
    self.name = value.join(',')
  end

  def names
    self.name.split(',')
  end
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if current_cart.present?
      
      cart = current_user.carts.find_by(product_id: @product.id)
      index= current_cart.find_index{|item| item['product_id'] == @product.id}
      
        if cart
          # raise cart.inspect
          cart[:quantity] += 1
          cart[:price] += @product.price
          cart[:name] = @product.name
          current_cart.delete_at(index)
          current_cart << cart.attributes
          cart.save
        else
            cart_item=current_user.carts.new(product_id: @product.id, name: @product.name, quantity: 1, price: @product.price, status:"Active")
            cart_item.save
          current_cart << cart_item.attributes
        end

    else
      cart = current_user.carts.new( product_id: @product.id, name: @product.name, quantity: 1, price: @product.price, status:"Active")
      cart.save
     current_cart << cart

    end
    redirect_to user_home_path(current_user)
  end
  
   
  
  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:name, :price, :quantity)
    end
end
