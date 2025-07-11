defmodule SmartSchool.Repo do
  use Ecto.Repo,
    otp_app: :smart_school,
    adapter: Ecto.Adapters.Postgres
end
