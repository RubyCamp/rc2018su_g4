class Bullet < Sprite
    BULLET_SPEED = 6.0

    attr_reader :source_id, :bound_count

    def initialize(x, y, image, source_id, radian)
        @bound_count = 2
        @source_id = source_id
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

    def shot(c)
        p "SSSS"
    end
end
