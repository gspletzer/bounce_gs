defmodule BounceGs.Checkout do
  @moduledoc """
  This will act as our boundary layer.
  The goal is to perform any necessary validation of inputs
  to ensure we won't raise type errors in the core function module.
  """

  alias BounceGs.Checkout.Cart
  alias BounceGs.Checkout.User

  @type cart :: Cart.t()
  @type user :: User.t()
  @type command :: :add_one | :subtract_one

  @spec new() :: {cart(), user()}
  def new() do
    {Cart.new(), User.new()}
  end

  @spec update_cart(command(), cart()) :: cart()
  def update_cart(:add_one, %Cart{} = cart) do
    Cart.add_one(cart)
  end

  def update_cart(:subtract_one, %Cart{} = cart) do
    Cart.subtract_one(cart)
  end
end
