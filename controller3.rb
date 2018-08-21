class Controller3 < Sprite

  def update
    self.x += 1 if Input.key_down?(keys[:right])
    self.x -= 1 if Input.key_down?(keys[:left])

  end
  def keys
    {
       right: K_B,
       left: K_V,
    }
  end
end