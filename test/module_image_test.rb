require_relative "../lib/string_extend.rb"
require "test/unit"

class  ModuleImage < Test::Unit::TestCase
  @@url = "https://something.com/picure.png"

  def test_image?
    expected = true
    got = @@url.image?
    assert_equal expected, got, "Image#image? failed"
  end

end
