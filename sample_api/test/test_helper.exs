ExUnit.start

Mix.Task.run "ecto.create", ~w(-r SampleApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SampleApi.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(SampleApi.Repo)

