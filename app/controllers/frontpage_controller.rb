class FrontpageController < AuthenticatedController
  before_action :set_nav_heading
  def index
    @discussions = Discussion.all.order('updated_at DESC').paginate(page: params[:page], per_page: 30)
  end

  private

  def set_nav_heading
    @nav_heading = 'discussions'
  end
end
