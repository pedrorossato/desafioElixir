defmodule Desafio.Management do
  @moduledoc """
  The Management context.
  """

  import Ecto.Query, warn: false
  alias Desafio.Repo

  alias Desafio.Management.Evento

  @doc """
  Returns the list of eventos.

  ## Examples

      iex> list_eventos()
      [%Evento{}, ...]

  """
  def list_eventos do
    Repo.all(Evento)
  end

  @doc """
  Gets a single evento.

  Raises `Ecto.NoResultsError` if the Evento does not exist.

  ## Examples

      iex> get_evento!(123)
      %Evento{}

      iex> get_evento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_evento!(id), do: Repo.get!(Evento, id)

  @doc """
  Creates a evento.

  ## Examples

      iex> create_evento(%{field: value})
      {:ok, %Evento{}}

      iex> create_evento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_evento(attrs \\ %{}) do
    %Evento{}
    |> Evento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a evento.

  ## Examples

      iex> update_evento(evento, %{field: new_value})
      {:ok, %Evento{}}

      iex> update_evento(evento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_evento(%Evento{} = evento, attrs) do
    evento
    |> Evento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Evento.

  ## Examples

      iex> delete_evento(evento)
      {:ok, %Evento{}}

      iex> delete_evento(evento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_evento(%Evento{} = evento) do
    Repo.delete(evento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking evento changes.

  ## Examples

      iex> change_evento(evento)
      %Ecto.Changeset{source: %Evento{}}

  """
  def change_evento(%Evento{} = evento) do
    Evento.changeset(evento, %{})
  end

  alias Desafio.Management.Artigo

  @doc """
  Returns the list of artigos.

  ## Examples

      iex> list_artigos()
      [%Artigo{}, ...]

  """
  def list_artigos do
    Repo.all(Artigo)
  end

  @doc """
  Gets a single artigo.

  Raises `Ecto.NoResultsError` if the Artigo does not exist.

  ## Examples

      iex> get_artigo!(123)
      %Artigo{}

      iex> get_artigo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_artigo!(id), do: Repo.get!(Artigo, id)

  @doc """
  Creates a artigo.

  ## Examples

      iex> create_artigo(%{field: value})
      {:ok, %Artigo{}}

      iex> create_artigo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_artigo(attrs \\ %{}) do
    %Artigo{}
    |> Artigo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a artigo.

  ## Examples

      iex> update_artigo(artigo, %{field: new_value})
      {:ok, %Artigo{}}

      iex> update_artigo(artigo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_artigo(%Artigo{} = artigo, attrs) do
    artigo
    |> Artigo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Artigo.

  ## Examples

      iex> delete_artigo(artigo)
      {:ok, %Artigo{}}

      iex> delete_artigo(artigo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_artigo(%Artigo{} = artigo) do
    Repo.delete(artigo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking artigo changes.

  ## Examples

      iex> change_artigo(artigo)
      %Ecto.Changeset{source: %Artigo{}}

  """
  def change_artigo(%Artigo{} = artigo) do
    Artigo.changeset(artigo, %{})
  end
end
