defmodule SmartSchool.Schemas.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :name, :string
    field :code, :string

    belongs_to :country, SmartSchool.Schemas.Country

    timestamps()
  end

  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :code, :country_id])
    |> validate_required([:name, :code, :country_id])
    |> unique_constraint(:name)
    # must match your index name from migration (create unique_index(:cities, [:code, :country_id]))
    |> unique_constraint(:code, name: :cities_code_country_id_index)
  end
end
