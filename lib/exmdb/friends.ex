defmodule Exmdb.Friends do
  alias Exmdb.Scraper

  def find_best_friends(name, movie_count) do
    name
    |> Scraper.fetch_actor_path()
    |> Scraper.fetch_actor_movies(movie_count)
    |> Enum.flat_map(&Scraper.fetch_movie_actor_names/1)
    |> aggregate_friends(name)
  end

  def find_best_friends_async(name, movie_count) do
    name
    |> Scraper.fetch_actor_path()
    |> Scraper.fetch_actor_movies(movie_count)
    |> Task.async_stream(fn movie_path -> Scraper.fetch_movie_actor_names(movie_path) end)
    |> Enum.flat_map(fn {:ok, names} -> names end)
    |> aggregate_friends(name)
  end

  def aggregate_friends(names, main_name) do
    names
    |> Enum.reject(fn name -> name === main_name end)
    |> Enum.group_by(fn x -> x end)
    |> Enum.map(fn {name, names} -> {name, length(names)} end)
    |> Enum.sort_by(fn {_, count} -> count end, &>=/2)
    |> Enum.take(10)
  end
end
