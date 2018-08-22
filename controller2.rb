class Controller2 < Controller
  def update
<<<<<<< HEAD
      @id = 2
      self.y += 1 if Input.key_down?(keys[:right]) and self.y < 500
      self.y -= 1 if Input.key_down?(keys[:left]) and self.y > 100
=======
      self.y += 3 if Input.key_down?(keys[:right]) and self.y < 500
      self.y -= 3 if Input.key_down?(keys[:left]) and self.y > 100
>>>>>>> d62dadb7026de78c94816ba6c83f65fce7bd379d

      self.angle += 3 if Input.key_down?(keys[:turn_right]) and self.angle < 260
      self.angle -= 3 if Input.key_down?(keys[:turn_left]) and self.angle > 100
  end

  def keys
    { right: K_DOWN, left: K_UP, turn_right: K_RIGHT, turn_left: K_LEFT }
  end

end
