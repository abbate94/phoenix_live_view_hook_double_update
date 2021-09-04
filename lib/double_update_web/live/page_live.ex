defmodule DoubleUpdateWeb.PageLive do
  use DoubleUpdateWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), {:loop1, 0}, 4000)
    Process.send_after(self(), {:loop2, 0}, 4000)

    {:ok, socket, temporary_assigns: [log1: [], log2: []]}
  end

  @impl true
  def handle_info({:loop1, id}, socket) do
    if id < 2, do: Process.send_after(self(), {:loop1, id + 1}, 4000)
    {:noreply, assign(socket, log1: [{id, "log1_msg"}])}
  end

  @impl true
  def handle_info({:loop2, id}, socket) do
    if id < 2, do: Process.send_after(self(), {:loop2, id + 1}, 4000)
    {:noreply, assign(socket, log2: [{id, "log2_msg"}])}
  end
end
