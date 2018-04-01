load 'CartItem.rb'
class CustomerController < ApplicationController
  before_action :load_cart
  def cart
    @quantities = [5,10,15,20]
  end

  def load_cart
    @cartItems = session[:my_cart]
  end

  def removeItemCart
    @cartItems.each do |i|
			if i['brigadeiro']['id'] == params['id'].to_i
				session[:my_cart].delete(i)
			end
		end
    redirect_to cart_path
  end

  def updateItemCart
    @cartItems.each do |i|
      puts i
      puts params['id'].to_i
			if i['brigadeiro']['id'] == params['id'].to_i
        session[:my_cart] << CartItem.new(params[:qtd], Brigadeiro.find(params[:id]))
        session[:my_cart].delete(i)
        break
			end
		end
    redirect_to cart_path
  end

  def checkout
  end

  def order
  end

end
