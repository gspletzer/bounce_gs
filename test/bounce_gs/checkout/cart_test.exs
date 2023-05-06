defmodule BounceGs.Checkout.CartTest do
  use ExUnit.Case

  alias BounceGs.Checkout.Cart

  describe "new/0" do
    test "should return cart struct with 1 bag and total of $5.90 when no bag count passed in" do
      result = %Cart{bags: 1, total: "$5.90"}

      assert result == Cart.new()
      assert result.bags == 1
      assert result.total == "$5.90"
    end

    test "should return cart struct with n bags and corresponding total when n bags passed in" do
      result = %Cart{bags: 3, total: "$17.70"}

      assert result == Cart.new(3)
      assert result.bags == 3
      assert result.total == "$17.70"
    end
  end

  describe "add_one/1" do
    test "should return an updated cart with one additional bag" do
      cart = %Cart{bags: 2, total: "$11.80"}
      result = %Cart{bags: 3, total: "$17.70"}

      assert result == Cart.add_one(cart)
    end
  end

  describe "subtract_one/1" do
    test "should return an updated cart with one less bag" do
      cart = %Cart{bags: 2, total: "$11.80"}
      result = %Cart{bags: 1, total: "$5.90"}

      assert result == Cart.subtract_one(cart)
    end
  end
end
