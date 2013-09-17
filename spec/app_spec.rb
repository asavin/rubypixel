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
  
end