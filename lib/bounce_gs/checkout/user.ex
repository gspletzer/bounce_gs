defmodule BounceGs.Checkout.User do
  @moduledoc """
  This is a core function layer.

  For the purpose of this assessment, it will handle generating
  a Schemaless changeset to utilize Tailwind form to capture user details
  during booking.

  In a production level version of this product, I would define a user schema,
  rather than using a schemaless changeset. This would allow tracking for both
  verified users and guest users (assuming guests use the same email each time they book).
  This would also include functionality for updating a user's information.

  I also wouldn't include billing information as part of the user schema in the production
  version. I envision that living on it's own table with reference to the user_id, or being
  handled by a third party service like Stripe.
  """

  defstruct [:name, :email, :ccn]
  @type t :: Ecto.Changeset.t()

  @spec new(nil | map()) :: t()
  def new(params \\ %{"name" => "", "email" => "", "ccn" => ""}) do
    user = %__MODULE__{}
    types = %{name: :string, email: :string, ccn: :string}

    Ecto.Changeset.cast({user, types}, params, Map.keys(types))
  end
end
