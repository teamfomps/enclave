class ConversationsController < AuthenticatedController
  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :empty_trash]

  def index
    get_box
    if @box.eql? "inbox"
      @conversations = @mailbox.inbox
    elsif @box.eql? "sent"
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end

    @conversations = @conversations.paginate(page: params[:page], per_page: 10)
  end

  def show
    push_breadcrumb @conversation.subject.truncate(20), conversation_path(@conversation)
    @conversation.mark_as_read(current_member)
  end

  def reply
    current_member.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(current_member)
    flash[:success] = 'The conversation was moved to trash.'
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(current_member)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  private

  def get_mailbox
    @mailbox ||= current_member.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_box
    if params[:box].blank? or !["inbox","sent","trash"].include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end

  def initialize_breadcrumbs
    push_breadcrumb('Private Messages', conversations_path)
  end
end
