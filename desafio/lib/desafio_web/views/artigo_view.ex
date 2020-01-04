defmodule DesafioWeb.ArtigoView do
  use DesafioWeb, :view
  alias DesafioWeb.ArtigoView

  def render("index.json", %{artigos: artigos}) do
    %{data: render_many(artigos, ArtigoView, "artigo.json")}
  end

  def render("show.json", %{artigo: artigo}) do
    %{data: render_one(artigo, ArtigoView, "artigo.json")}
  end

  def render("artigo.json", %{artigo: artigo}) do
    %{id: artigo.id,
    nome: artigo.nome,
    resumo: artigo.resumo,
    publicado: artigo.publicado,
    evento_id: artigo.evento_id}
  end
end
