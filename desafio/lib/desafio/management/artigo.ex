defmodule Desafio.Management.Artigo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artigos" do
    field :nome, :string
    field :resumo, :string
    field :publicado, :boolean
    belongs_to :evento, Desafio.Management.Evento
    timestamps()
  end

  @doc false
  def changeset(artigo, attrs) do
    artigo
    |> cast(attrs, [:nome, :resumo, :publicado, :evento_id])
    |> validate_required([:nome])
  end
end
