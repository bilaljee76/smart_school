# Controller of CountryController

defmodule SmartSchoolWeb.Api.CountryController do
  use SmartSchoolWeb, :controller

  alias SmartSchool.Countries

  def index(conn, _params) do
    # list_user() is function in contexts/contries.ex
    countries = Countries.list_countries()
    render(conn, :index, countries: countries)
  end

  def show(conn, %{"id" => id}) do
    # get_country() is function in contexts/contries.ex
    country = Countries.get_country(id)

    render(conn, :show, country: country)
  end

  def create(conn, %{"country" => country_params}) do
    # create_country() is function in contexts/contries.ex
    case Countries.create_country(country_params) do
      {:ok, country} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", "api/countries/#{country.id}")
        |> render(:show, country: country)

      {:error, changeset} ->
        errors = Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} -> msg end)
        json(conn, %{errors: errors})
    end
  end

  def user_counts(conn, _params) do
    # list_countries_with_user_count() is function in contexts/contries.ex
    countries = Countries.list_countries_with_user_count()
    json(conn, countries)
  end
end
