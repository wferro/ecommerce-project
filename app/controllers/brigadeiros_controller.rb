class BrigadeirosController < ApplicationController
  def index

    @categories = Chocoball.all
    @keyword = params[:key_word]
    @catword = params[:cat]

    if !@keyword.blank?
      if !@catword.blank?
        @brigadeiros = Brigadeiro.where("name LIKE :query", query: "%#{params[:key_word]}%").where(chocoball: @catword)
      else
        @brigadeiros = Brigadeiro.where("name LIKE :query", query: "%#{params[:key_word]}%").order(name: :asc)
      end
    else
      if !@catword.blank?
        @brigadeiros = Brigadeiro.where(chocoball: @catword).order(name: :asc)
      else
        @brigadeiros = Brigadeiro.all.order(name: :asc)
      end
    end
  end

  def show
    @brigadeiro = Brigadeiro.find(params[:id])
  end
end
