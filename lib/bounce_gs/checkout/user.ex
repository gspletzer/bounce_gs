defmodule BounceGs.Checkout.User do
  @moduledoc """
  This is a core function layer.any()

  It will handle generating a Schemaless changeset to utilize
  Tailwind form for capturing user details in booking.
  """

  defstruct [:name, :email, :ccn]
  @type t :: Ecto.Changeset.t()

  @spec new :: t()
  def new() do
    user = %__MODULE__{}
    types = %{name: :string, email: :string, ccn: :string}
    params = %{name: "", email: "", ccn: ""}

    Ecto.Changeset.cast({user, types}, params, Map.keys(types))
  end
end
