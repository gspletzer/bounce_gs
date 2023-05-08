defmodule BounceGs.Checkout do
  @moduledoc """
  This will act as our boundary layer.
  The goal is to perform any necessary validation of inputs
  to ensure we won't raise type errors in the core function module.
  """

  alias BounceGs.Checkout.Cart
  alias BounceGs.Checkout.User

  @type cart :: Cart.t()
  @type command :: :add_one | :subtract_one
  @type params :: map()
  @type status :: String.t()
  @type user :: User.t()
  @type checkout_result :: {:ok, status(), user()} | {:error, status(), user()}

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

  @doc """
  Handles implementing changes to the User struct with information captured in the form,
  makes the call to the payment processing API, and depending on result, writes transaction
  status and information to database, then returns :ok or :error with updated changes for socket
  to the front-end.

  Since I am mocking this behavior, I am not currently passing in the existing form and cart
  from the socket as I have no need for them in the simulation. However in reality those pieces
  would also be needed.
  """

  # @callback close_cart(params()) :: checkout_result // added for Mox
  @spec close_cart(params()) :: checkout_result()
  def close_cart(params) do
    user = User.new(params)

    # Here we would make a call to payment module to handle external API call to credit card service
    # something like: resp = PaymentApi.submit_payment(auth_token, request)

    # Then log the result to the transactions table via Transactions schema (example file available,
    # but not implemented for this assessment) and return tagged tuple to controller with
    # :ok or :error + changed values for socket

    # something like:
    # case resp do
    # {:ok, %{status_code: 200}} ->
    # status = "success"
    # Transaction.new(user, cart, status)
    # {:ok, status, user}
    # _ -> status = "failed"
    # Transaction.new(user, cart, status)
    # {:error, status, user}

    # This is "mocking" the behavior noted above:
    status = Enum.random(["success", "failed"])

    case status do
      "success" -> {:ok, status, user}
      "failed" -> {:error, status, user}
    end
  end
end
