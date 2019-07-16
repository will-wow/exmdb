defmodule ExmdbWeb.BestFriendController do
  use ExmdbWeb, :controller

  alias Exmdb.Friends

  def index(conn, %{"actor" => actor, "movie_count" => movie_count}) do
    {movie_count, ""} = Integer.parse(movie_count)

    friends =
      Friends.find_best_friends_async(actor, movie_count)
      |> Enum.map(fn {actor, count} -> %{actor: actor, count: count} end)

    json(conn, %{friends: friends})
  end
end
