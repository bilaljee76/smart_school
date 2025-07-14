defmodule SmartSchool.Schemas.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string
    field :description, :string
    has_many :user, SmartSchool.Schemas.User
    timestamps()

    # Define the changeset function for the Role schema
    def changeset(role, attrs) do
      role
      |> cast(attrs, [:name, :description])
      |> validate_required([:name, :description])
    end
  end
end
