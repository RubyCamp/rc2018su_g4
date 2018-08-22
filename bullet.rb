class Bullet < Sprite
    BULLET_SPEED = 10.0

    def initialize(x, y, image, radian)
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
end
