require_relative "../lib/string_extend.rb"
require "test/unit"

class  ModuleVideo < Test::Unit::TestCase
  @@url = "https://something.com/movie.webm"

  def test_video?
    expected = true
    got = @@url.video?
    assert_equal expected, got, "Video#video? failed"
  end

  def test_video_embed
    expected = %Q{
      <video src="#{@@url}" controls>
        Your browser does not support the <code>video</code> element.
      </video>
    }.strip
    got = @@url.video_embed
    assert_equal expected, got, "video_embed is not working"
  end

end
