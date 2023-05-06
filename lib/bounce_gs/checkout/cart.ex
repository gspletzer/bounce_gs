defmodule BounceGs.Checkout.Cart do
  @moduledoc """
  This is a core function module.

  It will handle:
    - instantiating a new cart
    - adding a bag to the cart and adjusting the total
    - subtracting a bag from the cart and adjusting the total
    -
  """
  defstruct [:bags, :total]
  @unit_price 5_90

  @type bag_count :: integer()
  @type current_total :: String.t()
  @type t :: %__MODULE__{bags: bag_count, total: current_total}

  @spec new(bag_count()) :: t()
  def new(bags \\ 1) do
    total = bags * @unit_price
    %__MODULE__{bags: bags, total: Money.to_string(Money.new(total, :USD))}
  end

  @spec add_one(t()) :: t()
  def add_one(%__MODULE__{bags: bags} = cart) do
    new_bags = bags + 1
    new_total = new_bags * @unit_price
    %{cart | bags: new_bags, total: Money.to_string(Money.new(new_total, :USD))}
  end

  @spec subtract_one(t()) :: t()
  def subtract_one(%__MODULE__{bags: bags} = cart) do
    new_bags = bags - 1
    new_total = new_bags * @unit_price
    %{cart | bags: new_bags, total: Money.to_string(Money.new(new_total, :USD))}
  end
end
