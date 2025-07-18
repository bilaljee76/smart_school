defmodule SmartSchoolWeb.Api.CountryJSON do
  alias SmartSchool.Schemas.Country

  def index(%{countries: countries}) do
    for country <- countries do
      %{
        id: country.id,
        name: country.name,
        code: country.code,
        region: country.region,
        inserted_at: country.inserted_at,
        updated_at: country.updated_at
      }
    end
  end

  def show(%{country: %Country{} = country}) do
    %{
      id: country.id,
      name: country.name,
      code: country.code,
      region: country.region,
      inserted_at: country.inserted_at,
      updated_at: country.updated_at
    }
  end

  def render(:show, %{country: country}) do
    %{
      data: %{
        id: country.id,
        name: country.name,
        code: country.code,
        region: country.region,
        inserted_at: country.inserted_at,
        updated_at: country.updated_at
      }
    }
  end
end

# This module defines the JSON representation of a country, including its attributes and how to render it
# in different contexts, such as listing all countries or showing a specific country.
# It is used in the API to format the response data for clients.
# The `index/1` function formats a list of countries, while the `show/1` function formats a single country.
# The `render/2` function is used to render the country data in a specific format for the API response.
# This module is typically used in conjunction with a controller that fetches the country data from the database
# and passes it to the view for rendering.
# The `Country` schema is expected to have fields like `id`, `name`, `code`, `region`, `inserted_at`, and `updated_at`.
# The JSON representation includes these fields to provide a complete view of the country data.
# This module is part of the SmartSchool web application, specifically for handling API requests related to countries.
