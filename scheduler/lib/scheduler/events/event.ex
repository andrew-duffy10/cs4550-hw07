defmodule Scheduler.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :date, :date
    field :desc, :string
    field :name, :string
    belongs_to :user, Scheduler.Users.User
    field :guests, {:array, :string}, default: []
    has_many :comments, Scheduler.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :date, :desc, :user_id, :guests])
    |> validate_required([:name, :date, :desc, :user_id, :guests])
  end
end
