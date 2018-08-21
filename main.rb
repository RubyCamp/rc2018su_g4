require 'dxruby'
require 'chipmunk'
require_relative 'color'

font = Font.new(32)

class Block < Sprite
    def initialize(x, y, image)
        @space = CP::Space.new
        @space.gravity = CP::Vec2.new(x, y)
        @body = CP::Body.new(CP::INFINITY, CP::INFINITY)
        @shape = CP::Shape::Circle.new(@body, 10, CP::Vec2.new(x, y))

        @space.add_body(@body)
        @space.add_shape(@shape)

        super(x, y, image)
    end

    def update
        @space.step(1.0 / 30.0)
        self.y = @body.p.y
    end
end

class Player < Sprite
    @@JUMP_LIMIT = 50

    def initialize(x, y, image)
        @jump = false

        @space = CP::Space.new
        @space.gravity = CP::Vec2.new(x, y)
        @body = CP::Body.new(CP::INFINITY, CP::INFINITY)
        @shape = CP::Shape::Circle.new(@body, 10, CP::Vec2.new(x, y))

        @space.add_body(@body)
        @space.add_shape(@shape)

        super(x, y, image)
    end

    def update
        if @jump
            self.y -= 1
            
            if self.y < @@JUMP_LIMIT
                @jump = false
            end
        else
            @space.step(1.0 / 20.0)
            self.y = @body.p.y
        end
    end

    def jump
        @jump = true
    end
end

p1 = Sprite.new(0, 0, Image.new(32, 32, C_WHITE))
blocks = Array.new
border_line = Sprite.new(0, Window.height - 10, Image.new(Window.width, 1, C_GREEN))
board = Sprite.new(100, 100, Image.new(100, 20, C_RED))
current_angle = 180
player = Player.new(0, Window.height, Image.new(32, 32, C_RED))

Window.loop do
    p1.x = Input.mouse_pos_x
    p1.y = Input.mouse_pos_y
    
    current_angle -= 1 if Input.key_down?(K_LEFT)
    current_angle += 1 if Input.key_down?(K_RIGHT)

    board.angle = current_angle

    player.jump if Input.key_down?(K_SPACE)
    player.update if not player === border_line

    if Input.mouse_push?(M_LBUTTON)
        blocks << Block.new(p1.x, p1.y, Image.new(32, 32, C_BLUE))
    end

    blocks.each do |b|
        if not b === border_line and b.check(blocks).size < 2
            b.update
        end
        b.draw
    end

    board.draw
    player.draw
    p1.draw   
end 
