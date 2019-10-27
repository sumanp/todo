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

  def alert_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

end
