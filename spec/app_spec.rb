require "spec_helper"
require_relative "../pixeleditor"

describe "Image editor" do
  before :each do
    @editor = PixelEditor.new
  end
  
  it "can create a new MxN image with all pixels coloured white" do  
    output = @editor.create_new_image(5, 4)
    expected = Array.new(4) { Array.new(5) {'O'} }
    output.should == expected
  end
  
  it "can paint one pixel with a given color" do
    output = @editor.create_new_image(5, 4)
    output = @editor.colour_one_pixel(output, 1, 1, 'D')
    output[1][1].should == 'D'
  end
  
  it "can reset all pixels in the image" do
    image = @editor.create_new_image(5, 6)
    image = @editor.colour_one_pixel(image, 1, 2, 'F')
    image = @editor.clear_image(image)
    image.each do |row|
      row.each do |p|
        p.should == 'O'
      end
    end
  end
  
  it "can draw vertical segment in the image" do
    image = @editor.create_new_image(6, 5)
    image = @editor.draw_vertical_segment(image, 1, 1, 2, 'B')
    image[1][1].should == 'B'
    image[2][1].should == 'B'
  end
  
  it "can draw horizontal segment with given colour" do
    image = @editor.create_new_image(7, 8)
    image = @editor.draw_horizontal_segment(image, 1, 5, 4, 'C')
    image[4][1..5].each do |p|
      p.should == 'C'
    end
  end
  
  it "can fill the region in the image with given colour" do
    image = @editor.create_new_image(7, 8)
    image = @editor.draw_horizontal_segment(image, 1, 4, 3, 'F')
    image = @editor.colour_one_pixel(image, 2, 1, 'F')
    image = @editor.fill_region(image, 1, 2, 'B')
    image[3][1..4].each do |p|
      p.should == 'B'
    end
    image[2][1].should == 'B'
  end
  
end