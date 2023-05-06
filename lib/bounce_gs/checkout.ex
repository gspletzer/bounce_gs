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

  def close_cart(_form, params, _cart) do
    user = User.new(params)

    # Here we would make a call to payment module to handle external API call to credit card service
    # something like: resp = PaymentApi.submit_payment(auth_token, request)

    # Then log the result to the transactions table via Transactions schema (does not currently exist)
    # and return tagged tuple to controller with :ok or :error + changed values for socket

    # something like:
    # case resp do
    # {:ok, %{status_code: 200}} ->
    # status = "success"
    # Transaction.new(user, cart, status)
    # {:ok, status, user}
    # _ -> status = "failed"
    # Transaction.new(user, cart, status)
    # {:error, status, user}

    # This is "mocking" that behavior:
    status = Enum.random(["success", "failed"])

    case status do
      "success" -> {:ok, status, user}
      "failed" -> {:error, status, user}
    end
  end
end
