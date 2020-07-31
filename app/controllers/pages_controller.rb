class PagesController < ApplicationController
  def index
  	@landscapes = Landscape.all.sort_by(&:created_at).reverse
  end

  def profile; end
  def user_form; end
end
