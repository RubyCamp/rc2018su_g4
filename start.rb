def start_screen
   start_flag = false
   image =  Image.load("image/title.png")

   Window.loop do
     Window.draw(0,0, image)
     if Input.key_push?(K_SPACE)
        start_flag = true
	    break
     end
   end

   return start_flag
end
