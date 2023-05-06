defmodule BounceGs.CheckoutTest do
  use ExUnit.Case
  alias BounceGs.Checkout
  alias BounceGs.Checkout.Cart

  describe "new/0" do
    test "should return tuple with cart struct and results of generating user changeset" do
      # TODO: Find a good way to test changeset result
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

  # TODO: Add mocking behavior to test both success and failed returns in close_cart/3
end
