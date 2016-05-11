module GithubGist
  def github_gist?
    self =~ /gist\.github\.com/ ? true : false
  end

  def github_gist_embed
    string = self.strip
    %Q{
      <script src="GIST_URL_AS_JS"></script>
    }.gsub(/GIST_URL_AS_JS/, string + ".js").strip
  end
end
