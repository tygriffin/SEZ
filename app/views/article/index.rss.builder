xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Simple English Zine | Articles"
    xml.description "A magazine written in simple English"
    xml.link articles_url

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article.description
        xml.pubdate article.pubdate(:rfc822)
        xml.link article_url(post)
        xml.guid article_url(post)
      end
    end
  end
end
