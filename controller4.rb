class Controller4 < Controller
	def initialize(x=0, y=0, image=nil, id, angle)
		super(x, y, image, id, angle)
		@former_pos = 0
	end

	def update
		self.x += @speed if Input.mouse_pos_x > self.x and self.x < 590
		self.x -= @speed if Input.mouse_pos_x < self.x and self.x > 100
   
        self.angle += 3 if Input.mouse_wheel_pos > @former_pos and self.angle < 170
        self.angle -= 3 if Input.mouse_wheel_pos < @former_pos and self.angle > 10
	    
	    @former_pos = Input.mouse_wheel_pos

	end

end
