defmodule DesafioWeb.EventoControllerTest do
  use DesafioWeb.ConnCase

  alias Desafio.Management
  alias Desafio.Management.Evento

  @create_attrs %{
    descricao: "some descricao",
    titulo: "some titulo"
  }
  @update_attrs %{
    descricao: "some updated descricao",
    titulo: "some updated titulo"
  }
  @invalid_attrs %{descricao: nil, titulo: nil}

  def fixture(:evento) do
    {:ok, evento} = Management.create_evento(@create_attrs)
    evento
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all eventos", %{conn: conn} do
      conn = get(conn, Routes.evento_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create evento" do
    test "renders evento when data is valid", %{conn: conn} do
      conn = post(conn, Routes.evento_path(conn, :create), evento: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.evento_path(conn, :show, id))

      assert %{
               "id" => id,
               "descricao" => "some descricao",
               "titulo" => "some titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.evento_path(conn, :create), evento: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update evento" do
    setup [:create_evento]

    test "renders evento when data is valid", %{conn: conn, evento: %Evento{id: id} = evento} do
      conn = put(conn, Routes.evento_path(conn, :update, evento), evento: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.evento_path(conn, :show, id))

      assert %{
               "id" => id,
               "descricao" => "some updated descricao",
               "titulo" => "some updated titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, evento: evento} do
      conn = put(conn, Routes.evento_path(conn, :update, evento), evento: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete evento" do
    setup [:create_evento]

    test "deletes chosen evento", %{conn: conn, evento: evento} do
      conn = delete(conn, Routes.evento_path(conn, :delete, evento))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.evento_path(conn, :show, evento))
      end
    end
  end

  defp create_evento(_) do
    evento = fixture(:evento)
    {:ok, evento: evento}
  end
end
