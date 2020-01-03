defmodule Desafio.Management.Evento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eventos" do
    field :descricao, :string
    field :titulo, :string

    timestamps()
  end

  @doc false
  def changeset(evento, attrs) do
    evento
    |> cast(attrs, [:titulo, :descricao])
    |> validate_required([:titulo, :descricao])
  end
end
