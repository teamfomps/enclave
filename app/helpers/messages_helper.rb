module MessagesHelper
  def recipients_options
    s = ''
    Member.active.each do |member|
      next if member.id == current_member.id
      s << "<option value='#{member.id}'>#{member.full_name}</option>"
    end
    s.html_safe
  end
end
