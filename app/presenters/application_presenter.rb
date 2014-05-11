class ApplicationPresenter

  attr_reader :object

  def initialize(object, view_context=nil)
    @object = object
    @klass  = object.class
    @view_context = view_context
  end

  def method_missing(name, *args, &block)
    super unless object.respond_to?(name)
    object.send(name, *args, &block)
  end

  def markdown_parse(str, options={})
    options = {
      :escape_html => false,
      :strict_mode => false,
    }.update(options)
    bc = BlueCloth.new str, options
    bc.to_html
  end

end