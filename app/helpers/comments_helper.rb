module CommentsHelper
  def render_comment_body(comment)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    body = case comment.format
    when 'Html'
      comment.body
    when 'Markdown'
      markdown.render(comment.body)
    else
      simple_format(comment.body)
    end
    body.html_safe
  end
end
