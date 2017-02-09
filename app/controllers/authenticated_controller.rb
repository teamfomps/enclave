class AuthenticatedController < ApplicationController
  before_action :authenticate_member!
  before_action :create_breadcrumbs_array
  layout 'authenticated'
  helper_method :nav_heading

  protected

  def nav_heading
    @nav_heading ||= controller_name
  end

  def push_breadcrumb(title, path)
    crumb = OpenStruct.new
    crumb.title = title
    crumb.path = path
    @breadcrumbs << crumb
  end

  def create_breadcrumbs_array
    @breadcrumbs = []
    initialize_breadcrumbs
  end

  def initialize_breadcrumbs
  end
end
