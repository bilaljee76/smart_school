defmodule SmartSchool.Repo.Migrations.AddCountryIdInUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :country_id, references(:countries, on_delete: :nothing)
    end
  end
end
