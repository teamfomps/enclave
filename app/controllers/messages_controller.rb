class MessagesController < AuthenticatedController
  before_action :set_nav_heading

  def new
    push_breadcrumb('New Message', new_message_path)
  end
  def create
    recipients = Member.where(id: params['recipients'])
    conversation = current_member.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

  def set_nav_heading
    @nav_heading = 'conversations'
  end

  private

  def initialize_breadcrumbs
    push_breadcrumb('Private Messages', conversations_path)
  end
end
