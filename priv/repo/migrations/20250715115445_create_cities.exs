defmodule SmartSchool.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string
      add :code, :string
      add :country_id, references(:countries, on_delete: :delete_all)

      timestamps()
    end

    # Ensure city names are unique
    create unique_index(:cities, [:name])
    # code must be unique within each country
    create unique_index(:cities, [:code, :country_id])
    # Ensure each country can have multiple cities and useful for join queries
    create unique_index(:cities, [:country_id])
  end
end
