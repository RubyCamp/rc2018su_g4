class Controller3 < Controller
  def update
    self.x += @speed if Input.key_down?(keys[:right]) and self.x < 500
    self.x -= @speed if Input.key_down?(keys[:left]) and self.x > 100

    self.angle += 3 if Input.key_down?(keys[:turn_right]) and self.angle < 350
    self.angle -= 3 if Input.key_down?(keys[:turn_left]) and self.angle > 190
  end

  def keys
    { right: K_B, left: K_V, turn_right: K_H, turn_left: K_F }
  end
end
