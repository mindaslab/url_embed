require_relative "../lib/string_extend.rb"
require "test/unit"

class  ModuleGihubGist < Test::Unit::TestCase
  @@url = "https://gist.github.com/mindaslab/fea5778c0a51b145480b816023b700be"

  def test_github_gist?
    expected = true
    expected = 'a'
    got = @@url.github_gist?
    assert_equal expected, got, "GihubGist#gihub_gist? failed"
  end

  def test_github_gist_embed
    expected = %Q{
      <script src="https://gist.github.com/mindaslab/fea5778c0a51b145480b816023b700be.js"></script>
    }.strip
    got = @@url.github_gist_embed
    assert_equal expected, got, "GihubGist#gihub_gist_embed failed"
  end
end
