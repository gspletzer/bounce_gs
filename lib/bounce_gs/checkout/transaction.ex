# defmodule BounceGs.Checkout.Transaction do
#   use TypedEctoSchema
#   alias BounceGs.Checkout.User

#   @moduledoc """
#   This is a placeholder file to represent plans for Transaction schema that will be used
#   to track booking transactions. There is a database generated for the project, but no
#   tables were added for the purpose of this assessment. A diagram of what I imagine the
#   database setup to look like is included in the README file.
#   """

#   typed_schema "transactions" do
#     belongs_to(:user, User, foreign_key: :user_id)
#     field :bag_count, :integer
#     field :total, :string
#     field :status, :string
#     timestamps()
#   end

#   @doc """
#   Constructs a Transaction and writes to the database.
#   """

#   def log(user_id, %{bags: bag_count, total: total}, status) do
#     new_transaction(user_id, bag_count, total, status)
#     |> BounceGs.Repo.insert()
#   end

#   defp new_transaction(user_id, bag_count, total, status) do
#     now = Timex.now()

#     params = %{
#       user_id: user_id,
#       bag_count: bag_count,
#       total: total,
#       status: status,
#       inserted_at: now,
#       updated_at: now
#     }

#     Ecto.Changeset.change(%__MODULE__{}, params)
#   end
# end
