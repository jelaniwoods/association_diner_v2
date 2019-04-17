class LevelsController < ApplicationController
  before_action :set_level, only: %i[show edit store results update destroy]

  # GET /levels
  def index
    @levels = Level.all
  end

  def show
    session[:query] = []
  end

  def results
    @query = session[:query].last

    # @evalu = eval(@query["input"])

    @selections = nil
    @result = nil
    result = eval(@query["input"])
    # TODO figure out how to tell if eval returns an object or a relation
    @is_relation = @query["input"].include?("where")
    if @is_relation
      @selections = result
    else
      @result = result
    end
    @res = false
    @collection_returned = false

    if @level.matches?(@query["input"])
      @res =  true
    else

    end

  end

  def store
    @query = {input: params.fetch(:input).gsub(/\s+/, ""), level_id: @level.id }
    session[:query].push @query
    redirect_to "/levels/#{@level.id}/results", notice: "yup"
  end
  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels
  def create
    @level = Level.new(level_params)

    if @level.save
      redirect_to @level, notice: 'Level was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /levels/1
  def update
    if @level.update(level_params)
      redirect_to @level, notice: 'Level was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /levels/1
  def destroy
    @level.destroy
    redirect_to levels_url, notice: 'Level was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      if params[:id].nil?
        @level = Level.find(1) # TODO change to cookie thing maybe
      else
        @level = Level.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def level_params
      params.fetch(:level, {})
    end
end
