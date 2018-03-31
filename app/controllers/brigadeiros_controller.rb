class BrigadeirosController < ApplicationController
  def index
    @keyword = params[:key_word]

    if @keyword
      @brigadeiros = Brigadeiro.where("name LIKE :query", query: "%#{params[:key_word]}%").order(name: :asc)
    else
      @brigadeiros = Brigadeiro.all.order(name: :asc)
    end
  end

  def show
    @brigadeiro = Brigadeiro.find(params[:id])
  end
end
