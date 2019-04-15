class FruitsController < ApplicationController
  before_action :set_fruit, only: [:show, :edit, :update, :destroy]

  # GET /fruits
  def index
    @fruits = Fruit.all
  end

  # GET /fruits/1
  def show
  end

  # GET /fruits/new
  def new
    @fruit = Fruit.new
  end

  # GET /fruits/1/edit
  def edit
  end

  # POST /fruits
  def create
    @fruit = Fruit.new(fruit_params)

    if @fruit.save
      redirect_to @fruit, notice: 'Fruit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fruits/1
  def update
    if @fruit.update(fruit_params)
      redirect_to @fruit, notice: 'Fruit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fruits/1
  def destroy
    @fruit.destroy
    redirect_to fruits_url, notice: 'Fruit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fruit
      @fruit = Fruit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fruit_params
      params.require(:fruit).permit(:name, :size, :dancing)
    end
end
