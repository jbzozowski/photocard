class CardsController < ApplicationController

  def index
  end

  def show
  end

  def create
    card = Card.create(team: params[:team])

    redirect_to choose_design_card_path(card)
  end

  def choose_design
    @card = Card.find(params[:id])
  end

  def update_design
    @card = Card.find(params[:id])

    @card.update_attributes(design: params[:design])

    redirect_to get_photo_card_path(@card)
  end

  def get_photo
    @card = Card.find(params[:id])
  end

  def update_photo
    @card = Card.find(params[:id])

  end

  def get_processing
    
  end

  def new
  end

end
