class Controller2 < Controller

  def update
      self.y += 1 if Input.key_down?(keys[:right]) and self.y < 500
      self.y -= 1 if Input.key_down?(keys[:left]) and self.y > 100

      self.angle += 1 if Input.key_down?(keys[:turn_right]) and self.angle < MAX_ANGLE
      self.angle -= 1 if Input.key_down?(keys[:turn_left]) and self.angle > MIN_ANGLE
  end

  def keys
    {
       right: K_DOWN,
       left: K_UP,
       turn_right: K_RIGHT,
       turn_left: K_LEFT
    }
  end

end