xml.feed do |feed|
  feed.title = "SEZ"
  feed.updated @articles.maximum(:updated_at)

  @articles.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.content post.description
      entry.url article_path(post)
      entry.author do |author|
        author.name post.author
      end
    end # end feed.entry
  end # end @articles.each
end