class AddOnTablesController < ApplicationController
  before_action :set_add_on_table, only: [:show, :update, :destroy]

  # GET /add_on_tables
  # GET /add_on_tables.json
  def index
    @add_on_tables = AddOnTable.all
  end

  # GET /add_on_tables/1
  # GET /add_on_tables/1.json
  def show
  end

  # POST /add_on_tables
  # POST /add_on_tables.json
  def create
    @add_on_table = AddOnTable.new(add_on_table_params)

    if @add_on_table.save
      render :show, status: :created, location: @add_on_table
    else
      render json: @add_on_table.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /add_on_tables/1
  # PATCH/PUT /add_on_tables/1.json
  def update
    if @add_on_table.update(add_on_table_params)
      render :show, status: :ok, location: @add_on_table
    else
      render json: @add_on_table.errors, status: :unprocessable_entity
    end
  end

  # DELETE /add_on_tables/1
  # DELETE /add_on_tables/1.json
  def destroy
    @add_on_table.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_on_table
      @add_on_table = AddOnTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_on_table_params
      params.require(:add_on_table).permit(:name, :rate, :info)
    end
end
