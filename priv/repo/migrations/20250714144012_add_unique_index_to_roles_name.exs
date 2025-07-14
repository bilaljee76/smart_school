defmodule SmartSchool.Repo.Migrations.AddUniqueIndexToRolesName do
  use Ecto.Migration

  def change do
    create unique_index(:roles, [:name])
  end
end
