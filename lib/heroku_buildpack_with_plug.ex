defmodule HerokuBuildpackWithPlug do
  import Plug.Connection

  def init(options) do
    # initialize options

    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end

IO.puts "Running HerokuBuildpackWithPlug with Cowboy on http://localhost:4000"
Plug.Adapters.Cowboy.http HerokuBuildpackWithPlug, []
