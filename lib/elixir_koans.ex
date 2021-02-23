defmodule ElixirKoans do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Display, []),
      worker(Tracker, []),
      worker(Runner, []),
    ]

    opts = [strategy: :one_for_one, name: ElixirKoans.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
