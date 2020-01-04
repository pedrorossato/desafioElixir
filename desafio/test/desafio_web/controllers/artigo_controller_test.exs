defmodule DesafioWeb.ArtigoControllerTest do
  use DesafioWeb.ConnCase

  alias Desafio.Management
  alias Desafio.Management.Artigo

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:artigo) do
    {:ok, artigo} = Management.create_artigo(@create_attrs)
    artigo
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all artigos", %{conn: conn} do
      conn = get(conn, Routes.artigo_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create artigo" do
    test "renders artigo when data is valid", %{conn: conn} do
      conn = post(conn, Routes.artigo_path(conn, :create), artigo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.artigo_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.artigo_path(conn, :create), artigo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update artigo" do
    setup [:create_artigo]

    test "renders artigo when data is valid", %{conn: conn, artigo: %Artigo{id: id} = artigo} do
      conn = put(conn, Routes.artigo_path(conn, :update, artigo), artigo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.artigo_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, artigo: artigo} do
      conn = put(conn, Routes.artigo_path(conn, :update, artigo), artigo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete artigo" do
    setup [:create_artigo]

    test "deletes chosen artigo", %{conn: conn, artigo: artigo} do
      conn = delete(conn, Routes.artigo_path(conn, :delete, artigo))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.artigo_path(conn, :show, artigo))
      end
    end
  end

  defp create_artigo(_) do
    artigo = fixture(:artigo)
    {:ok, artigo: artigo}
  end
end
