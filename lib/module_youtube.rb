module Youtube
  def youtube?
    self =~ /youtube/ ? true : false if self.url?
  end

  def youtube_embed
    v = self.params 'v'
    %Q{
    <iframe width="560" height="315" src="https://www.youtube.com/embed/V_PLACEHOLDER" frameborder="0" allowfullscreen></iframe>
    }.gsub(/V_PLACEHOLDER/, v)
  end
end
