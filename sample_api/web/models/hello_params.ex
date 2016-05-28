defmodule SampleApi.HelloParams do
  use SampleApi.Web, :model

  schema "HelloParams" do
    field :name, :string
    field :age, :integer
  end

  @required_fields ~w(name age)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_number(:age, greater_than_or_equal_to: 1, less_than_or_equal_to: 120)
  end
end
