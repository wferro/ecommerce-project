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
    st = Status.where("name = 'AWAITING_PAYMENT'").first
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
      total: total * 100,
      pst: total * province.pst,
      gst: total * province.gst,
      status: st)

    @cartItems.each do |i|
      brigadeiro = Brigadeiro.find(i['brigadeiro']['id'])
      OrderItem.create(
        quantity: i['quantity'].to_i,
        total: brigadeiro.chocoball.price + brigadeiro.sprinkle.price,
        brigadeiro: brigadeiro,
        order: order)
  	end
    session[:new_order] = Order.find(order.id)
  end

  def order
    Stripe.api_key = "sk_test_hchL9UYFMBH7AbndbI7ukDmU"
    charge = Stripe::Charge.create({
      statement_descriptor: 'Chocoball Store',
      amount: session[:new_order]['total'] + session[:new_order]['pst'] + session[:new_order]['gst'],
      currency: 'cad',
      source: 'tok_visa',
      receipt_email: 'wferro@rrc.ca',
    })
# charge = Stripe::Charge.create({statement_descriptor: 'Chocoball Store',amount: 123,currency: 'cad',source:
# {exp_month: '10',exp_year: '20',number: '4012888888881881',object: 'card',cvc: '123'},receipt_email: 'wferro@rrc.ca'})
# Stripe::CardError: (Status 402) (Request req_MSFcHp6F991Cop) Sending credit card numbers directly to the Stripe API
# is generally unsafe. We suggest you use test tokens that map to the test card you are using, see https://stripe.com/docs/testing.
    order = Order.find(session[:new_order]['id'])
    order.paymentInfo = charge['id']
    order.status = Status.where("name = 'ACCEPTED'").first
    order.save
    flash[:success] = "Order FINALLY placed. Payment  #{order.paymentInfo}  succesfuly accepted"
  end

  def load_provinces
    @provinces = Province.all
  end

end
