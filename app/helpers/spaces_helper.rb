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

    players.each do |p|
      #check horizontal
      3.times do |i|
        i = i * 3
        return p if game[i..i+2].all? {|s| s.player == p} 
      end
      #check vertical
      3.times do |i|
        return p if [game[i],game[i+3],game[i+6]].all? {|s| s.player == p}
      end
      #check diagonal
      return p if [game[0],game[4],game[8]].all?  {|s| s.player == p}
      return p if [game[2],game[4],game[6]].all?  {|s| s.player == p}
    end
    return nil 
  end 
end
