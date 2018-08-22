class Controller2 < Sprite
   
  def update
    self.y += 1 if Input.key_down?(keys[:down]) and self.y < 500
    self.y -= 1 if Input.key_down?(keys[:up]) and self.y > 100
  end

  def keys
    {
       down: K_DOWN,
       up: K_UP,
    }
  end
end