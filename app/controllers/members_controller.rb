class MembersController < AuthenticatedController
  def index
    @members = Member.all.order('last_name ASC')
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
