defmodule BounceGsWeb.BounceLive do
  use Phoenix.LiveView
  import BounceGsWeb.CoreComponents

  def mount(_params, _session, socket) do
    {cart, user} = BounceGs.initialize_cart()

    {:ok, assign(socket, :cart, cart) |> assign(:form, to_form(user)) |> assign(:status, "new")}
  end

  def handle_event("add_one", _unsigned_params, socket) do
    updated_cart = BounceGs.update_cart(:add_one, socket.assigns.cart)

    {:noreply, assign(socket, :cart, updated_cart)}
  end

  def handle_event("subtract_one", _unsigned_params, socket) do
    updated_cart = BounceGs.update_cart(:subtract_one, socket.assigns.cart)
    {:noreply, assign(socket, :cart, updated_cart)}
  end

  def handle_event("submit", %{"user" => params}, socket) do
    case BounceGs.close_cart(socket.assigns.form, params, socket.assigns.cart) do
      {:ok, status, _user} ->
        {:noreply,
         assign(socket, :status, status)
         |> put_flash(:info, "Placing Booking ...")
         |> redirect(to: "/success")}

      {:error, status, user} ->
        {:noreply, assign(socket, :status, status) |> assign(:form, to_form(user))}
    end
  end
end
