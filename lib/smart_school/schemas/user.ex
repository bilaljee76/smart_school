defmodule SmartSchool.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :cnic, :string
    belongs_to :role, SmartSchool.Schemas.Role
    belongs_to :country, SmartSchool.Schemas.Country
    timestamps()

    def changeset(user, attrs) do
      user
      |> cast(attrs, [:name, :age, :email, :cnic, :country_id, :role_id])
      |> validate_required([:name, :age, :email, :cnic])
      |> unique_constraint(:email)
      |> unique_constraint(:cnic)
      |> foreign_key_constraint(:role_id)
      |> validate_length(:cnic, is: 13)
    end
  end
end
