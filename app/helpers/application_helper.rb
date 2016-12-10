module ApplicationHelper
  def flash_context(level)
    case level
      when 'notice' then :info
      when 'success' then :success
      when 'error' then :danger
      when 'alert' then :warning
    end
  end

  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def gravatar_for(member, size = 30, title = member.full_name)
    image_tag gravatar_image_url(member.email, size: size), title: title, class: 'img-rounded'
  end
end
