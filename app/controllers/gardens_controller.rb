class GardensController < ApplicationController
  before_action :set_garden, only: %i[ show edit update destroy ]

  def index
    @gardens = Garden.all
  end

  # On crée une nouvelle plante depuis la show du Garden
  # Du coup, pour le formulaire, il lui faut le Plant.new
  def show
    @plant = Plant.new
  end

  def new
    @garden = Garden.new
  end

  def edit
  end

  def create
    @garden = Garden.new(garden_params)

    if @garden.save
      redirect_to @garden, notice: "Garden was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @garden.update(garden_params)
      redirect_to @garden, notice: "Garden was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_url, notice: "Garden was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden
      @garden = Garden.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def garden_params
      params.require(:garden).permit(:name, :banner_url)
    end
end
