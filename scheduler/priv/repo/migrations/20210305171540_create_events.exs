defmodule Scheduler.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :date, :date
      add :desc, :string

      timestamps()
    end

  end
end
