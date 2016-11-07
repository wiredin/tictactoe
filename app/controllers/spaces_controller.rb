class SpacesController < ApplicationController

  def index
    if new_session?
      new_game
    else
      load_and_render_index
    end
  end

 
  private

  def new_game
    9.times{ Space.belonging_to(session_user).create } 
  end

  def load_game
    @game = Space.belonging_to(session_user).order(id: :asc)
  end

  def load_and_render_index
    load_game
    render "index"
  end
end
