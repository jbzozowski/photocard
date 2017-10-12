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

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to preview_card_path
    else
      render :get_photo
    end
  end

  def get_processing
    redirect_to preview_card_path
  end

  def get_preview
    redirect_to deliver_card_path
  end

  def new
  end

  def card_params
    params.require(:card).permit(:photo, :number, :name, :position, :info)
  end

end
