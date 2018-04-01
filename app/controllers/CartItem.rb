#Class Cart Item helper
class CartItem

  attr_reader :quantity
  attr_reader :brigadeiro
  attr_reader :subtotal

  def initialize(quantity, brigadeiro)
    @quantity = quantity
    @brigadeiro = brigadeiro
    @subtotal = @brigadeiro.getPrice * @quantity.to_f
  end

end
