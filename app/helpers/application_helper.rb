module ApplicationHelper
  def full_title(page_title)
    base_title="CityZoomin"
    if page_title.empty?
      base_title
    else
      "CZ-#{page_title}"
    end
  end
end
