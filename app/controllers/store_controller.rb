class StoreController < ApplicationController
  def contact
    @views = View.where('title = "contact"').order(created_at: :desc)
  end

  def about
    @views = View.where('title = "about"').order(created_at: :desc)
  end
end
