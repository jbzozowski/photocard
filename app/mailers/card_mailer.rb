class CardMailer < ApplicationMailer
  default from: "cards@photocard.herokuapp.com"

  def thank_you_email(card)
    @card = card
    @url = "https://photocard.herokuapp.com"

    kit = IMGKit.new(pngify_card_url(@card), width: 250)

    attachments['card.png'] = kit.to_img(:png)

    mail(to: @card.email, subject: "Here is your card")
  end
end
