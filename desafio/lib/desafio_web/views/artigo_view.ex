defmodule DesafioWeb.ArtigoView do
  use DesafioWeb, :view
  use JaSerializer.PhoenixView
  alias DesafioWeb.ArtigoView

  attributes [:nome, :resumo, :publicado, :evento_id]
end
