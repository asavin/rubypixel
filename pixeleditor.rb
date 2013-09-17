class PixelEditor
  def create_new_image(m, n)
    Array.new(n) { Array.new(m) {'O'} }
  end
end