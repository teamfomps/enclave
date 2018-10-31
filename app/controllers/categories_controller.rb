class CategoriesController < AuthenticatedController
  def show
    @category = Category.find(params[:id])
    @discussions = @category.discussions
    push_breadcrumb(@category.name, category_path(@category))
  end

  def index
    @categories = Category.order('name ASC').all
  end

  protected

  def set_nav_heading
    @nav_heading = 'discussions'
  end

  def initialize_breadcrumbs
    push_breadcrumb('Discussions', discussions_path)
    push_breadcrumb('Categories', categories_path)
  end
end
