class Comment < ApplicationRecord
  belongs_to :discussion, touch: true
  belongs_to :member

  def render
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    rendered_body = case format
    when 'Html'
      body
    when 'Markdown'
      MarkdownService.render(body)
    else
      ApplicationController.helpers.simple_format(body)
    end
    rendered_body.html_safe
  end
end
