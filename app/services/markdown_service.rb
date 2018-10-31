class MarkdownService
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
  def self.configure(markdown)
    @@markdown = markdown
  end

  def self.render(text)
    @@markdown.render(text).html_safe
  end
end
