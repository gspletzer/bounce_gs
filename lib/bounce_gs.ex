defmodule BounceGs do
  @moduledoc """
    Top-level API for the BounceGs application.
  """

  alias BounceGs.Checkout

  @type cart :: Checkout.cart()
  @type checkout :: {cart(), Checkout.user()}
  @type command :: Checkout.command()
  @type params :: map()

  @spec initialize_cart() :: checkout()
  def initialize_cart(), do: Checkout.new()

  @spec update_cart(command(), cart()) :: cart()
  def update_cart(command, cart), do: Checkout.update_cart(command, cart)

  def close_cart(form, params, cart), do: Checkout.close_cart(form, params, cart)
end
