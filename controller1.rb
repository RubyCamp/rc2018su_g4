class Controller1 < Sprite
  def update
    self.y += 1 if Input.key_down?(keys[:down])
    self.y -= 1 if Input.key_down?(keys[:up])
  end

  def keys
    {
       down: K_A,
       up: K_Z
    }
  end
end