defmodule DesafioWeb.EventoController do
  use DesafioWeb, :controller

  alias Desafio.Management
  alias Desafio.Management.Evento

  action_fallback DesafioWeb.FallbackController

  def index(conn, _params) do
    eventos = Management.list_eventos()
    render(conn, "index.json-api", data: eventos)
  end

  def create(conn, %{"evento" => evento_params}) do
    with {:ok, %Evento{} = evento} <- Management.create_evento(evento_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.evento_path(conn, :show, evento))
      |> render("show.json-api", data: evento)
    end
  end

  def show(conn, %{"id" => id}) do
    evento = Management.get_evento!(id)
    render(conn, "show.json-api", data: evento)
  end

  def update(conn, %{"id" => id, "evento" => evento_params}) do
    evento = Management.get_evento!(id)

    with {:ok, %Evento{} = evento} <- Management.update_evento(evento, evento_params) do
      render(conn, "show.json-api", data: evento)
    end
  end

  def delete(conn, %{"id" => id}) do
    evento = Management.get_evento!(id)

    with {:ok, %Evento{}} <- Management.delete_evento(evento) do
      send_resp(conn, :no_content, "")
    end
  end
end
