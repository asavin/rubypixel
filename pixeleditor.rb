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
    pixels[x][y] = colour
    pixels
  end
  
  def draw_vertical_segment(pixels, x, y1, y2, colour)
    pixels[y1..y2].map! { |row| row[x] = colour }
    pixels
  end
end