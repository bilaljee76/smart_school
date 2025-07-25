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
    Repo.all(User) |> Repo.preload([:role, :country])
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

  def list_user_count_by_country(country_id) do
    from(u in User, where: u.country_id == ^country_id)
    |> Repo.aggregate(:count, :id)
  end

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
    |> Repo.preload(:role)
  end


# Add authenticate user
def authenticate_user(email, password) do
  case get_user_by_email(email) do
    nil ->
      {:error, "User not found"}

    user ->
      if Bcrypt.verify_pass(password, user.password) do
        SmartSchool.SlackNotifier.send_login_notification(user)
        # Preload the user with role and country in user_controller
        {:ok, user}
      else
        {:error, "Invalid password "}
      end
  end
end



end
