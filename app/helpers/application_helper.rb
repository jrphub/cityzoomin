module ApplicationHelper
  def full_title(page_title)
    base_title="CityZoomin"
    if page_title.empty?
      base_title
    else
      "#{base_title}|#{page_title}"
    end
  end
  
  def random_image
    a=["/assets/bg1.gif","/assets/bg2.gif",
       "/assets/bg3.gif","/assets/bg4.gif",
       "/assets/bg5.gif","/assets/bg6.gif",
       "/assets/bg7.gif","/assets/bg8.gif",
       "/assets/bg9.gif","/assets/bg10.gif",
       "/assets/bg11.gif"]
    a.sample
  end
end
