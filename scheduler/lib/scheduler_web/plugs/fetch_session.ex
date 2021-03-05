defmodule SchedulerWeb.Plugs.FetchSession do
  import Plug.Conn

  def init(args), do: args
# Credit to Nat Tuck's photoblog lecture https://github.com/NatTuck/scratch-2021-01/blob/master/notes-4550/11-photoblog/notes.md
  def call(conn, _args) do
    user = Scheduler.Users.get_user(get_session(conn, :user_id) || -1)
    if user do
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end
end