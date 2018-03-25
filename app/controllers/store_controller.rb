class StoreController < ApplicationController
  def contact
    @views = View.where('title = "contact"')
  end

  def about
    @views = View.where('title = "about"')
  end
end
