class MembersController < AuthenticatedController
  def index
    @members = Member.all.order('last_name ASC')
  end

  def show
    @member = Member.find(params[:id])
  end
end
