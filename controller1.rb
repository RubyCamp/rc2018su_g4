class Controller1 < Controller

    def update
        self.y += 1 if Input.key_down?(keys[:right]) and self.y < 500
        self.y -= 1 if Input.key_down?(keys[:left]) and self.y > 100

        self.angle += 1 if Input.key_down?(keys[:turn_right]) and self.angle < MAX_ANGLE
        self.angle -= 1 if Input.key_down?(keys[:turn_left]) and self.angle > MIN_ANGLE
    end

    def keys
        {
          right: K_Z,
          left: K_Q,
          turn_right: K_X,
          turn_left: K_W
        }
    end
end
