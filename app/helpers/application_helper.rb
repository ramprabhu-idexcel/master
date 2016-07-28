module ApplicationHelper
  def created_at(date_time)
    if date_time > Time.now.beginning_of_day
      "#{time_ago_in_words(date_time)} ago" # 3 minutes ago, less than a minute ago
    else
      date_time.strftime("%b %d, %Y") # Jun 29, 2012
    end
  end
end
