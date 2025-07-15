defmodule SmartSchool.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string
      add :code, :string
      add :region, :string

      timestamps()
    end

    create unique_index(:countries, [:name])
    create unique_index(:countries, [:code])
  end
end
