defmodule Desafio.Repo.Migrations.CreateEventos do
  use Ecto.Migration

  def change do
    create table(:eventos) do
      add :titulo, :string
      add :descricao, :text

      timestamps()
    end

  end
end
