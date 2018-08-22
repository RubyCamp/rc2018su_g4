class Controller3 < Sprite
  def update
    self.x += 1 if Input.key_down?(keys[:right])
    self.x -= 1 if Input.key_down?(keys[:left])

    self.angle += 1 if Input.key_down?(keys[:turn_right])
    self.angle -= 1 if Input.key_down?(keys[:turn_left])

  end

  def keys
    {
       right: K_B,
       left: K_V,
       turn_right: K_H,
       turn_left: K_F
    }
  end
end