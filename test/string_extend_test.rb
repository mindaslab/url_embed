require_relative "../lib/string_extend.rb"
require "test/unit"

class  StringExtendTest < Test::Unit::TestCase
  @@url = "https://www.youtube.com/watch?v=1MdmEZ4Z-3A&project=url_embed"
  @@github_url = "https://gist.github.com/mindaslab/bca764c03254a4a46ba87f2e6a4c09ed"
  @@image_url = "https://b2aeaa58a57a200320db-8b65b95250e902c437b256b5abf3eac7.ssl.cf5.rackcdn.com/media_entries/9978/trisquel3.medium.png"
  @@video_url = "https://something.com/movie.webm"

  def test_url
    assert @@url.url?, "0: String::url? method did not work"
  end

  def test_youtube
    assert @@url.youtube?, "1: String::youtube? method did not work"
  end

  def test_params_for_single_key
    v = @@url.params 'v'
    assert_equal "1MdmEZ4Z-3A", v, "2: String::params did not work"
  end

  def test_get_all_params_in_url
    expected = {"project"=>["url_embed"], "v"=>["1MdmEZ4Z-3A"]}
    params = @@url.params
    assert_equal expected, params, "3: String::params did not work"
  end

  def test_embed_for_youtube
    expected = %Q{
    <iframe width="560" height="315" src="https://www.youtube.com/embed/1MdmEZ4Z-3A" frameborder="0" allowfullscreen></iframe>
    }
    got = @@url.embed
    assert_equal expected, got, "5: String::embed is not working"
  end

  def test_embedable_for_youtube
    expected = true
    got = @@url.embedable?
    assert_equal expected, got, "Testing String#embedable? for youtube"
  end

  def test_embedable_for_non_embedable_url
    expected = false
    got = "http://google.com".embedable?
    assert_equal expected, got, "Testing String#embedable? for youtube"
  end

  def test_embedable_for_github_gist
    expected = true
    got = @@github_url.embedable?
    assert_equal expected, got, "Testing String#embedable? for github gist"
  end

  def test_embed_for_github_gist
    expected = %Q{
      <script src="https://gist.github.com/mindaslab/bca764c03254a4a46ba87f2e6a4c09ed.js"></script>
    }.strip
    got = @@github_url.embed
    assert_equal expected, got, "String#embed is not working"
  end

  def test_embed_for_image
    expected = %Q{
      <img src="#{@@image_url}" />
    }.strip
    got = @@image_url.embed
    assert_equal expected, got, "String#embed is not working"
  end

  def test_embed_for_video
    expected = expected = %Q{
      <video src="#{@@video_url}" controls>
        Your browser does not support the <code>video</code> element.
      </video>
    }.strip
    got = @@video_url.embed
    assert_equal expected, got, "String#embed is not working"
  end
end
