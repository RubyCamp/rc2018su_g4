class Controller2 < Controller
  def update
      self.y += @speed if Input.key_down?(keys[:right]) and self.y < 590
      self.y -= @speed if Input.key_down?(keys[:left]) and self.y > 100

      self.angle += 3 if Input.key_down?(keys[:turn_right]) and self.angle < 260
      self.angle -= 3 if Input.key_down?(keys[:turn_left]) and self.angle > 100
  end

  def keys
    { right: K_LBRACKET, left: K_RBRACKET, turn_right: K_AT, turn_left: K_COLON }
  end

end
