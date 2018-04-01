load 'CartItem.rb'
class CustomerController < ApplicationController
  before_action :load_cart
  before_action :load_provinces
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
    province = Province.find(params[:address_province].to_i)
    st = Status.where("name = 'AWAITING_PAYMENT'")
    user = User.create(name: params['customer_name'], email: params['customer_email'], phone: params['customer_phone'])

    address = Address.create(
      location: params['address_location'],
      postal_code: params['address_postal'],
      additional_info: params['address_info'],
      user: user,
      province: province)

    session[:delivery_address] = address

    total = 0
    @cartItems.each do |i|
			total = total + i['subtotal'].to_f
		end

    order = Order.create(
      user: user,
      total: total,
      pst: total * province.pst / 100,
      gst: total * province.gst / 100,
      status_id: st.id)

  end

  def order
  end

  def load_provinces
    @provinces = Province.all
  end

end
