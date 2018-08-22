class Controller < Sprite
    def update
        self.y += 1 if Input.key_down?(keys[:right])
        self.y -= 1 if Input.key_down?(keys[:left])

        self.angle += 1 if Input.key_down?(keys[:turn_right])
        self.angle -= 1 if Input.key_down?(keys[:turn_left])
    end
end