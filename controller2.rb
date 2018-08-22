class Controller2 < Sprite

  def update
      self.y -= 1 if Input.key_down?(keys[:right])
      self.y += 1 if Input.key_down?(keys[:left])

      self.angle += 1 if Input.key_down?(keys[:turn_right])
      self.angle -= 1 if Input.key_down?(keys[:turn_left])
  end


  def keys
    {
       right: K_UP,
       left: K_DOWN,
       turn_right: K_RIGHT,
       turn_left: K_LEFT
    }
  end
end