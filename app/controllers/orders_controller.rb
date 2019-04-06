class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # POST /orders
  # POST /orders.json
  def create
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
      render :show, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
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
    # add on map

    # add_on_price = {
    #   '1': 0.4,
    #   '2': 0,
    # }

    # def get_price(product_id, quantity, add_on)

    # end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :address_id)
    end
end
