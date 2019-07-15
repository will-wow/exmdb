defmodule Exmdb.Parser do
  def find_actor_path(search_page) do
    search_page
    |> Floki.find(".result_text")
    |> List.first()
    |> Floki.find("a")
    |> List.first()
    |> Floki.attribute("href")
    |> List.first()
  end

  def find_actor_movies(actor_page, movie_count) do
    actor_page
    |> Floki.find(".filmo-category-section .filmo-row")
    |> Enum.filter(fn row ->
      # Filter out movies that may not have a full cast list.
      Floki.find(row, ".in_production") == []
    end)
    |> Enum.take(movie_count)
    |> Enum.map(fn row ->
      row
      |> Floki.find("a")
      |> Floki.attribute("href")
      |> List.first()
    end)
  end

  def find_movie_actor_names(movie_page) do
    movie_page
    |> Floki.find(".cast_list tr")
    |> Enum.map(fn row ->
      row
      |> Floki.find("td")
      |> Enum.fetch(1)
      |> case do
        {:ok, td} -> Floki.text(td) |> String.trim()
        _ -> nil
      end
    end)
    |> Enum.reject(&is_nil/1)
  end
end
