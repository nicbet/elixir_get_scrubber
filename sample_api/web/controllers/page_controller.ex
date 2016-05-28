defmodule SampleApi.PageController do
  use SampleApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
