xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "SEZ"
    xml.description "今注目の話題から普段目にしないようなおもしろトピック満載！単語の意味も辞書要らずのポップアップで簡単チェック。ボキャブラリーがどんどん増えます！"
    xml.link "http://simpleenglishzine.com"

    for post in @articles
      xml.item do
        xml.title post.title
        xml.description post.description
        xml.pubDate post.pubdate.to_s(:rfc822)
        xml.link article_url(post)
        xml.guid article_url(post)
      end
    end
  end
end
