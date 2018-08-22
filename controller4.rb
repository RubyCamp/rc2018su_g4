class Controller4 < Sprite
	def update
		self.x += 1 if Input.mouse_pos_x > self.x
		self.x -= 1 if Input.mouse_pos_x < self.x

		# self.angle += 1 if Input.mouse_wheel_pos_y > self.y
  #       self.angle -= 1 if Input.mouse_wheel_pos_y > self.y
	end
end