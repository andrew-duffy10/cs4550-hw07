defmodule Scheduler.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text
      add :event_id, references(:events), null: false   
      add :user, :string

      timestamps()
    end

  end
end
