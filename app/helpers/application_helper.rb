# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def markup(s)
    # replacing newlines to <br> ans <p> tags
    # wrapping text into paragraph
    s = "<p>" + s.gsub(/\n\n+/, "</p>\n\n<p>").
                  gsub(/([^\n]\n)(?=[^\n])/, '\1<br />') + "</p>"
  end
  
end
