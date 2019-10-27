module ApplicationHelper
  def current_url
    if request.params[:status] == 'today'
      'Your todays due tasks'
    else
      'Your ongoing tasks'
    end
  end


  def due_date(date)
    unless date.nil?
      words = time_ago_in_words(date)
      "<small>Due in #{words}</small>".html_safe
    end
  end
end
