defmodule Mix.Tasks.BestFriends do
  use Mix.Task

  alias Exmdb.Friends

  @shortdoc "Find the best friends of an actor"
  def run([actor_name]), do: run([actor_name, "4", "sync"])
  def run([actor_name, movie_count]), do: run([actor_name, movie_count, "sync"])

  def run([actor_name, movie_count, concurrency]) do
    Mix.Task.run("app.start", [])

    {movie_count, ""} = Integer.parse(movie_count)

    case concurrency do
      "sync" -> Friends.find_best_friends(actor_name, movie_count)
      "async" -> Friends.find_best_friends_async(actor_name, movie_count)
    end
    |> IO.inspect()
  end
end
