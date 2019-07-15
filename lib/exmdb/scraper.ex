defmodule Exmdb.Scraper do
  alias Exmdb.Parser
  alias Exmdb.Imdb

  @imdb Application.get_env(:exmdb, :imdb, Imdb)

  def fetch_actor_path(actor_name) do
    "/find"
    |> @imdb.fetch_page(q: actor_name, exact: true, s: "nm")
    |> Parser.find_actor_path()
  end

  def fetch_actor_movies(actor_path, movie_count) do
    actor_path
    |> @imdb.fetch_page()
    |> Parser.find_actor_movies(movie_count)
  end

  def fetch_movie_actor_names(movie_path) do
    movie_path
    |> @imdb.fetch_page()
    |> Parser.find_movie_actor_names()
  end
end
