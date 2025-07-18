defmodule SmartSchool.Schemas.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string
    field :code, :string
    field :region, :string
    has_many :users, SmartSchool.Schemas.User

    timestamps()
  end

  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :code, :region])
    |> update_change(:code, &String.upcase/1)
    |> validate_required([:name, :code, :region])
    |> unique_constraint(:name)
    |> unique_constraint(:code)
  end
end
