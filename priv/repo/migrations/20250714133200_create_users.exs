defmodule SmartSchool.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :cnic, :string
      add :role_id, references(:roles, on_delete: :nothing)
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:cnic])
  end
end
