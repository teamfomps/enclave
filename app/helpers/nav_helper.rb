module NavHelper
  def navigation_tab(controller, &block)
    content = capture(&block)
    if controller == nav_heading
      ret = '<li class="active">'
    else
      ret = '<li>'
    end
    ret += content
    ret += '<span class="sr-only"> (current)</span>' if controller == controller_name
    ret += '</li>'
    ret.html_safe
  end
end
