class MembersController < AuthenticatedController
  def index
    @members = Member.active.order('last_name ASC')
    @sock_puppets = Member.sock_puppets.order('handle ASC')
  end

  def show
    @member = Member.find(params[:id])
    push_breadcrumb @member.full_name, member_path(@member)
  end

  private

  def initialize_breadcrumbs
    push_breadcrumb 'Member Directory', members_path
  end
end
