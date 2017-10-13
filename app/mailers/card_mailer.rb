class CardMailer < ApplicationMailer
  default from: ""

  def thank_you_email(card)
    @card = card
    @url = ""

    kit = IMGKit.new(pngify_card_url(@card), width: 250)

    attachments['card.png'] = kit.to_img(:png)

    mail(to: @card.email, subject: "Here is your card")
  end
end
