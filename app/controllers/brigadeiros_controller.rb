class BrigadeirosController < ApplicationController
  def index
    @brigadeiros = Brigadeiro.all
  end
end
