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

  def mark_as_read
    @conversation.mark_as_read(current_member)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(current_member)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_member).update_all(deleted: true)
    end
    flash[:success] = 'Your trash was cleaned!'
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
end
