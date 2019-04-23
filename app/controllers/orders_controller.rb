class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # POST /orders
  # POST /orders.json
  def create
    if current_user.orders.count!=0 && current_user.orders.last.order_status=='pending'
      render json: current_user.orders.last.order_summary, status: :not_acceptable
    else
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    #Here you're trying to save the order. if its successful, you now have and order_id.
      if @order.save
      #successful
      #Here you're just permitting the :order_summary key in the call. This *should* work. IIRC.
      params[:order_summary].permit!
      order_summary = OrderSummary.new(params[:order_summary])
      order_summary.order_id = @order.id
      order_summary.save
      @order.price = get_price(order_summary.product_id,order_summary.quantity.to_i,order_summary.add_ons)
      @order.save
      render :show, status: :created, location: @order
      else
      render json: @order.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params)
      render :show, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
  end

  private

    def get_price(product_id, quantity, add_on)
      product_price={
        '1':55.0, #DIAMOND
        '2':45.0, #PLATINUM
        '3':35.0 #GOLD
      }
      add_on_price = {
        '1': 0.4, #millets
        '2': 0.7, #soyabean
        '3': 0.7, #chickpeas
        '4': 0.75, #sorghum
        '5': 1.7, #oats
        '6': 1, #corn
        '7': 4, #quinua
        '8': 0.5, #barley
        '9':0.5, #riceflour
        '10':10,  #paniphal
        '11':8, #lapsi
        '12':0.2 #Rye
      }
     orderArray = add_on.split('#')
     price=0;

     basePrice = orderArray[0].to_i * product_price[:"#{product_id}"]*quantity/100;    #x[0] is wheat percentage
     addonPrice=0
     i=1;
     while i<orderArray.length 
      temp = orderArray[i].split('$')
      addonPrice += add_on_price[:"#{temp[0]}"] * temp[1].to_i
      i=i+1
     end
     addonPrice=addonPrice*quantity
     price = basePrice + addonPrice
     return price
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :address_id)
    end
end
