class DiscussionsController < AuthenticatedController
  before_action :find_discussion, except: [:new, :create, :index]
  def index
    redirect_to '/'
  end

  def show
    @comments = @discussion.comments.order('created_at ASC').all.paginate(page: params[:page], per_page: 50)
    push_breadcrumb(@discussion.name, discussion_path(@discussion))
  end

  protected

  def find_discussion
    @discussion = Discussion.find(params[:id])
  end

  def initialize_breadcrumbs
    push_breadcrumb('Discussions', discussions_path)
  end
end
