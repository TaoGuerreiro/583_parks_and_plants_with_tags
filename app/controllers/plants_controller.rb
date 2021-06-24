class PlantsController < ApplicationController
  def create
    @plant = Plant.new(plant_params)
    @garden = Garden.find(params[:garden_id])
    @plant.garden = @garden

    @plant.save

    redirect_to(garden_path(@garden))
  end

  def destroy
    @plant = Plant.find(params[:id])
    garden = @plant.garden
    @plant.destroy

    redirect_to(garden_path(garden))
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
