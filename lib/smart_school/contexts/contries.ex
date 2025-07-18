defmodule SmartSchool.Countries do
  import Ecto.Query, warn: false
  alias SmartSchool.Repo
  alias SmartSchool.Schemas.Country

  def create_country(attrs \\ %{}) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  def list_countries do
    Repo.all(Country)
  end

  def get_country(id) do
    Repo.get(Country, id)
  end

  def update_country(id, attrs) do
    country = get_country(id)

    country
    |> Country.changeset(attrs)
    |> Repo.update()
  end

  def delete_country(id) do
    country = get_country(id)

    Repo.delete(country)
  end

  def list_countries_with_user_count do
    from(c in Country,
      left_join: u in User,
      on: u.counry_id == c.id,
      group_by: c.id,
      select: %{
        "Country Code" => c.code,
        "User Count" => count(u.id)
      }
    )
    |> Repo.all()
  end
end
