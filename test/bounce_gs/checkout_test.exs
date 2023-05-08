defmodule BounceGs.CheckoutTest do
  use ExUnit.Case
  # import Mox

  alias BounceGs.Checkout
  alias BounceGs.Checkout.Cart
  # alias BounceGs.Checkout.User

  describe "new/0" do
    test "should return tuple with cart struct and results of generating user changeset" do
      {cart, _user} = Checkout.new()

      assert cart.bags == 1
      assert cart.total == "$5.90"
    end
  end

  describe "update_cart/1" do
    test "should return a cart with one additional bag when command is :add_one" do
      cart = %Cart{bags: 2, total: "$11.80"}
      result = %Cart{bags: 3, total: "$17.70"}

      assert result == Checkout.update_cart(:add_one, cart)
    end

    test "should return a cart with one less bag when command is :subtract_one" do
      cart = %Cart{bags: 2, total: "$11.80"}
      result = %Cart{bags: 1, total: "$5.90"}

      assert result == Checkout.update_cart(:subtract_one, cart)
    end
  end

  # TODO: Fix stub to resolve flakiness of close_cart tests

  # describe "close_cart/1" do
  #   setup do
  #     [
  #       params: %{
  #         "name" => "Fake Name",
  #         "email" => "fake@email.com",
  #         "ccn" => "1234432112344321"
  #       },
  #       user: %User{name: "Fake Name", email: "fake@email.com", ccn: "1234432112344321"}
  #     ]
  #   end

  #   test "should return an ok tuple when payment successfully processed", context do
  #     stub_status = "success"
  #     user = context.user
  #     params = context.params

  #     BounceGs.CheckoutMock
  #     |> stub(:close_cart, fn _params -> {:ok, stub_status, user} end)
  #     |> IO.inspect(label: "stub is working")

  #     {:ok, status, _user} = Checkout.close_cart(params)

  #     assert "success" == status
  #   end

  #   test "should return :error tuple when payment is not successful", context do
  #     stub_status = "failed"
  #     user = context.user
  #     params = context.params

  #     BounceGs.CheckoutMock
  #     |> stub(:close_cart, fn _params -> {:error, stub_status, user} end)

  #     {:error, status, _user} = Checkout.close_cart(params)

  #     assert "failed" == status
  #   end
  # end
end
