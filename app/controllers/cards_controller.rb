class CardsController < ApplicationController

  def index3
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


  def preview
    @card = Card.find(params[:id])
  end

  def deliver
    @card = Card.find(params[:id])
  end

  def thanks
    @card = Card.find(params[:id])
    if @card.update(card_params)
      CardMailer.thank_you_email(@card).deliver_later
    else
      flash[:notice] = "You must enter a valid email"
      redirect_to deliver_card_path(@card)
      return
    end

    render layout: false
  end

  def new
  end


  def card_params
    params.require(:card).permit(:number, :name, :position, :photo, :info, :email)
  end


  def pngify
    @card = Card.find(params[:id])

      respond_to do |format|
        if @card.errors.any?
          @card.errors.full_messages
        else
          format.html { render "cards/templates/#{@card.design}", layout: false }
          format.png do
            kit = IMGKit.new(pngify_card_url(@card), width: 200, height: 1040)

            send_data kit.to_img(:png), type: "image/png", disposition: 'inline'
         end
       end
    end
  end
end
