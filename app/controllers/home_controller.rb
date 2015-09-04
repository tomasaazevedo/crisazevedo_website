class HomeController < ApplicationController

  def index
    @active_highlights = Highlight.where(is_active: true)
  end

end
