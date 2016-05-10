require 'uri'
require 'cgi'
require_relative "module_youtube.rb"

class String
  def embed
    return self.youtube_embed if self.youtube?
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
      self.youtube?
    else
      return false
    end
  end

  include Youtube
end
