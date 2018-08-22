class Controller3 < Sprite

  def update
    self.x += 1 if Input.key_down?(keys[:right]) and self.x < 500
    self.x -= 1 if Input.key_down?(keys[:left]) and self.x > 100

  end
  def keys
    {
       right: K_B,
       left: K_V,
    }
  end
end