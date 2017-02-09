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

  def number_badge(number)
    return '' unless number > 0
    content_tag(:span, number, class: 'number-badge')
  end

  def mailbox_conversations
    current_member.mailbox.inbox
  end

  def unseen_message_count
    current_member.unread_inbox_count
  end

  def mail_dropdown_item(conversation)
    recipients = conversation.recipients.reject { |r| r.id == current_member.id }
    recipients = recipients.map(&:full_name).join(', ')
    vars = {conversation: conversation,
            recipients:   recipients,
            body:         conversation.messages.last.body}
    render 'layouts/mail_dropdown_item', vars
  end
end
