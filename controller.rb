class Controller < Sprite
    attr_reader :id, :death, :speed

    def initialize(x, y, image, id, angle)
        self.angle = angle
        @id = id
        @death = false
        @speed = 3
        super(x, y, image)
    end

    def hit(b)
        if @id != b.source_id or b.bound_count < 2
            change_image
            @death = true
        end
    end

    def change_image
        self.image = Image.load('ohaka.png')
    end
end
