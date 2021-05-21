defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Order, Item}

  describe "save/1" do
    setup do
      OrderAgent.start_link(%{})
      :ok
    end

    test "save the order" do
      order = build(:order)
      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})
      :ok
    end

    test "when the order is found, returns the order" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the user is not found, return an error" do
      response = OrderAgent.get("111")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
