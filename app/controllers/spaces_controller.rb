class SpacesController < ApplicationController
  def index
    
  end

 
  private

  def new_game
    9.times{ Space.belonging_to(session_user).create }  
  end
end
