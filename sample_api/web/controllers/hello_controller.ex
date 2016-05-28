defmodule SampleApi.HelloController do
  use SampleApi.Web, :controller
  alias SampleApi.HelloParams
  import SampleApi.Helpers, only: [changeset_errors: 1, scrub_get_params: 2]

  plug :scrub_get_params

  def index(conn, params) do
    cs = HelloParams.changeset(%HelloParams{}, params)
    case cs do
      %{:params => %{ "age" => age, "name" => name }, :valid? => :true} ->
        conn |> text("I see, #{name} is #{age} years old!")
      _ ->
        error_msgs = changeset_errors(cs)
        conn
        |> put_status(400)
        |> text("Error, wrong parameters supplied!\nDetails: #{error_msgs}")
    end
  end
end
