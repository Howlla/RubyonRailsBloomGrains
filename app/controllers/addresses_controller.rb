class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update, :destroy]
  before_action :authenticate_user

  # GET /addresses
  # GET /addresses.json
  def index
    # @addresses = current_user.addresses
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  def fetch
    @addresses = current_user.addresses
    render json: @addresses
  end



  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id

    if @address.save
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    if @address.update(address_params)
      render :show, status: :ok, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:line1, :line2, :pin_code)
    end
end
