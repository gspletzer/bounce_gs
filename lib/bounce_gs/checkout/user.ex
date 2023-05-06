defmodule BounceGs.Checkout.User do
  @moduledoc """
  This is a core function layer.any()

  It will handle generating a Schemaless changeset to utilize
  Tailwind form for capturing user details in booking.
  """

  defstruct [:name, :email, :ccn]
  @type t :: Ecto.Changeset.t()

  @spec new(nil | map()) :: t()
  def new(params \\ %{"name" => "", "email" => "", "ccn" => ""}) do
    user = %__MODULE__{}
    types = %{name: :string, email: :string, ccn: :string}

    Ecto.Changeset.cast({user, types}, params, Map.keys(types))
  end

  # def update(user, params) do
  #   Ecto.Changeset.change(user, params)
  # end
end
