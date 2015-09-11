class HomeController < ApplicationController

  def index
    @active_highlights = Highlight.where(is_active: true)
    @releases = Product.where(is_new_release: true)
  end

end
