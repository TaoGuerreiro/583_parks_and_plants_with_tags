class PlantsController < ApplicationController

  # Pas de new, car on affiche le formulaire sur la show du Garden
  # Pas d'index, car on n'a pas de page dédiée à afficher toutes les plates
  # Pas de show, on n'affiche pas de détail de plante (il n'y en a pas)
  # Les plantes de chaque Garden seront affichées sur la show de ce Garden

  def create
    @plant = Plant.new(plant_params)
    @garden = Garden.find(params[:garden_id])
    @plant.garden = @garden

    @plant.save

    redirect_to(garden_path(@garden))
  end

  def destroy
    plant = Plant.find(params[:id])
    garden = plant.garden

    plant.destroy

    redirect_to(garden_path(garden))
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
