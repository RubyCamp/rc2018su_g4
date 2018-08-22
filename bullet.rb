class Bullet < Sprite
    BULLET_SPEED = 10.0

    def initialize(x, y, image, source_id, radian)
	@source_id = source_id
        @bound_count = 3
        @velocity_x = Math.cos(radian) * BULLET_SPEED
        @velocity_y = Math.sin(radian) * BULLET_SPEED
        super(x, y, image)
    end
        
    def update
        @velocity_x *= -1 if not (0..Window.width).include?(self.x)
        @velocity_y *= -1 if not (0..Window.height).include?(self.y)

        @bound_count -= 1 if not (0..Window.width).include?(self.x) or not (0..Window.height).include?(self.y)

        self.x += @velocity_x
        self.y += @velocity_y
    end

    def is_bound_limit
        return @bound_count < 0
    end

<<<<<<< HEAD
    def hit(c)
=======
    def shot(c)
        p "SSSS"
>>>>>>> d62dadb7026de78c94816ba6c83f65fce7bd379d
    end
end
