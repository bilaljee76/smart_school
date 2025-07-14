defmodule SmartSchool.Repo.Migrations.TimestampCreateRoles do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      timestamps()
    end
  end
end
