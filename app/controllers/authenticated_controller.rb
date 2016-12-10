class AuthenticatedController < ApplicationController
  before_action :authenticate_member!
  layout 'authenticated'
  helper_method :nav_heading

  private

  def nav_heading
    @nav_heading ||= controller_name
  end
end
