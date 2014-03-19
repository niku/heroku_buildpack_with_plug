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

port = System.get_env("PORT")
if port do
  IO.puts "Running HerokuBuildpackWithPlug with Cowboy on http://localhost:#{port}"
  Plug.Adapters.Cowboy.http HerokuBuildpackWithPlug, [], port: binary_to_integer(port)
else
  IO.puts "Running HerokuBuildpackWithPlug with Cowboy on http://localhost:4000"
  Plug.Adapters.Cowboy.http HerokuBuildpackWithPlug, []
end
