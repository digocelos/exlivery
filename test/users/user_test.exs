defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rodrigo",
          "rodrigo@banana.com",
          "12345678900",
          27,
          "Rua 1"
        )

      expected = {:ok, build(:user)}

      assert response == expected
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Rodrigo",
          "rodrigo@teste.com",
          "12345678911",
          15,
          "Rua 1"
        )

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
