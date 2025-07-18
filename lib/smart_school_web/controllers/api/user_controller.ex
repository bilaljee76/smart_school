# Controller for UserController

defmodule SmartSchoolWeb.Api.UserController do
  use SmartSchoolWeb, :controller

  alias SmartSchool.Users
  alias SmartSchool.Repo

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user(id)
    render(conn, :show, user: user)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        user = Repo.preload(user, :country)

        conn
        |> put_status(:created)
        |> put_resp_header("location", "/api/users/#{user.id}")
        |> render(:show, user: user)

      {:error, changeset} ->
        errors = Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} -> msg end)
        json(conn, %{errors: errors})
    end
  end

  def count_by_country(conn, %{"country_id" => country_id}) do
    count = Users.list_user_count_by_country(String.to_integer(country_id))
    json(conn, %{count: count})
  end
end
