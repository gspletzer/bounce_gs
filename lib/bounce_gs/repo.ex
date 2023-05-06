defmodule BounceGs.Repo do
  use Ecto.Repo,
    otp_app: :bounce_gs,
    adapter: Ecto.Adapters.Postgres
end
