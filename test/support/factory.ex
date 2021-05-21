defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Rodrigo",
      email: "rodrigo@banana.com",
      cpf: "12345678900",
      age: 27,
      address: "Rua 1"
    }
  end

  def item_factory do
    %Item{
      description: "Prizza de peperoni",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua 1",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "12345678900"
    }
  end
end
