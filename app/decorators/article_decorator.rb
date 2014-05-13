class ArticleDecorator < Decorator

  def author
    @object.author
  end

  def body
    content = markdown_parse @object.body
    add_bubble(vocab, content)         if vocab
    add_bubble(culture_notes, content) if culture_notes
    add_bubble(study_notes, content)   if study_notes
    content
  end

  def vocab
    @object.vocabulary_words.order :word
  end

  def culture_notes
    @object.culture_notes.order :title
  end

  def study_notes
    @object.study_notes.order :title
  end

  def quiz
    Quiz.find_by(:article_id => @object.id, :quiz_type => 'flashcard')
  end

  def next
    Article.where(['pubdate > ?', @object.pubdate]).order("pubdate").first
  end

  def previous
    Article.where(['pubdate < ?', @object.pubdate]).order("pubdate DESC").first
  end

  private

  def add_bubble(study_resource, content)
    study_resource.each do |item|
      selector = item.has_attribute?(:word) ? item.word : item.title
      if @object.body.include? item.instance
        if @view_context.mobile_device?
          text = '<a class="bubble-trigger" id="' + selector + '">' + item.instance + '</a>'
        else
          text = '<a href="#' + selector.tr(" ", "_") + '_detail" class="bubble-trigger" id="' + selector + '">' + item.instance + '</a>'
        end
        content.gsub! item.instance, text
      end
    end
  end

end