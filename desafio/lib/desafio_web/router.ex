defmodule DesafioWeb.Router do
  use DesafioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :json_api do
    plug :accepts, ["json-api"]
    plug JaSerializer.Deserializer
  end
  scope "/", DesafioWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", DesafioWeb do
    pipe_through :json_api
    resources "/eventos", EventoController, only: [:index, :show]
    resources "/artigos", ArtigoController, only: [:index, :show]
  end
end
