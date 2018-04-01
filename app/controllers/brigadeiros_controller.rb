load 'CartItem.rb'
class BrigadeirosController < ApplicationController
before_action :load_provinces
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
    session[:my_cart] ||= []
    b = Brigadeiro.find(params[:id])
    session[:my_cart] << CartItem.new(params[:qtd], b)
    flash[:message] = " #{params[:qtd]} brigadeiros of  #{b.name}  added succesfuly to your cart"
    redirect_to cart_path
  end

  def removeCart
    session[:my_cart] = []
    redirect_to root_path
  end

  def load_provinces
    @provinces = Brigadeiro.all
  end
end
