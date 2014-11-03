class PokemonController < ApplicationController
def capture
	@pokemon.id = current_trainer.id
	@pokemon.save
	redirect_to PREFIX_PATH
end
