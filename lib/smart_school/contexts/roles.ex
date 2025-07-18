defmodule SmartSchool.Roles do
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
    Repo.get_by(SmartSchool.Schemas.Role, name: name)
  end

  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  # change role using fomr handling
  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end
end
