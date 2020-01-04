defmodule Desafio.Repo.Migrations.CreateArtigos do
  use Ecto.Migration

  def change do
    create table(:artigos) do
      add :evento_id, references(:eventos)
      add :nome, :string
      add :resumo, :text
      add :publicado, :boolean, default: false
      timestamps()
    end

  end
end
