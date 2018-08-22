class Controller4 < Sprite
	def update
		
		self.x += 1 if Input.mouse_pos_x > self.x and self.x < 500
		self.x -= 1 if Input.mouse_pos_x < self.x and self.x > 100
	end
end