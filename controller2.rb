class Controller2 < Sprite
   
  def update
    self.y += 1 if Input.key_down?(keys[:down])
    self.y -= 1 if Input.key_down?(keys[:up])
  end

  def keys
    {
       down: K_DOWN,
       up: K_UP,
    }
  end
end