defmodule SmartSchool.Users do
  import Ecto.Query, warn: false
  alias SmartSchool.Repo
  alias SmartSchool.Schemas.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def list_users do
    Repo.all(User)
    |> Repo.preload(:roles)
  end

  def get_user(id) do
    Repo.get(User, id)
    |> Repo.preload(:role)
  end

  def update_user(id, attrs) do
    user = get_user(id)

    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(id) do
    user = get_user(id)

    Repo.delete(user)
  end

  # change user using form handling
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
