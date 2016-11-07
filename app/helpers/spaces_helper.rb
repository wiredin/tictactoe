module SpacesHelper
  def played?(space)
    space.player? 
  end
  def button_classes(space)
    ['no-btn', ('space-played' if played? space)]
  end
end
