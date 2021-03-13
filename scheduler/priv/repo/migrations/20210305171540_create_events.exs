defmodule Scheduler.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :date, :date
      add :desc, :string
      add :user_id, references(:users), null: false
        add :guests, {:array, :string}
      timestamps()
    end

  end
end
