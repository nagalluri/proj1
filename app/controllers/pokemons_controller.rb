class PokemonsController < ApplicationController
def capture
	@pokemon = Pokemon.find(params[:id])
	@pokemon.trainer_id = current_trainer.id
	@pokemon.save
	redirect_to root_path
end
def damage
	@pokemon = Pokemon.find(params[:id])
	@pokemon.health -= 10
	@pokemon.save
	trainer = Trainer.find(@pokemon.trainer_id) 
	if @pokemon.health <= 0
		@pokemon.destroy
	end
	redirect_to trainer_path(trainer)
end
def create
	@pokemon = Pokemon.new(pokemon_params)
	@pokemon.level = 1
	@pokemon.health = 100
	@pokemon.trainer_id = current_trainer.id
	if @pokemon.save 
		trainer = Trainer.find(@pokemon.trainer_id) 
		redirect_to trainer_path(trainer)
	end
	flash[:error] = @pokemon.errors.full_messages.to_sentence
	render 'new'
end
private
  
 
def pokemon_params
	params.require(:pokemon).permit(:name, :description)
end
end

