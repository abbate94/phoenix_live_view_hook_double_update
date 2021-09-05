defmodule DoubleUpdateWeb.PageLive do
  use DoubleUpdateWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket, temporary_assigns: [log1: [], log2: []]}
  end

  @impl true
  def handle_event("next1", %{}, socket) do
    {:noreply, assign(socket, log1: [{Enum.random(0..1_000_000), "log1_msg"}])}
  end

  @impl true
  def handle_event("next2", %{}, socket) do
    {:noreply, assign(socket, log2: [{Enum.random(0..1_000_000), "log2_msg"}])}
  end
end
