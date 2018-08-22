class Controller1 < Sprite
    def update
        self.y += 1 if Input.key_down?(keys[:right])
        self.y -= 1 if Input.key_down?(keys[:left])

        self.angle += 1 if Input.key_down?(keys[:turn_right])
        self.angle -= 1 if Input.key_down?(keys[:turn_left])
    end

    def keys
        {
          right: K_Z,
          left: K_A,
          turn_right: K_X,
          turn_left: K_W
        }
    end
end