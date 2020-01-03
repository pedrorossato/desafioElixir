defmodule DesafioWeb.EventoView do
  use DesafioWeb, :view
  alias DesafioWeb.EventoView

  def render("index.json", %{eventos: eventos}) do
    %{data: render_many(eventos, EventoView, "evento.json")}
  end

  def render("show.json", %{evento: evento}) do
    %{data: render_one(evento, EventoView, "evento.json")}
  end

  def render("evento.json", %{evento: evento}) do
    %{id: evento.id,
      titulo: evento.titulo,
      descricao: evento.descricao}
  end
end
