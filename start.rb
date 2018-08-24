require "date"

def start_screen
  count =0
  music = Sound.new('bgm/title_music.wav')
  music.loop_count = -1
  music.play
  font = Font.new(40)

  start_flag = false
  image =  Image.load("image/title.png")

  Window.loop do
    count += 1 
    Window.draw(0,0, image)
    if count <= 30
      Window.draw_font(160, 450, "Press SPACE to START", font)
    elsif count == 60
      count = 0 
    end 

    if Input.key_push?(K_SPACE)
      start_flag = true
	    break
    end
  end
   
  music.stop
  return start_flag
end
