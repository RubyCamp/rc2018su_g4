class Controller1 < Sprite
  def update
    self.y += 1 if Input.key_down?(keys[:down]) and self.y < 500

    self.y -= 1 if Input.key_down?(keys[:up])  and self.y > 100
  end

  def keys
    {
       down: K_Z,
       up: K_A
    }
  end
end