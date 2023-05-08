defmodule BounceGs do
  @moduledoc """
    Top-level API for the BounceGs application (backend).
  """

  alias BounceGs.Checkout

  @type cart :: Checkout.cart()
  @type checkout :: {cart(), Checkout.user()}
  @type command :: Checkout.command()
  @type params :: map()
  @type checkout_result :: Checkout.checkout_result()

  @spec initialize_cart() :: checkout()
  def initialize_cart(), do: Checkout.new()

  @spec update_cart(command(), cart()) :: cart()
  def update_cart(command, cart), do: Checkout.update_cart(command, cart)

  @spec close_cart(params()) :: checkout_result()
  def close_cart(params), do: Checkout.close_cart(params)
end
