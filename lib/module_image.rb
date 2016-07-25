module Image
  def image?
    self.downcase.match(/\.png$|\.jpg$|\.jpeg$|\.gif$|\.tiff$|\.svg$/) ? true : false
  end

  def image_embed
    %Q{
      <img src="#{self}" />
    }.strip
  end
end
