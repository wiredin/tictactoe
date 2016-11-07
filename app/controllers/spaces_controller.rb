class SpacesController < ApplicationController

  def index
    if new_session?
      new_game
    else
      load_and_render_index
    end
  end

  def update
    Space.belonging_to(session_user).where(id: params[:id]).update(space_params)
    load_and_render_index
  end

  def reset
    Space.belonging_to(session_user).update_all(player: nil) 
    load_and_render_index
  end

  private
  
  def space_params
    params.require(:space).permit(:player)
  end

  def new_game
    9.times{ Space.belonging_to(session_user).create } 
    load_game
  end

  def load_game
    @game = Space.belonging_to(session_user).order(id: :asc)
  end

  def load_and_render_index
    load_game
    render "index"
  end
end
