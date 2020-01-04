defmodule DesafioWeb.ArtigoController do
  use DesafioWeb, :controller

  alias Desafio.Management
  alias Desafio.Management.Artigo

  action_fallback DesafioWeb.FallbackController

  def index(conn, _params) do
    artigos = Management.list_artigos()
    render(conn, "index.json-api", data: artigos)
  end

  def create(conn, %{"artigo" => artigo_params}) do
    with {:ok, %Artigo{} = artigo} <- Management.create_artigo(artigo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.artigo_path(conn, :show, artigo))
      |> render("show.json-api", data: artigo)
    end
  end

  def show(conn, %{"id" => id}) do
    artigo = Management.get_artigo!(id)
    render(conn, "show.json-api", data: artigo)
  end

  def update(conn, %{"id" => id, "artigo" => artigo_params}) do
    artigo = Management.get_artigo!(id)

    with {:ok, %Artigo{} = artigo} <- Management.update_artigo(artigo, artigo_params) do
      render(conn, "show.json-api", data: artigo)
    end
  end

  def delete(conn, %{"id" => id}) do
    artigo = Management.get_artigo!(id)

    with {:ok, %Artigo{}} <- Management.delete_artigo(artigo) do
      send_resp(conn, :no_content, "")
    end
  end
end
