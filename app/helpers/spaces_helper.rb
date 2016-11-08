module SpacesHelper
  def played?(space)
    space.player? 
  end
  def button_classes(space)
    ['no-btn', ('space-played' if played? space)]
  end

  def last_player
    Space.belonging_to(@session_user).order(:updated_at).last.player
  end  

  def current_player
    last_player == 'x' ? 'o' : 'x'
  end 

  def game_over?(game)
    @winner = winner(game) 
    !@winner.nil?
  end

  def winner(game)
    players = ['x','o']

    #check horizontal
    players.each do |p|
      3.times do |i|
        i = i * 3
        return p if game[i..i+2].all? {|s| s.player == p} 
      end
    end
    nil 
  end 
end
