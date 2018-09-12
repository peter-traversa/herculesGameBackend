class Api::V1::DecksController < ApplicationController
  before_action :find_deck, only: [:update]
  def index
    @decks = Deck.all
    render json: @decks
  end

  def show
    @deck = Deck.find(params[:id])
    render json: @deck
  end

  def update
    @deck.update(deck_params)
    if @deck.save
      render json: @deck, status: :accepted
    else
      render json: { errors: @deck.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def deck_params
    params.permit(:name, :image_url)
  end

  def find_deck
    @deck = Deck.find(params[:id])
  end
end
