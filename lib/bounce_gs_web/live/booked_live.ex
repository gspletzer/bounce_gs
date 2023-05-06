defmodule BounceGsWeb.BookedLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :status, "booked")}
  end
end
