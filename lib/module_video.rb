module Video
  def video?
    self.downcase.match(/\.ogv$|\.webm$|\.mp4$/) ? true : false
  end

  def video_embed
    %Q{
      <video src="#{self}" controls>
        Your browser does not support the <code>video</code> element.
      </video>
    }.strip
  end
end
