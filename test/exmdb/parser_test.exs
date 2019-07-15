defmodule Exmdb.ParserTest do
  use ExUnit.Case

  alias Exmdb.Parser

  test "find_actor_path" do
    html = File.read!("test/exmdb/search.html")

    assert Parser.find_actor_path(html) == "/name/nm0262635/?ref_=fn_nm_nm_1"
  end

  test "find_movie_actor_names" do
    html = File.read!("test/exmdb/movie.html")

    assert Parser.find_movie_actor_names(html) == ["Robert Downey Jr."]
  end

  test "find_actor_movies" do
    html = File.read!("test/exmdb/actor.html")

    assert Parser.find_actor_movies(html, 2) == [
             "/title/tt4154796/?ref_=nm_flmg_act_5",
             "/title/tt4154664/?ref_=nm_flmg_act_6"
           ]
  end
end
