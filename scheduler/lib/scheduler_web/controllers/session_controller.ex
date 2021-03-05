defmodule SchedulerWeb.SessionController do
  use SchedulerWeb, :controller
    
# Credit to Nat Tuck's lecture notes: https://github.com/NatTuck/scratch-2021-01/blob/master/notes-4550/11-photoblog/notes.md
    
  def create(conn, %{"email" => email}) do
    user = Scheduler.Users.get_user_by_email(email)
    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome #{user.name}, begin scheduling!")
      |> redirect(to: Routes.page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Login failed. User not found.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end
    


  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.login_path(conn, :index))
  end
end