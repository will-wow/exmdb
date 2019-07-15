# ExMDB

An Elixir IMDB Scraper, for an ElixirLA talk.

## Mix Tasks

To get a list of an actor's most common co-stars:

```bash
time mix best_friends "Chris Evans" 4
```

To more quickly get a list of an actor's most common co-stars:

```bash
time mix best_friends "Chris Evans" 4 async
```

## Phoenix

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
