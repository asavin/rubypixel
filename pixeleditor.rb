class PixelEditor
  def create_new_image(m, n)
    Array.new(n) { Array.new(m) {'O'} }
  end
  
  # Expected input:
  # Array of arrays of strings representing pixels
  # All pixels are reset to 'O' value
  def clear_image(pixels)
    pixels.map! { |row| row.map { |p| p = 'O'}}
  end
  
  def printout(pixels)
    pixels.each do |row|
      puts row.join
    end
  end
  
  def colour_one_pixel(pixels, x, y, colour)
    if validate_coordinates(x, 0, y, 0, pixels)
      pixels[x][y] = colour
    end
    pixels
  end
  
  def draw_vertical_segment(pixels, x, y1, y2, colour)
    if validate_coordinates(x, 0, y1, y2, pixels)
      pixels[y1..y2].map! { |row| row[x] = colour }
    end
    pixels
  end
  
  def draw_horizontal_segment(pixels, x1, x2, y, colour)
    if validate_coordinates(x1, x2, y, 0, pixels)
      pixels[y].fill(colour, x1..x2)
    end
    pixels
  end
  
  # Basically checking that requested coordinates are
  # within the image size
  def validate_coordinates(x1, x2, y1, y2, pixels)
    if (pixels.length > y1 && pixels.length > y2 && pixels[0].length > x1 && pixels[0].length > x2)
      true
    else
      puts "Entered coordinates are exceeding image size"      
      false
    end
  end
end