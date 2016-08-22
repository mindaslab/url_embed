require 'uri'
require 'cgi'
require_relative "module_youtube.rb"
require_relative "module_github_gist.rb"
require_relative "module_image.rb"
require_relative "module_video.rb"

class String
  def embed
    return self.youtube_embed if self.youtube?
    return self.github_gist_embed if self.github_gist?
    return self.image_embed if self.image?
    return self.video_embed if self.video?
  end

  def url?
    self =~ URI::regexp ? true : false
  end

  def params key=nil
    if self.url?
      uri = URI.parse(self)
      parameters = CGI.parse(uri.query)
      key.nil? ? parameters : parameters[key][0]
    end
  end

  ##
  # returns true if the url is embedable in HTML
  def embedable?
    if self.url?
      self.youtube? or self.github_gist? or self.image? or self.video?
    else
      return false
    end
  end

  include Youtube
  include GithubGist
  include Image
  include Video
end
