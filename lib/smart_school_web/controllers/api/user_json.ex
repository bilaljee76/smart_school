# view of the user in json format
defmodule SmartSchoolWeb.Api.UserJSON do
  alias SmartSchool.Schemas.User

  def index(%{users: users}) do
    for user <- users do
      %{
        id: user.id,
        name: user.name,
        age: user.age,
        email: user.email,
        cnic: user.cnic,
        password: user.password,
        role_id: user.role_id,
        role_name: user.role && user.role.name,
        country_id: user.country_id,
        country_name: user.country && user.country.name,
        inserted_at: user.inserted_at,
        updated_at: user.updated_at
      }
    end
  end

  def show(%{user: %User{} = user}) do
    %{
      id: user.id,
      name: user.name,
      age: user.age,
      email: user.email,
      cnic: user.cnic,
      password: user.password,
      role: user.role.name,
      country: user.country.name,
      inserted_at: user.inserted_at,
      updated_at: user.updated_at
    }
  end

  def render(:show, %{user: user}) do
    %{
      data: %{
        id: user.id,
        name: user.name,
        age: user.age,
        email: user.email,
        cnic: user.cnic,
        password: user.password,
        role: user.role.name,
        country: user.country.name,
        inserted_at: user.inserted_at,
        updated_at: user.updated_at
      }
    }
  end

  def render("login.json", %{user: user}) do
    %{
      message: "Login successful",
      user: %{
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role.name,
        country: user.country.name
      }
    }
  end
end
