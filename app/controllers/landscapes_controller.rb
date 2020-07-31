class LandscapesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_landscape, only: [:show, :edit, :update, :destroy]

  # GET /landscapes
  # GET /landscapes.json
  def index
    @landscapes = Landscape.all
  end

  # GET /landscapes/1
  # GET /landscapes/1.json
  def show
  end

  # GET /landscapes/new
  def new
    @landscape = Landscape.new
  end

  # GET /landscapes/1/edit
  def edit
  end

  # POST /landscapes
  # POST /landscapes.json
  def create
    @landscape = Landscape.new(landscape_params.merge(user: current_user))

    respond_to do |format|
      if @landscape.save
        format.html { redirect_to @landscape, notice: 'Landscape was successfully created.' }
        format.json { render :show, status: :created, location: @landscape }
      else
        format.html { render :new }
        format.json { render json: @landscape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landscapes/1
  # PATCH/PUT /landscapes/1.json
  def update
    respond_to do |format|
      if @landscape.update(landscape_params)
        format.html { redirect_to @landscape, notice: 'Landscape was successfully updated.' }
        format.json { render :show, status: :ok, location: @landscape }
      else
        format.html { render :edit }
        format.json { render json: @landscape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landscapes/1
  # DELETE /landscapes/1.json
  def destroy
    @landscape.destroy
    respond_to do |format|
      format.html { redirect_to landscapes_url, notice: 'Landscape was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landscape
      @landscape = Landscape.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landscape_params
      params.require(:landscape).permit(:image, :title, :description)
    end
end