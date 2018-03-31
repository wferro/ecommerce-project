class BrigadeirosController < ApplicationController
  def index

    @categories = Chocoball.all
    @quantities = [5,10,15,20]
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

  def addCart
    id = params[:id].to_i
    session[:my_cart] ||= []
    session[:my_cart] << id
    @cartItems = Brigadeiro.find(session[:my_cart])
    redirect_to customers_path
  end
end
