# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SmartSchool.Repo.insert!(%SmartSchool.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SmartSchool.Accounts

[
  "Super Admin",
  "Asmin",
  "Teacher",
  "Staff",
  "Student"
]
|> Enum.each(fn name ->
  Accounts.create_role(%{
    name: name,
    description: "#{name} role"
  })
end)
