class Player < Sprite
    #def atari
  	#{a = A.check # A=character
  		#if a.size > 0 then
  		#count += 1
  		#A.load(ohaka.png, x = nil, y = nil, width = nil, height = nil )
    #end}
  def initialize(x, y, image = nil)
    image = Image.new(50, 50, C_WHITE) 
  		
    super(x, y, image)
  end

  def change
    self.image = Image.load("ohaka.png") 
  end



end
