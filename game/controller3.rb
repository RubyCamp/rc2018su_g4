class Controller3 < Controller


  def update
    self.x += self.speed if Input.key_down?(keys[:right]) and self.x < 500
    self.x -= self.speed if Input.key_down?(keys[:left]) and self.x > 100

    self.angle += 1 if Input.key_down?(keys[:turn_right]) and self.angle < 350
    self.angle -= 1 if Input.key_down?(keys[:turn_left]) and self.angle > 190

  end

  def keys
    {
       right: K_N,
       left: K_B,
       turn_right: K_J,
       turn_left: K_G
    }
  end
end
