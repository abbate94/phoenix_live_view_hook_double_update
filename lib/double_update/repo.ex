defmodule DoubleUpdate.Repo do
  use Ecto.Repo,
    otp_app: :double_update,
    adapter: Ecto.Adapters.Postgres
end
