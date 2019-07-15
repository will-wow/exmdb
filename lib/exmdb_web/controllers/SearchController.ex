defmodule ExmdbWeb.SearchController do
  use ExmdbWeb, :controller

  alias Exmdb.Friends

  def index(conn, %{"actor" => actor}) do
    friends = Friends.find_best_friends_async(actor, 4)

    json(conn, %{friends: friends})
  end
end
