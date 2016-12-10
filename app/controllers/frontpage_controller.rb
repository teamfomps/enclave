class FrontpageController < AuthenticatedController
  before_action :set_nav_heading
  def index
    @discussions = []
  end

  private

  def set_nav_heading
    @nav_heading = 'discussions'
  end
end
