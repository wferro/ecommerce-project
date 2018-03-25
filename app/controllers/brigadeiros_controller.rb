class BrigadeirosController < ApplicationController
  def index
    @brigadeiros = Brigadeiro.all.order(name: :asc)
  end
end
