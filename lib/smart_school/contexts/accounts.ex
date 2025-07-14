defmodule SmartSchool.Accounts do
  import Ecto.Query, warn: false
  alias SmartSchool.Repo
  alias SmartSchool.Schemas.Role

  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert(on_conflict: :nothing, conflict_target: :name)
  end

  def list_roles do
    Repo.all(Role)
  end

  def get_role_by_name(name) do
    Repo.get_by(Role, name: name)
  end
end
