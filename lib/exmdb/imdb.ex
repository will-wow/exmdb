defmodule Exmdb.Imdb do
  @imdb "https://www.imdb.com"

  @callback fetch_page(String.t(), keyword) :: String.t()
  @spec fetch_page(String.t(), keyword) :: String.t()
  def fetch_page(path, params \\ []) do
    "#{@imdb}#{path}"
    |> HTTPoison.get!([], params: params)
    |> Map.get(:body)
  end
end
