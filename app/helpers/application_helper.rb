# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def html(content)
    RedCloth.new(content).to_html unless content.nil?
  end
  
  def spanitize(content)
    content.split(" ").map { |s| "<span>#{s}</span>" }.join(" ")
  end
end
