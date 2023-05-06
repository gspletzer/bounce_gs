defmodule BounceGsWeb.BounceLive do
  use Phoenix.LiveView
  import BounceGsWeb.CoreComponents

  def mount(_params, _session, socket) do
    {cart, user} = BounceGs.initialize_cart()

    {:ok, assign(socket, :cart, cart) |> assign(:form, to_form(user))}
  end

  def handle_event("add_one", _unsigned_params, socket) do
    updated_cart = BounceGs.update_cart(:add_one, socket.assigns.cart)

    {:noreply, assign(socket, :cart, updated_cart)}
  end

  def handle_event("subtract_one", _unsigned_params, socket) do
    if socket.assigns.cart.bags == 1 do
      {:noreply, assign(socket, :cart, socket.assigns.cart)}
    else
      updated_cart = BounceGs.update_cart(:subtract_one, socket.assigns.cart)
      {:noreply, assign(socket, :cart, updated_cart)}
    end
  end

  # def handle_event("submit", %{user => user}, socket) do

  # end
end
