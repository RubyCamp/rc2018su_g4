class Controller1 < Controller
    def update
        self.y += self.speed if Input.key_down?(keys[:right]) and self.y < 500
        self.y -= self.speed if Input.key_down?(keys[:left]) and self.y > 100

        self.angle += 1 if Input.key_down?(keys[:turn_right]) and self.angle < 280
        self.angle -= 1 if Input.key_down?(keys[:turn_left]) and self.angle > 80
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
