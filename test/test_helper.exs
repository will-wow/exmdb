ExUnit.start()

Mox.defmock(Exmdb.ImdbMock, for: Exmdb.Imdb)

Application.put_env(:exmdb, :imdb, Exmdb.ImdbMock)
