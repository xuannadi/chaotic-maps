require 'chunky_png'

class Image
  
  @fileName = "" 
  
  def initialize(fileName = "../files/sample.png")
    @fileName = fileName	
  end

  def horseShoeMap(key=2) # folded baker map
    fileName = @fileName
    key.times do
      image = ChunkyPNG::Image.from_file(fileName)
      h = image.height
      w = image.width
      scrambledImg = ChunkyPNG::Image.new(w,h, ChunkyPNG::Color::TRANSPARENT)
      im1 = image.crop(0,0,(w/2).floor,h).resize(w,(h/2).floor)
      im2 = image.crop((w/2).floor,0,(w/2).floor,h).resize(w,(h/2).floor).flip_vertically
      scrambledImg = scrambledImg.replace(im2,0,0)
      scrambledImg = scrambledImg.replace(im1,0,(h/2).floor)
      scrambledImg.save('../output/horseShoe.png')
      fileName = '../output/horseShoe.png'
    end
  end  

  def bakerMap(key=2)
    fileName = @fileName
    key.times do
      image = ChunkyPNG::Image.from_file(fileName)
      h = image.height
      w = image.width
      scrambledImg = ChunkyPNG::Image.new(w,h, ChunkyPNG::Color::TRANSPARENT)
      im1 = image.crop(0,0,(w/2).floor,h).resize(w,(h/2).floor)
      im2 = image.crop((w/2).floor,0,(w/2).floor,h).resize(w,(h/2).floor)
      scrambledImg = scrambledImg.replace(im2,0,0)
      scrambledImg = scrambledImg.replace(im1,0,(h/2).floor)
      scrambledImg.save('../output/baker.png')
      fileName = '../output/baker.png'
    end
  end

end
