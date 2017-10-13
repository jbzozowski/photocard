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
      redirect_to processing_card_path
    else
      render :get_photo
    end
  end

  def processing
    @card = Card.find(params[:id])
  end

  def preview
    @card = Card.find(params[:id])
  end

  def deliver
    @card = Card.find(params[:id])
  end

  def thanks
    render layout: false
  end

  def new
  end

  def card_params
    params.require(:card).permit(:photo, :number, :name, :position, :info)
  end


  def pngify
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html { render "cards/templates/#{@card.design}", layout: false }
      format.png do
        kit = IMGKit.new(pngify_card_url(@card), width: 250)

        send_data kit.to_img(:png), type: "image/png", disposition: 'inline'
      end
    end
  end
end
