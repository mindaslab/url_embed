require_relative "../lib/string_extend.rb"
require "test/unit"

class  ModuleYoutubeTest < Test::Unit::TestCase
  @@url = "https://www.youtube.com/watch?v=1MdmEZ4Z-3A&project=url_embed"

  def test_youtube_embed
    expected = %Q{
    <iframe width="560" height="315" src="https://www.youtube.com/embed/1MdmEZ4Z-3A" frameborder="0" allowfullscreen></iframe>
    }
    got = @@url.youtube_embed
    assert_equal expected, got, "4: youtube embed is not working"
  end
end
