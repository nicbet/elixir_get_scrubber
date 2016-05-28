defmodule SampleApi.Helpers do

  def changeset_errors(changeset) do
     changeset.errors
     |> Enum.map(fn {k, v} -> "Parameter #{k} #{render_detail(v)}" end)
  end

  defp render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end
  defp render_detail(message) do
    message
  end

  def scrub_get_params(conn, _opts) do
     params = conn.params |> Enum.reduce(%{}, &scrub/2 )
     %{conn | params: params}
  end
  defp scrub({k, ""}, acc) do
    Map.put(acc, k, nil)
  end
  defp scrub({k, v}, acc) do
    Map.put(acc, k, v)
  end

end
