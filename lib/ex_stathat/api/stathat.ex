defmodule ExStathat.API.Stathat do
  use HTTPoison.Base

  @base_url "https://api.stathat.com/"

  def post(params) when is_list(params) do
    params
    |> URI.encode_query()
    |> post()
  end

  def post(params) when is_binary(params) do
    post("ez?ezkey=#{ezkey()}&" <> params, [])
  end

  def process_url(path) do
    @base_url <> path
  end

  defp ezkey do
    Application.get_env(:ex_stathat, :ezkey)
  end
end
