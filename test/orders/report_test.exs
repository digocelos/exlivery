defmodule Exlivery.Order.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: AgentOrder
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "createsd the report file" do
      AgentOrder.start_link(%{})

      :order
      |> build()
      |> AgentOrder.save()

      :order
      |> build()
      |> AgentOrder.save()

      expected_response =
        "12345678900,pizza,1,35.5japonesa,2,20.50,76.50\n" <>
          "12345678900,pizza,1,35.5japonesa,2,20.50,76.50\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
