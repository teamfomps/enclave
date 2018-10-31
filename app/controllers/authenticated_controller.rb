class AuthenticatedController < ApplicationController
  before_action :authenticate_member!
  before_action :create_breadcrumbs_array
  before_action :register_member_activity
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

  # Controllers that subclass AuthenticatedController can override this method,
  # but an empty method needs to exist here as a fallback
  def initialize_breadcrumbs
  end

  def register_member_activity
    current_member.update(last_active_at: Time.zone.now)
  end
end
