module ApplicationHelper
  def render_card(card)
    kit = IMGKit.new("https://github.com/404")

    kit.to_file('output.png')
  end
end
