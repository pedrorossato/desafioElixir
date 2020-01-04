defmodule DesafioWeb.EventoView do
  use DesafioWeb, :view
  use JaSerializer.PhoenixView
  alias DesafioWeb.EventoView

  attributes [:nome, :descricao]
end
