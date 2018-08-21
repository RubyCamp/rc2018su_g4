require 'dxruby'
require 'chipmunk'
require_relative 'color'

font = Font.new(32)

class Block < Sprite
    def initialize(x, y, image)
        @space = CP::Space.new
        @space.gravity = CP::Vec2.new(x, y)
        @body = CP::Body.new(CP::INFINITY, CP::INFINITY)
        @shape = CP::Shape::Circle.new(@body, 10, CP::Vec2.new(0, 0))

        @space.add_body(@body)
        @space.add_shape(@shape)
        super(x, y, image)
    end

    def update
        @space.step(1.0 / 20.0)
        self.y = @body.p.y
    end
end

Window.loop do
    Window.draw_font(0, 0, "Press Space to start.", font)
    
    break if Input.key_down?(K_SPACE)
end

/*
    class Player < Sprite
        def initialize(x, y, image)
            @space = CP::Space.new
            @space.gravity = CP::Vec2.new(x, y)
            @body = CP::Body.new(CP::INFINITY, CP::INFINITY)
            @shape = CP::Shape::Circle.new(@body, 10, CP::Vec2.new(0, 0))

            @space.add_body(@body)
            @space.add_shape(@shape)

            super(x, y, image)
        end

        def update
            @space.step(1.0 / 20.0)
            self.y = @body.p.y
        end
    end
*/

p1 = Sprite.new(0, 0, Image.new(32, 32, C_WHITE))
blocks = Array.new
border_line = Sprite.new(0, Window.height, Image.new(Window.width, 1, C_GREEN))

Window.loop do
    p1.x = Input.mouse_pos_x
    p1.y = Input.mouse_pos_y
    
    if Input.mouse_push?(M_LBUTTON)
        blocks << Block.new(p1.x, p1.y, Image.new(32, 32, C_BLUE))
    end

    blocks.each do |b|
        if not b === border_line and b.check(blocks).size < 2
            b.update
        end
        b.draw
    end

    p1.draw   
end 
