class BrigadeirosController < ApplicationController
  def index
    @brigadeiros = Brigadeiro.all.order(name: :asc)
  end

  def show
    @brigadeiro = Brigadeiro.find(params[:id])
  end
end
