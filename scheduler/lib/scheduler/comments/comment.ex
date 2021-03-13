defmodule Scheduler.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :user, :string
    belongs_to :event, Scheduler.Events.Event

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :user, :event_id])
    |> validate_required([:body, :user, :event_id])
  end
end
