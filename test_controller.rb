class KeyPlayer < Sprite
    MOVE_LEFT  = 0
    MOVE_RIGHT = 1
    TURN_LEFT  = 2
    TURN_RIGHT = 3

    EAST  = 1
    SOUTH = 2
    WEST  = 3
    
    def initialize(x, y, image, start_angle, buttons, side)
        self.angle = start_angle
        @current_angle = start_angle
        @buttons = buttons
        @side = side
    end

    def update
        if Input.key_down?(buttons[MOVE_LEFT])
            case
                when EAST then
                    self.y -= 1
                when SOUTH then
                    self.x -= 1
                when WEST then
                    self.y += 1
            end
        end

        if Input.key_down?(buttons[MOVE_RIGHT])
            case
                when EAST then
                    self.y += 1
                when SOUTH then
                    self.x += 1
                when WEST then
                    self.y -= 1
            end
        end

        @current_angle += 1 if Input.key_down?(buttons[TURN_RIGHT])
        @current_angle -= 1 if Input.key_down?(buttons[TURN_LEFT])
        
        @current_angle += 360 if @current_angle < 0
        @current_angle -= 360 if @current_angle >= 360

        self.angle = @current_angle
    end

    def move_left
        
end
