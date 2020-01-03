defmodule Desafio.ManagementTest do
  use Desafio.DataCase

  alias Desafio.Management

  describe "eventos" do
    alias Desafio.Management.Evento

    @valid_attrs %{descricao: "some descricao", titulo: "some titulo"}
    @update_attrs %{descricao: "some updated descricao", titulo: "some updated titulo"}
    @invalid_attrs %{descricao: nil, titulo: nil}

    def evento_fixture(attrs \\ %{}) do
      {:ok, evento} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_evento()

      evento
    end

    test "list_eventos/0 returns all eventos" do
      evento = evento_fixture()
      assert Management.list_eventos() == [evento]
    end

    test "get_evento!/1 returns the evento with given id" do
      evento = evento_fixture()
      assert Management.get_evento!(evento.id) == evento
    end

    test "create_evento/1 with valid data creates a evento" do
      assert {:ok, %Evento{} = evento} = Management.create_evento(@valid_attrs)
      assert evento.descricao == "some descricao"
      assert evento.titulo == "some titulo"
    end

    test "create_evento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_evento(@invalid_attrs)
    end

    test "update_evento/2 with valid data updates the evento" do
      evento = evento_fixture()
      assert {:ok, %Evento{} = evento} = Management.update_evento(evento, @update_attrs)
      assert evento.descricao == "some updated descricao"
      assert evento.titulo == "some updated titulo"
    end

    test "update_evento/2 with invalid data returns error changeset" do
      evento = evento_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_evento(evento, @invalid_attrs)
      assert evento == Management.get_evento!(evento.id)
    end

    test "delete_evento/1 deletes the evento" do
      evento = evento_fixture()
      assert {:ok, %Evento{}} = Management.delete_evento(evento)
      assert_raise Ecto.NoResultsError, fn -> Management.get_evento!(evento.id) end
    end

    test "change_evento/1 returns a evento changeset" do
      evento = evento_fixture()
      assert %Ecto.Changeset{} = Management.change_evento(evento)
    end
  end
end
