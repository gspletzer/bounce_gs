defmodule BounceGsWeb.BounceLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :test, "TEST")}
  end
end
